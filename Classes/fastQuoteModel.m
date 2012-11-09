//
//  fastQuoteModel.m
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import "FastQuoteModel.h"

@implementation FastQuoteModel

-(id)init
{
    if ((self = [super init]) != nil) {
        [self setFamilyStructure:0];
        [self setBirthDates:[[NSMutableDictionary alloc ]init]];
        [self setState:0];

        // Do any additional setup after loading the view.

        [self setFamilyStructureArray:@[    @"Single",  @"Couple",      @"Family" , @"Family w/o minor",    @"Single family"]] ;
        [self setFamilyCode:@[               @"single3", @"partner1",    @"married", @"divorced",            @"divorced"]];
        [self setStatesArray:@[@"Australian Capital Territory", @"New South Wales", @"Queensland",  @"Southern Australia",  @"Tasmania",@"Victoria",@"Western Australia"]];
        [self setStatesCode: @[@"ACT",                          @"NSW",             @"QLD",         @"SA",                  @"TAS",     @"VIC",     @"WA"]];
    }
    return self ;
}
- (NSString*) familyString
{
    return ( [ [self familyCode ] objectAtIndex:[self familyStructure ]]) ;
}
- (NSString*) stateString
{
    return ( [ [self statesCode ] objectAtIndex:[self state ]] ) ;
}
-(NSArray*) birthDatesArray
{
    NSArray *resultArray = nil ;
    
    if ([self.birthDates count] )
        resultArray = @[[self.birthDates objectForKey:@"subscriber"],[self.birthDates objectForKey:@"partner"]] ;
    else resultArray = @[[NSDate dateWithTimeIntervalSinceNow: - 504576000]];

    return resultArray ;
}
//
- (void)invokeServiceProductExtract:(NSString*) productIdentifier {
    //
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    BOOL mocked = [defaults boolForKey:@"mocked"] ;
    if (mocked) {
        [self productExtractMockUp];
        return ;
    } else {
        /*
         NSString *login = [defaults stringForKey:@"login_preference" ] ;
         NSString *password = [defaults stringForKey:@"password_preference" ] ;
         serviceProductExtract* service = [serviceProductExtract serviceWithUsername:login andPassword:password] ;
         */
        serviceProductExtract *service = [serviceProductExtract service] ;
        service.logging = YES;

        CSCContract *cscContract = [[CSCContract alloc]init];
        // HE_MEDI01
        [cscContract setProductIdentifier:@"HE_%"];

        // Returns CSCContract*.
        [service ProductExtract:self action:@selector(ServiceProductExtractHandler:) Environment: [[CSCWMEnv alloc] init] ActivityRequest: [[CSCActivityRequest alloc] init] Contract:cscContract ];
    }
}
// Handle the response from invokeServiceProductExtract.
- (void) ServiceProductExtractHandler: (id) value {

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
	NSLog(@"ServiceProductExtractHandler returned the value: %@", result);
}
//
-(void) productExtractMockUp
{
    //  using local resource file in mockup mode
    NSString *XMLPath = nil ;
    XMLPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ProductExtractResponse.xml"];
    NSData *XMLData =nil;
    XMLData = [NSData dataWithContentsOfFile:XMLPath];
    //FIXME: IT IS a product that is returned
    [self setProductDetail:[self populateContractArrayWithData:(NSData*) XMLData]];
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
#pragma mark alert box
- (void)alertView:(UIAlertView *)aView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [aView dismissWithClickedButtonIndex:0 animated:TRUE ] ;
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
}
//
@end
