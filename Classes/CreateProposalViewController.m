//
//  CreateProposalViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 09/11/12.
//
//

#import "CreateProposalViewController.h"
#import "ServiceContractCreate.h"
#import "fastQuoteModel.h"

@interface CreateProposalViewController ()

@end

@implementation CreateProposalViewController
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
//
//
-(void)turnIntoContract
{
    //[self displayRefreshingIndicators];
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:TRUE] ;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    BOOL mocked = [defaults boolForKey:@"mocked"] ;
    // mocked is now a user setting
    if (mocked) {
        //[self turnIntoContractfMockup];
    } else {
        NSString *login = [defaults stringForKey:@"login_preference" ] ;
        NSString *password = [defaults stringForKey:@"password_preference" ] ;
        ServiceContractCreate *service = [ServiceContractCreate serviceWithUsername:login andPassword:password];
        
        // prepare the params
        NSDate *now = [NSDate date];
        // WMEnv --------------------------------------------------------------------------------------------------
        CSCWMEnv *env =  [[CSCWMEnv alloc] init];
        [env setEffectiveDate:now];
        [env setProfiles:[NSMutableArray arrayWithObject:@"all_user"]];
        [env setUserID:login];
        // Activity Request ---------------------------------------------------------------------------------------
        CSCActivityRequest *activityRequest = [[CSCActivityRequest alloc]init];
        [activityRequest setEffectiveDate:now];
        [activityRequest setRequestDate:now];
        // Billing ------------------------------------------------------------------------------------------------
        CSCBilling *billing = nil ; 
        NSString *XMLPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Billing.xml"];
        NSData *XMLData = [NSData dataWithContentsOfFile:XMLPath];
        CXMLDocument *doc =  [[CXMLDocument alloc] initWithData:XMLData options:0 error:nil];
        NSDictionary *dict = @{ @"http://www.csc.com/graphtalk/aia" : @"aia"  };
        NSArray *nodes = [doc nodesForXPath:@"//*[local-name()='Billing']" namespaceMappings:dict error:nil];
        for (CXMLNode *node in nodes)
            billing = [CSCBilling createWithNode:node];
        // Distributor --------------------------------------------------------------------------------------------
        CSCPartyRole *roleDistributor = [[CSCPartyRole alloc]init];
        [roleDistributor setRoleType:@"disT"];
        [roleDistributor setIdentifier:@"AP00000001"];
        [roleDistributor setMain:TRUE];
        //[roleDistributor setStartDate:[NSDate dateWithTimeIntervalSinceNow:-10000000 ]];
        // Role Owner ---------------------------------------------------------------------------------------------
        CSCPartyRole *roleOwner = [[CSCPartyRole alloc]init];
        [roleOwner setRoleType:@"owner"];
        CSCPerson *ownerPerson = [[CSCPerson alloc]init];
        [ownerPerson setPersonTitle:@"mister"];
        [ownerPerson setFirstName:[[self firstName]text]];
        [ownerPerson setLastName:[[self nameTextField]text]];
        // Age
        NSDate *bDate = [[[self fastQuoteModel]birthDates] valueForKey:@"subscriber"];
        NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        NSUInteger unitFlags = NSYearCalendarUnit ;
        NSDateComponents *components = [gregorian components:unitFlags
                                                    fromDate:bDate
                                                      toDate:now options:0];
        NSInteger age = [components year];
        [ownerPerson setAge:age];
        [ownerPerson setBirthDate:bDate];
        CSCPostalAddress *postalAddress = [[CSCPostalAddress alloc]init];
        [postalAddress setPostalCode:[[self zipCode]text]];
        [postalAddress setStreetName:[[self streetName]text]];
        [postalAddress setCityName:[[self cityTextField]text]];
        [postalAddress setCountryCode:@"AU"];
        [postalAddress setPreferred:TRUE];
        [ownerPerson setPostalAddressList:[NSMutableArray arrayWithObject:postalAddress]];
        CSCEMailAddress *emailAdddress = [[CSCEMailAddress alloc]init];
        [emailAdddress setPreferred:TRUE];
        [emailAdddress setText:[[self emailTextField]text]];
        [ownerPerson setEMailAddressList:[NSMutableArray arrayWithObject:emailAdddress]];
        [ownerPerson setClientNumber2:@"99999993"];
        [roleOwner setPerson:ownerPerson];
        // Contract -----------------------------------------------------------------------------------------------
        CSCContract *theContract = [[self fastQuoteModel]contract] ;
        [theContract setEffectiveDate:now];
        [theContract setSignatureDate:now];
        CSCCoverage *coverage = [[self fastQuoteModel]coverage ];
        [coverage setContract:nil];
        [theContract setCoverageList:[NSMutableArray arrayWithObject:coverage]];
        [theContract setBillingList:[NSMutableArray arrayWithObject:billing]];
        [theContract setRoleList:[NSMutableArray arrayWithObjects:roleDistributor, roleOwner, nil]];
        // Returns CSCContract*.
        [service ContractCreate:self
                         action:@selector(ContractCreateHandler:)
                    Environment: env
                ActivityRequest: [[CSCActivityRequest alloc]init]
                  SavingsScheme: [[CSCSavingsScheme alloc] init]
                       Contract: theContract];
    }
}
//
// Handle the response from invokeServiceContractList.
- (void) ContractCreateHandler: (id) value
{
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:FALSE] ;
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
    [[self fastQuoteModel] setStatus:value ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[self state]setText:[[self fastQuoteModel]stateString]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCreateProposalButton:nil];
    [self setEmailTextField:nil];
    [self setNameTextField:nil];
    [self setFirstName:nil];
    [self setStreetName:nil];
    [self setZipCode:nil];
    [self setState:nil];
    [self setCityTextField:nil];
    [super viewDidUnload];
}
- (IBAction)createProposal:(id)sender {
    [self turnIntoContract];
}
//

@end