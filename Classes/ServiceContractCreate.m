/*
	ServiceContractCreate
	The implementation classes and methods for the ServiceContractCreate web service.
*/

#import "ServiceContractCreate.h"
#import "serviceConfigurator.h"

/* Implementation of the service */
				
@implementation ServiceContractCreate

	- (id) init
	{
		if(self = [super init])
		{
			[[serviceConfigurator sharedInstance]configureService:self];
		}
		return self;
	}
	
	- (id) initWithUsername: (NSString*) username andPassword: (NSString*) password {
		if(self = [super initWithUsername:username andPassword:password]) {
		}
		return self;
	}
	
	+ (ServiceContractCreate*) service {
		return [ServiceContractCreate serviceWithUsername:nil andPassword:nil];
	}
	
	+ (ServiceContractCreate*) serviceWithUsername: (NSString*) username andPassword: (NSString*) password {
		return [[ServiceContractCreate alloc] initWithUsername:username andPassword:password];
	}

		
	/* Returns CSCContract*.  */
	- (SoapRequest*) ContractCreate: (id <SoapDelegate>) handler Environment: (CSCWMEnv*) Environment ActivityRequest: (CSCActivityRequest*) ActivityRequest SavingsScheme: (CSCSavingsScheme*) SavingsScheme Contract: (CSCContract*) Contract
	{
		return [self ContractCreate: handler action: nil Environment: Environment ActivityRequest: ActivityRequest SavingsScheme: SavingsScheme Contract: Contract];
	}

	- (SoapRequest*) ContractCreate: (id) _target action: (SEL) _action Environment: (CSCWMEnv*) Environment ActivityRequest: (CSCActivityRequest*) ActivityRequest SavingsScheme: (CSCSavingsScheme*) SavingsScheme Contract: (CSCContract*) Contract
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		[_params addObject: [[SoapParameter alloc] initWithValue: Environment forName: @"Environment"]];
		[_params addObject: [[SoapParameter alloc] initWithValue: ActivityRequest forName: @"ActivityRequest"]];
		[_params addObject: [[SoapParameter alloc] initWithValue: SavingsScheme forName: @"SavingsScheme"]];
		[_params addObject: [[SoapParameter alloc] initWithValue: Contract forName: @"Contract"]];
		NSString* _envelope = [Soap createEnvelope: @"ContractCreate" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"ContractCreate" postData: _envelope deserializeTo: [CSCWMStatus alloc]];
		[_request send];
		return _request;
	}


@end
	