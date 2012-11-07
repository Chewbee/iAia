//
//  serviceConfigurator.m
//  iAia
//
//  Created by Georges-Henry Portefait on 30/10/12.
//
//

#import "serviceConfigurator.h"

@implementation serviceConfigurator

// Singleton implemention
+(serviceConfigurator*) sharedInstance {
	// singleton variable
	static serviceConfigurator * _serviceConfigurator = nil ;

	if ( _serviceConfigurator == nil ) {
		_serviceConfigurator = [[self alloc]init] ;
	}
	return _serviceConfigurator ;
}
//
-(void) configureService:(SoapService*) service
{
    // https://ec2-176-34-72-149.eu-west-1.compute.amazonaws.com/graphtalk/soap/services
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    NSString *theService = [[NSMutableString alloc] initWithString:@""] ;
    theService =[theService stringByAppendingString: [defaults stringForKey:@"server" ]];

    [service setServiceUrl: theService] ;
    [service setNamespace:@"http://www.csc.com/graphtalk/aia/" ];
    [service setLogging:TRUE];
    // header for security
    NSMutableDictionary * headers = [[NSMutableDictionary alloc]init];
    NSString *literalString = [NSString
                               stringWithFormat:@"<userName>%@</userName><userPassword>%@</userPassword>",
                               [defaults stringForKey:@"login_preference"],
                               [defaults stringForKey:@"password_preference"]];
    SoapLiteral *soapLiteral =[SoapLiteral
                               literalWithString: literalString];
    [headers setValue:soapLiteral forKey:@"header"];
    [service setHeaders: headers];
    return ;
}

@end
