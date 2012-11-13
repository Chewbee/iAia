//
//  KeyChainManager.h

#import <Foundation/Foundation.h>
#import <Security/Security.h>

#define K_LOGIN @"login"
#define K_PASSWORD @"password"
#define K_AUTO @"auto"
#define K_YES @"yes"

@interface KeyChainManager : NSObject {
}

+ (KeyChainManager*)sharedManager;

- (BOOL)saveLogin:(NSString*)login andPassword:(NSString*)password;
- (NSString*)getLogin;
- (NSString*)getPassword;
- (void)clearCredentials;
- (void)saveCertificatesFromTrust:(SecTrustRef)trustRef;
- (BOOL)isSavedTrust:(SecTrustRef)trustRef;

@end
