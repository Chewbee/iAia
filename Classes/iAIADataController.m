//
//  iAIADataController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 07/10/12.
//
//

#import "iAIADataController.h"

@implementation iAIADataController

@synthesize personDataSource  ;

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
        personDataSource =[PersonDataSource sharedInstance] ;
        if ([self contracts] == nil){
            [self setContracts:[NSMutableArray array]];
        }
        return self ;
    }
    return nil ;
}
-(void)query
{
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:YES] ;
    [[self contracts]removeAllObjects];
    [self invokeServiceContractList] ;
}
//
#pragma mark -
#pragma Service invocation
- (void)invokeServiceContractList
{
#ifdef MOCKING
    [self searchContractMockUp];
    return ;
#else
	// Create the service
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
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
	[service ContractDisplayExtract:self action:@selector(ContractDisplayExtractHandler:) Environment: [[CSCWMEnv alloc] init] Contract: cscContract ];
#endif
}
#pragma mark -
#pragma mark Service returns
// Handle the response from ContractDisplayExtract.
- (void) ContractDisplayExtractHandler: (id) value
{
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
    // Do something with the NSMutableArray* result
    [self setContracts: (NSMutableArray*)value ];
#ifdef MOCKING
    return ;
#else
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
#endif
}
//
- (void)invokeServiceContractSummary {

    /*
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;

     NSString *login = [defaults stringForKey:@"login_preference" ] ;
     NSString *password = [defaults stringForKey:@"password_preference" ] ;
     */
    // Create the service
	// serviceContractGetSummary* service = [serviceContractGetSummary serviceWithUsername:login andPassword:password];
    serviceContractGetSummary* service = [serviceContractGetSummary service] ;
	service.logging = YES;

#ifdef MOCKUP
#else
    // Returns CSCContract*.
	[service ContractGetSummary:self action:@selector(ContractGetSummaryHandler:) Environment: [[CSCWMEnv alloc] init] ActivityRequest: [[CSCActivityRequest alloc] init] Contract: [[CSCContract alloc] init]];
#endif
}
// Handle the response from ContractGetSummary.
- (void) ContractGetSummaryHandler: (id) value {

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
}
//
- (void)alertView:(UIAlertView *)aView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [aView dismissWithClickedButtonIndex:0 animated:TRUE ] ;
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
}
//
#pragma mark -
#pragma mark XML flow parsing
-(void) populateContractArrayWithData:(NSData*) XMLDataFlow
{
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
            [self.contracts addObject:contract] ;
        }
    }
}
#pragma mark -
#pragma mark mockup
-(void) searchContractMockUp
{
    //  using local resource file in mockup mode
    NSString *XMLPath = nil ;
    XMLPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"SearchContractResponse.txt"];
    NSData *XMLData =nil;
    XMLData = [NSData dataWithContentsOfFile:XMLPath];
    //
    [self populateContractArrayWithData:(NSData*) XMLData];
    
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
    [self populateContractArrayWithData:(NSData*) XMLData];
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
