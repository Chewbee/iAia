//
//  NSMutableURLRequest+AIAHmac.h
//  AIA Life
//
//  Created by Georges-Henry PORTEFAIT on 18/03/2014.
//  Copyright (c) 2014 Fidel ID. All rights reserved.
//

#import "NSMutableURLRequest+AIAHmac.h"

@implementation NSMutableURLRequest (AIAHmac)

#pragma mark -
- (void)signWithAIAHmac: (NSString *)clientId secretKey:(NSString *)secretKey body:(NSString *)body
{
	/*
	 * Create the Nonce value
	 */
    uint8_t nonce[sizeof(int)] ;
 	SecRandomCopyBytes ( kSecRandomDefault ,
                            sizeof(int),
                            nonce
                            );

	/*
	 * Create the HTTP-compliant date value
	 */
    NSDate *currentDate = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]] ;
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [dateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss 'GMT'"];
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    
	/*
	 * Create the canonical string from which the digest will be calculated
	 *
	 ///TODO: Only add last "\012%@" and body if method is one of "POST", "PUT", or "PATCH"
	 ///TODO: method is one of "POST", "PUT", or "PATCH" and body is NULL, throw an error
	 */

    NSString *canonical =[[ NSString alloc]initWithFormat:@"%@\012date:%@\012nonce:%d\012%@\012%@", [[self HTTPMethod]uppercaseString], currentDateString , (int)nonce, [self URL], body ];
    NSData   *canonicalBytes = [canonical dataUsingEncoding:NSUTF8StringEncoding] ;

	NSLog(@"Canonical: '%@'", canonical);
  
	/*
	 * Decode the secret key from it's Base64 encoded form
	 */
    NSData *decodedKey =[[NSData alloc] initWithBase64Encoding: secretKey];
    
	/*
	 * Calculate the digest, and encode as Base 64
	 */
    void *macOut = malloc(CC_SHA256_DIGEST_LENGTH);
    CCHmac(
           kCCHmacAlgSHA256,        /* kCCHmacSHA1, kCCHmacMD5 */
           [decodedKey bytes] ,     /* Key string decoded from it's Base64 representation */
           [decodedKey length],     /* length of key in bytes */
           [canonicalBytes bytes],  /* UTF-8-encoded canonical string */
           [canonicalBytes length], /* length of data in bytes */
           macOut)                  /* MAC written here */
    ;
    NSData   *digestBytes  = [[NSData alloc ]initWithBytes:macOut length:CC_SHA256_DIGEST_LENGTH ] ;
    NSString *digestBase64 = [digestBytes base64EncodedStringWithOptions:0];

    NSLog(@"HMAC Digest'%@'", digestBase64);
  
	/*
	 * Return the headers that the caller must add to the HTTP request
	 */
	[self setValue:currentDateString forHTTPHeaderField:@"X-HMAC-DATE"];                                                                // "X-HMAC-DATE": hmacDate,
	[self setValue:[[NSString alloc] initWithFormat:@"%d",(int)nonce] forHTTPHeaderField:@"X-HMAC-NONCE"];                              // "X-HMAC-NONCE": nonce,
	[self setValue:[[NSString alloc]initWithFormat:@"HmacSHA256 %@ %@", clientId, digestBase64] forHTTPHeaderField:@"Authorization"];   // "Authorization": "HmacSHA256 " + clientId + " " + digestBase64
}

@end
