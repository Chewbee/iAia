//
//  iAIADataController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 07/10/12.
//
//

#import "iAIADataController.h"
#import "iAiaViewController.h"

@implementation iAIADataController

#pragma mark -
// Singleton implemention
+(iAIADataController*) sharedInstance {
	static iAIADataController * _theiAIADataController = nil ;

	if ( _theiAIADataController == nil ) {
		_theiAIADataController = [[self alloc]init] ;
	}
	return _theiAIADataController ;
}
//
-(id)init
{
    if (self = [super init]) {
        [self setPersonDataSource:[PersonDataSource sharedInstance]] ;
        if ([self contracts] == nil){
            [self setContracts:[NSMutableArray array]];
        }
        [self setErrorStatus:FALSE];
        return self ;
    }
    return nil ;
}
//
-(void)query
{
    [self setErrorStatus:FALSE];
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:YES] ;
    [[self contracts]removeAllObjects];
    [self invokeServiceContractList] ;
}
//
#pragma mark -
#pragma mark Service invocation
- (void)invokeServiceContractList
{
    //
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    BOOL mocked = [defaults boolForKey:@"mocked"] ;
    // mocked is now a user setting
    if (mocked) {
        [self searchContractMockUp];
        return ;
    } else {
        /*
         NSString *login = [defaults stringForKey:@"login_preference" ] ;
         NSString *password = [defaults stringForKey:@"password_preference" ] ;
         */
        NSString *clientNumber = [defaults stringForKey:@"number_preference" ] ;
        
        // ServiceListContract* service = [ServiceListContract serviceWithUsername:login andPassword:password] ;
        serviceListContract *service = [serviceListContract service] ;
        service.logging = YES;
        
        CSCContract *cscContract = [[CSCContract alloc]init];
        CSCPartyRole *role = [[CSCPartyRole alloc]init];
        CSCPerson *dude = [[CSCPerson alloc]init] ;
        /*
         [dude setFirstName:@"Georges-Henry"];
         [dude setLastName:@"PORTEFAIT"];
         */
        [dude setClientNumber:clientNumber];
        [role setPerson:dude];
        [cscContract.RoleList addObject:role];
        [cscContract setNumber:@"IUL0%"];
        
        // Returns NSMutableArray*.
        [service ContractDisplayExtract:self action:@selector(ServiceContractListHandler:) Environment: [[CSCWMEnv alloc] init] Contract: cscContract ];
    }
}
//
- (void)invokeServiceContractSummary:(NSString*) contractNumber {
    //
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    BOOL mocked = [defaults boolForKey:@"mocked"] ;
    if (mocked) {
        [self contractGetSummaryMockUp];
        return ;
    } else {
        // Create the service
        serviceContractGetSummary* service = [serviceContractGetSummary service] ;
        service.logging = YES;
        
        // Returns CSCContract*.
        [service ContractGetSummary:self action:@selector(ServiceContractSummaryHandler:) Environment: [[CSCWMEnv alloc] init] ActivityRequest: [[CSCActivityRequest alloc] init] Contract: [[CSCContract alloc] init]];
    }
}
#pragma mark -
#pragma mark Service returns
// Handle the response from invokeServiceContractList.
- (void) ServiceContractListHandler: (id) value
{
	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
        NSString *errorMsg = [(NSError*)value localizedDescription] ;
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:errorMsg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView setDelegate:self ] ;
        [alertView show] ;
		return;
	}
	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
        NSString *errorMsg = [(SoapFault*)value faultString] ;
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"Fault" message:errorMsg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView setDelegate:self ] ;
        [alertView show] ;
		return;
    }
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
    // Do something with the NSMutableArray* result
    [self setContracts: (NSMutableArray*)value ];
    [[self viewController ] reload];
}
//
// Handle the response from invokeServiceContractSummary.
- (void) ServiceContractSummaryHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}
	// Do something with the CSCContract* result
    CSCContract* result = (CSCContract*)value;
	NSLog(@"ContractGetSummary returned the value: %@", result);
    [self setErrorStatus:FALSE];
}
//
#pragma mark alert box
- (void)alertView:(UIAlertView *)aView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [aView dismissWithClickedButtonIndex:0 animated:TRUE ] ;
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
    [self setErrorStatus:TRUE] ;
}
//
#pragma mark -
#pragma mark XML flow parsing
-(NSMutableArray*) populateContractArrayWithData:(NSData*) XMLDataFlow
{
    NSMutableArray *resultArray = [NSMutableArray array] ; 
    NSError *err = nil ;
    NSData *XMLData =nil;
    XMLData = XMLDataFlow;
    CXMLDocument *doc = nil ;
    doc = [[CXMLDocument alloc] initWithData:XMLData options:0 error:&err];
    //
    NSArray *nodes = nil ;
    // namespace
    NSDictionary *dict = @{ @"http://www.csc.com/graphtalk/aia" : @"aia"  };
    //  searching for Contract nodes
    nodes = [doc nodesForXPath:@"//*[local-name()='Contract']" namespaceMappings:dict error:&err];
    // namespace
    for (CXMLNode *node in nodes)
    {
        // creating contract objects from content
        CSCContract *contract= [CSCContract createWithNode:node];
        if (contract) {
            [resultArray addObject:contract] ;
        }
    }
    return resultArray ; 
}
#pragma mark -
#pragma mark mockup
-(void) searchContractMockUp
{
    //  using local resource file in mockup mode
    NSString *XMLPath = nil ;
    XMLPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"SearchContractResponse.xml"];
    NSData *XMLData =nil;
    XMLData = [NSData dataWithContentsOfFile:XMLPath];
    //
    [self setContracts:[self populateContractArrayWithData:(NSData*) XMLData]];
    
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
}
//
-(void) contractGetSummaryMockUp
{
    //  using local resource file in mockup mode
    NSString *XMLPath = nil ;
    XMLPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ContractGetSummaryResponse_IUL00000348.xml"];
    NSData *XMLData =nil;
    XMLData = [NSData dataWithContentsOfFile:XMLPath];
    //
    [self setContractsDetailed:[self populateContractArrayWithData:(NSData*) XMLData]];
}
#pragma mark -
#pragma mark Content management
-(NSInteger) contractCount {
    return [[self contracts ]count] ;
}
//
-(CSCContract*) getContractFromIdx:(NSInteger)row
{
    return [[self contracts]objectAtIndex:row] ;
}
@end
