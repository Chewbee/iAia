//
//  KeyChainManager.m

#import "KeyChainManager.h"


@implementation KeyChainManager

static KeyChainManager *sharedManager = nil;

#pragma mark Singleton section

// Singleton implemention
+(KeyChainManager*) sharedManager {
	// singleton variable
	static KeyChainManager * _KeyChainManager = nil ;
	
	if ( _KeyChainManager == nil ) {
		_KeyChainManager = [[self alloc]init] ;
	}
	return _KeyChainManager ;
}
//

- (id)copyWithZone:(NSZone *)zone {
    return self;
}
//
+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if ( sharedManager == nil ) {
            sharedManager = [super allocWithZone:zone];
            return sharedManager;  // assignment and return on first allocation
        }
    }
    return nil; //on subsequent allocation attempts return nil
}

#pragma mark Lifecycle section

- (id)init {
	self = [super init];
	if(nil != self) {
		
	}
	return self;
}
//
#pragma mark Class logic:
#pragma mark Private common methods section

- (NSMutableDictionary *)newSearchDictionaryCert:(NSString *)identifier {
    NSMutableDictionary *searchDictionary = [[NSMutableDictionary alloc] init];  
	
	[searchDictionary setObject:(__bridge id)kSecClassCertificate forKey:(__bridge id)kSecClass];
	[searchDictionary setObject:identifier forKey:(__bridge id)kSecAttrLabel];
	
    return searchDictionary; 
}

- (NSMutableDictionary *)newSearchDictionary:(NSString *)identifier {
    NSMutableDictionary *searchDictionary = [[NSMutableDictionary alloc] init];  
	
	[searchDictionary setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
	
    NSData *encodedIdentifier = [identifier dataUsingEncoding:NSUTF8StringEncoding];
    [searchDictionary setObject:encodedIdentifier forKey:(__bridge id)kSecAttrGeneric];
    [searchDictionary setObject:encodedIdentifier forKey:(id)kSecAttrAccount];
    [searchDictionary setObject:[[NSBundle mainBundle] bundleIdentifier] forKey:(__bridge id)kSecAttrService];
	
    return searchDictionary; 
}

- (BOOL)searchKeychainCopyMatchingCert:(NSString *)identifier {
    NSMutableDictionary *searchDictionary = [self newSearchDictionaryCert:identifier];
	
    [searchDictionary setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
	[searchDictionary setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnRef];
	
    CFTypeRef result = NULL;
	OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)searchDictionary, &result);

	if(result) {
		CFRelease(result);
		result = NULL;
	}
	
	if(errSecItemNotFound == status) {
		return NO;
	}
	// else errSecSuccess == status
	else {
		return YES;
	}
}

- (NSString *)searchKeychainCopyMatching:(NSString *)identifier {
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];

    [searchDictionary setObject:(id)kSecMatchLimitOne forKey:(__br__bridge SecMatchLimit];
	[searchDictionary setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
	
    NSData *result = nil;
	SecItemCopyMatching((CFDictionaryRef)searchDictionary,
                        (CFTypeRef *)&result);
    [searchDictionary release];
	
	NSString *res = nil;
	if (result) {
        res = [[[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding] autorelease];
        [result release];
    }	
    return res;
}

- (BOOL)createKeychainCert:(SecCertificateRef)cert forIdentifier:(NSString *)identifier {
	NSMutableDictionary *dictionary = [self newSearchDictionaryCert:identifier];
	
	[dictionary setObject:(id)cert forKey:(id)kSecValueRef];
	
	OSStatus status = SecItemAdd((CFDictionaryRef)dictionary, NULL);
    [dictionary release];
	
    if (status == errSecSuccess) {
        return YES;
    }
    return NO;
}

- (BOOL)createKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier {
    NSMutableDictionary *dictionary = [self newSearchDictionary:identifier];
	
    NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
    [dictionary setObject:valueData forKey:(id)kSecValueData];
	
	OSStatus status = SecItemAdd((CFDictionaryRef)dictionary, NULL);
    [dictionary release];
	
    if (status == errSecSuccess) {
        return YES;
    }
    return NO;
}

- (BOOL)updateKeychainValue:(NSString *)value forIdentifier:(NSString *)identifier {
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    NSMutableDictionary *updateDictionary = [[NSMutableDictionary alloc] init];
    NSData *valueData = [value dataUsingEncoding:NSUTF8StringEncoding];
    [updateDictionary setObject:valueData forKey:(id)kSecValueData];
	
    OSStatus status = SecItemUpdate((CFDictionaryRef)searchDictionary, (CFDictionaryRef)updateDictionary);
	
    [searchDictionary release];
    [updateDictionary release];
	
    if (status == errSecSuccess) {
        return YES;
    }
    return NO;
}

- (void)deleteKeychainValue:(NSString *)identifier {
    NSMutableDictionary *searchDictionary = [self newSearchDictionary:identifier];
    SecItemDelete((CFDictionaryRef)searchDictionary);
    [searchDictionary release];
}

#pragma mark Public methods section

- (BOOL)saveLogin:(NSString*)login andPassword:(NSString*)password {
	// Login
	NSString *stored = [self searchKeychainCopyMatching:K_LOGIN];
	if(nil == stored) {
		BOOL res = [self createKeychainValue:login forIdentifier:K_LOGIN];
		if(!res)
			return NO;
	}
	else {
		if(![stored isEqualToString:login]) {
			[self deleteKeychainValue:K_LOGIN];
			BOOL res = [self createKeychainValue:login forIdentifier:K_LOGIN];
			if(!res)
				return NO;
		}
	}
	// Password
	stored = [self searchKeychainCopyMatching:K_PASSWORD];
	if(nil == stored) {
		BOOL res = [self createKeychainValue:password forIdentifier:K_PASSWORD];
		if(!res)
			return NO;
	}
	else {
		if(![stored isEqualToString:password]) {
			[self deleteKeychainValue:K_PASSWORD];
			BOOL res = [self createKeychainValue:password forIdentifier:K_PASSWORD];
			if(!res)
				return NO;
		}
	}
	return YES;
}

- (NSString*)getLogin {
	return [self searchKeychainCopyMatching:K_LOGIN];
}

- (NSString*)getPassword {
	return [self searchKeychainCopyMatching:K_PASSWORD];
}

- (void)clearCredentials {
	[self deleteKeychainValue:K_LOGIN];
	[self deleteKeychainValue:K_PASSWORD];
}

- (void)saveCertificatesFromTrust:(SecTrustRef)trustRef {
	CFIndex count = SecTrustGetCertificateCount(trustRef);
	if(0 < count) {
		SecCertificateRef AnchorCert = SecTrustGetCertificateAtIndex(trustRef, count - 1);
		CFStringRef certSummary = SecCertificateCopySubjectSummary(AnchorCert);
		
		[self createKeychainCert:AnchorCert forIdentifier:(NSString *)certSummary];
	}
}

- (BOOL)isSavedTrust:(SecTrustRef)trustRef {
	CFIndex count = SecTrustGetCertificateCount(trustRef);
	BOOL result = NO;
	if(0 < count) {
		SecCertificateRef AnchorCert = SecTrustGetCertificateAtIndex(trustRef, count - 1);
		CFStringRef certSummary = SecCertificateCopySubjectSummary(AnchorCert);
		
		result = [self searchKeychainCopyMatchingCert:(NSString *)certSummary];
	}
	return result;
}

@end
