/*
 SoapRequest.m
 Implementation of the request object used to manage asynchronous requests.
 Author:	Jason Kichline, andCulture - Harrisburg, Pennsylvania USA
 */

#import "SoapRequest.h"
#import "SoapArray.h"
#import "SoapFault.h"
#import "Soap.h"
#import <objc/message.h>

@implementation SoapRequest

@synthesize handler, url, soapAction, postData, receivedData, username, password, deserializeTo, action, logging, defaultHandler ;

// Creates a request to submit from discrete values.
+ (SoapRequest*) create: (SoapHandler*) handler urlString: (NSString*) urlString soapAction: (NSString*) soapAction postData: (NSString*) postData deserializeTo: (id) deserializeTo {
	return [SoapRequest create: handler action: nil urlString: urlString soapAction: soapAction postData: postData deserializeTo: deserializeTo];
}

+ (SoapRequest*) create: (SoapHandler*) handler action: (SEL) action urlString: (NSString*) urlString soapAction: (NSString*) soapAction postData: (NSString*) postData deserializeTo: (id) deserializeTo {
	SoapRequest* request = [[SoapRequest alloc] init];
	request.url = [NSURL URLWithString: urlString];
	request.soapAction = soapAction;
	request.postData = postData;
	request.handler = handler;
	request.deserializeTo = deserializeTo;
	request.action = action;
	request.defaultHandler = nil;
	return request;
}

+ (SoapRequest*) create: (SoapHandler*) handler action: (SEL) action service: (SoapService*) service soapAction: (NSString*) soapAction postData: (NSString*) postData deserializeTo: (id) deserializeTo {
	SoapRequest* request = [SoapRequest create: handler action: action urlString: service.serviceUrl soapAction: soapAction postData:postData deserializeTo:deserializeTo];
	request.defaultHandler = service.defaultHandler;
	request.logging = service.logging;
	request.username = service.username;
	request.password = service.password;
	return request;
}

// Sends the request via HTTP.
- (void) send {
	
	// If we don't have a handler, create a default one
	if(handler == nil) {
		handler = [[SoapHandler alloc] init];
	}
	
	// Make sure the network is available
	if([SoapReachability connectedToNetwork] == NO) {
		NSError* error = [NSError errorWithDomain:@"CSC" code:400 userInfo:@{NSLocalizedDescriptionKey: @"The network is not available"}];
		[self handleError: error];
	}
	
	// Make sure we can reach the host
	if([SoapReachability hostAvailable:url.host] == NO) {
		NSError* error = [NSError errorWithDomain:@"CSC" code:410 userInfo:@{NSLocalizedDescriptionKey: @"The host is not available"}];
		[self handleError: error];
	}
	
	// Output the URL if logging is enabled
	if( logging ) {
		NSLog(@"Loading: %@", url.absoluteString);
	}
	
	// Create the request
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: url];
	if(soapAction != nil) {
		[request addValue: soapAction forHTTPHeaderField: @"SOAPAction"];
	}
	if(postData != nil) {
		[request setHTTPMethod: @"POST"];
		[request addValue: @"text/xml; charset=utf-8" forHTTPHeaderField: @"Content-Type"];
		[request setHTTPBody: [postData dataUsingEncoding: NSUTF8StringEncoding]];
		if(self.logging) {
			NSLog(@"Postdata: %@", postData);
		}
	}
	
	// Create the connection
	conn = [[NSURLConnection alloc] initWithRequest: request delegate: self];
	if(conn) {
		receivedData = [NSMutableData data];
	} else {
		// We will want to call the onerror method selector here...
		if(self.handler != nil) {
			NSError* error = [NSError errorWithDomain:@"SoapRequest" code:404 userInfo: @{NSLocalizedDescriptionKey: @"Could not create connection"}];
			[self handleError: error];
		}
	}
}

-(void)handleError:(NSError*)error{
	SEL onerror = @selector(onerror:);
	if(self.action != nil) { onerror = self.action; }
	if([self.handler respondsToSelector: onerror]) {
		objc_msgSend(self.handler, onerror, error);
	} else {
		if(self.defaultHandler != nil && [self.defaultHandler respondsToSelector:onerror]) {
			objc_msgSend(self.defaultHandler, onerror, error);
		}
	}
	if(self.logging) {
		NSLog(@"Error in SOAP Request: %@", error.localizedDescription);
	}
}

-(void)handleFault:(SoapFault*)fault{
	if([self.handler respondsToSelector:@selector(onfault:)]) {
		[self.handler onfault: fault];
	} else if(self.defaultHandler != nil && [self.defaultHandler respondsToSelector:@selector(onfault:)]) {
		[self.defaultHandler onfault:fault];
	}
	if(self.logging) {
		NSLog(@"Fault in SOAP Request: %@", fault);
	}
}

// Called when the HTTP socket gets a response.
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.receivedData setLength:0];
}

// Called when the HTTP socket received data.
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)value {
    [self.receivedData appendData:value];
}

// Called when the HTTP request fails.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	conn = nil;
	[self handleError:error];
}

// Called when the connection has finished loading.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSError* error;
	if(self.logging == YES) {
		NSString* response = [[NSString alloc] initWithData: self.receivedData encoding: NSUTF8StringEncoding];
		NSLog(@"Response: %@", response);
	}
	
	CXMLDocument* doc = [[CXMLDocument alloc] initWithData: self.receivedData options: 0 error: &error];
	if(doc == nil) {
		[self handleError:error];
		return;
	}
	
	id output = nil;
	SoapFault* fault = [SoapFault faultWithXMLDocument: doc];
	
	if([fault hasFault]) {
		if(self.action == nil) {
			[self handleFault: fault];
		} else {
			if(self.handler != nil && [self.handler respondsToSelector: self.action]) {
				objc_msgSend(self.handler, self.action, fault);
			} else {
				NSLog(@"SOAP Fault: %@", fault);
			}
		}
	} else {
		CXMLNode* element = [[Soap getNode: [doc rootElement] withName: @"soap:Body"] childAtIndex:0];
		if(deserializeTo == nil) {
			output = [Soap deserialize:element];
		} else {
			if([deserializeTo respondsToSelector: @selector(initWithNode:)]) {
				element = [element childAtIndex:0];
				output = [deserializeTo initWithNode: element];
			} else {
				NSString* value = [[[element childAtIndex:0] childAtIndex:0] stringValue];
				output = [Soap convert: value toType: deserializeTo];
			}
		}
		
		if(self.action == nil) { self.action = @selector(onload:); }
		if(self.handler != nil && [self.handler respondsToSelector: self.action]) {
			objc_msgSend(self.handler, self.action, output);
		} else if(self.defaultHandler != nil && [self.defaultHandler respondsToSelector:@selector(onload:)]) {
			[self.defaultHandler onload:output];
		}
	}
	conn = nil;
}

//// Called if the HTTP request receives an authentication challenge.
//-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
//	if([challenge previousFailureCount] == 0) {
//		NSURLCredential *newCredential;
//        newCredential=[NSURLCredential credentialWithUser:self.username password:self.password persistence:NSURLCredentialPersistenceNone];
//        [[challenge sender] useCredential:newCredential forAuthenticationChallenge:challenge];
//    } else {
//        [[challenge sender] cancelAuthenticationChallenge:challenge];
//		NSError* error = [NSError errorWithDomain:@"SoapRequest" code:403 userInfo: @{NSLocalizedDescriptionKey: @"Could not authenticate this request"}];
//		[self handleError:error];
//    }
//}

// Cancels the HTTP request.
- (BOOL) cancel {
	if(conn == nil) { return NO; }
	[conn cancel];
	conn = nil;
	return YES;
}

// Called if the HTTP request receives an authentication challenge.
- (BOOL)connection:(NSURLConnection *)aConnection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    BOOL res = [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
    return res;
}

- (void)connection:(NSURLConnection *)aConnection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    UIAlertView *av = nil;

    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        SecTrustResultType trustEvalResult = kSecTrustResultInvalid;
        OSStatus ossTrust = SecTrustEvaluate(challenge.protectionSpace.serverTrust, &trustEvalResult);
        if(errSecSuccess != ossTrust) {
            //NSLog(@"ossTrust error");
            return;
        }
        switch(trustEvalResult) {
            case kSecTrustResultUnspecified:
                [[challenge sender] continueWithoutCredentialForAuthenticationChallenge:challenge];
                //NSLog(@"ResultUnspecified");
                break;
            case kSecTrustResultInvalid:
                av = [[UIAlertView alloc] initWithTitle:@"error"
                                                message:@"cert_obtain_error"
                                               delegate:nil
                                      cancelButtonTitle:@"ok"
                                      otherButtonTitles:nil];
                [av show];
                [[challenge sender] cancelAuthenticationChallenge:challenge];
                //NSLog(@"Invalid");
                break;
            case kSecTrustResultConfirm:
                [[challenge sender] continueWithoutCredentialForAuthenticationChallenge:challenge];
                //NSLog(@"Confirm");
                break;
            case kSecTrustResultProceed:
                [[challenge sender] continueWithoutCredentialForAuthenticationChallenge:challenge];
                //NSLog(@"Proceed");
                break;
            case kSecTrustResultDeny:
                av = [[UIAlertView alloc] initWithTitle:@"error"
                                                message:@"cert_obtain_error"
                                               delegate:nil
                                      cancelButtonTitle:@"ok"
                                      otherButtonTitles:nil];
                [av show];
                [[challenge sender] cancelAuthenticationChallenge:challenge];
                //NSLog(@"Deny");
                break;
            case kSecTrustResultRecoverableTrustFailure:
                //NSLog(@"ResultRecoverableTrustFailure");
                [self confirmUntrustedCert:challenge];
                break;
            case kSecTrustResultFatalTrustFailure:
                av = [[UIAlertView alloc] initWithTitle:@"error"
                                                message:@"cert_obtain_error"
                                               delegate:nil
                                      cancelButtonTitle:@"ok"
                                      otherButtonTitles:nil];
                [av show];
                [[challenge sender] cancelAuthenticationChallenge:challenge];
                //NSLog(@"FatalTrustFailure");
                break;
            case kSecTrustResultOtherError:
                av = [[UIAlertView alloc] initWithTitle:@"error"
                                                message:@"cert_obtain_error"
                                               delegate:nil
                                      cancelButtonTitle:@"ok"
                                      otherButtonTitles:nil];
                [av show];
                [[challenge sender] cancelAuthenticationChallenge:challenge];
                //NSLog(@"OtherError");
                break;
            default:
                [[challenge sender] continueWithoutCredentialForAuthenticationChallenge:challenge];
                break;
		}
    }
    else {
        if([challenge previousFailureCount] == 0) {
            NSURLCredential *newCredential;
            newCredential=[NSURLCredential credentialWithUser:self.username password:self.password persistence:NSURLCredentialPersistenceNone];
            [[challenge sender] useCredential:newCredential forAuthenticationChallenge:challenge];
        } else {
            [[challenge sender] cancelAuthenticationChallenge:challenge];
            NSError* error = [NSError errorWithDomain:@"SoapRequest" code:403 userInfo: [NSDictionary dictionaryWithObjectsAndKeys:@"could_not_authenticate_request", NSLocalizedDescriptionKey,nil]];
            [self handleError:error];
        }
    }
}
//
- (void)confirmUntrustedCert:(NSURLAuthenticationChallenge*)challenge {
    confirmNeed = challenge ;
    // Here you need to check current serverTrust. Maybe it is already saved as trusted?
    // In this example KeyChain is used.
    /*
     //FIXME: KeyChainManager
     if([[KeyChainManager sharedManager] isSavedTrust:confirmNeed.protectionSpace.serverTrust]) {
        if(nil != confirmNeed) {
            [confirmNeed.sender useCredential:[NSURLCredential credentialForTrust:confirmNeed.protectionSpace.serverTrust] forAuthenticationChallenge:confirmNeed];
            confirmNeed = nil;
        }
    }
    else */{
        if(nil != self.requestDelegate) {
            if([self.requestDelegate respondsToSelector:@selector(requestNeedsUserInteraction)]) {
                [self.requestDelegate requestNeedsUserInteraction];
            }
        }

        avConfirmation = [[UIAlertView alloc] initWithTitle:@"untrusted certificate"
                                                    message:@"What you would do?"
                                                   delegate:self
                                          cancelButtonTitle:@"stop connection"
                                          otherButtonTitles:@"proceed this time", @"add to trusted", nil];
        [avConfirmation show];
    }
}
//
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    avConfirmation = nil;

    if(nil != self.requestDelegate) {
        if([self.requestDelegate respondsToSelector:@selector(requestUserInteractionEnds)]) {
            [self.requestDelegate requestUserInteractionEnds];
        }
    }
    // "Stop connection"
    if(0 == buttonIndex) {
        [[confirmNeed sender] cancelAuthenticationChallenge:confirmNeed];
    }
    // "Proceed this time (once)"
    if(1 == buttonIndex) {
        if(nil != confirmNeed) {
            [confirmNeed.sender useCredential:[NSURLCredential credentialForTrust:confirmNeed.protectionSpace.serverTrust] forAuthenticationChallenge:confirmNeed];
        }
    }
    // "Add to trusted (always proceed without prompt)"
    if(2 == buttonIndex) {
        if(nil != confirmNeed) {
            // Here you need to store the certificate for the future checks
            // In this example KeyChain is used.
           //FIXME:  [[KeyChainManager sharedManager] saveCertificatesFromTrust:confirmNeed.protectionSpace.serverTrust];
            [confirmNeed.sender useCredential:[NSURLCredential credentialForTrust:confirmNeed.protectionSpace.serverTrust] forAuthenticationChallenge:confirmNeed];
        }
    }
    if(nil != confirmNeed) {
        confirmNeed = nil;
    }
}
@end