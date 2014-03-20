//
//  NSMutableURLRequest+AIAHmac.h
//  AIA Life
//
//  Created by Georges-Henry PORTEFAIT on 18/03/2014.
//  Copyright (c) 2014 Fidel ID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>
#import <Security/Security.h>
#import <Security/SecRandom.h>


@interface NSMutableURLRequest (AIAHmac)

- (void)signWithAIAHmac: (NSString *)clientId secretKey:(NSString *)secretKey body:(NSString *)body ; 

@end
