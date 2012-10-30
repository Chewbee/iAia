//
//  serviceConfigurator.h
//  iAia
//
//  Created by Georges-Henry Portefait on 30/10/12.
//
//

#import <Foundation/Foundation.h>
#import "SoapService.h"
#import "SoapLiteral.h"

@interface serviceConfigurator : NSObject

+(serviceConfigurator*) sharedInstance ;
-(void) configureService:(SoapService*) service ;

@end
