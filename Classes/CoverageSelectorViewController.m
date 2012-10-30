//
//  CoverageSelectorViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import "CoverageSelectorViewController.h"
#import "CoverageViewCell.h"
#import <Foundation/NSException.h>

@interface CoverageSelectorViewController ()

@end

@implementation CoverageSelectorViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _coverages = @{
        @67	: @"Young Hospital No Excess",
        @52	: @"Basic Hospital Excess $250" ,
        @68	: @"Basic Hospital Excess $500",
        @53	: @"Mid Hospital No Excess",
        @69	: @"Mid Hospital Excess $250",
        @70	: @"Mid Hospital Excess $500",
        @54	: @"Top Hospital No Excess",
        @71	: @"Top Hospital $250",
        @72	: @"Top Hospital $500",
        @73	: @"Basic Extras 55% back",
        @74	: @"Basic Extras 70% back",
        @40	: @"Top Extras 55% back",
        @41	: @"Top Extras 70% back",
        @42	: @"Top Extras 85% back",
        @63	: @"Ultra Health Cover"};
    }
    return self;
}
#pragma mark - View related stuff
//
-(void) viewWillLoad {
    [self.tableView registerClass:[CoverageViewCell class] forCellReuseIdentifier:@"QuoteCell" ] ;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self getTariff] ;
}
//
-(void) viewDidAppear:(BOOL)animated
{
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:TRUE] ;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Web Service stuff
-(void) getTariff
{
    //
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    BOOL mocked = [defaults boolForKey:@"mocked"] ;
    // mocked is now a user setting
    if (mocked) {
        [self getTariffMockup];
        return ;
    } else {
        NSString *login = [defaults stringForKey:@"login_preference" ] ;
        NSString *password = [defaults stringForKey:@"password_preference" ] ;
        ServiceGetTariff  *service = [ServiceGetTariff serviceWithUsername:login andPassword:password] ;
        // get the params
        [service  CalculationOfPremium: self action:@selector(ServiceGetTariffHandler:)
                           Environment: [[CSCWMEnv alloc] init]
                       FamilyStructure: [[self fastQuoteModel] familyString]
                                 State:[[self fastQuoteModel]stateString ]
                         BirthDateList:[NSMutableArray arrayWithArray:[[self fastQuoteModel] birthDatesArray]]
                              Contract: nil ];
    }

}
#pragma mark -
#pragma mark Service returns
// Handle the response from invokeServiceContractList.
- (void) ServiceGetTariffHandler: (id) value
{
	[[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
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
    // Do something with the NSMutableArray* result
    //TODO: Check Efficiency
    [self setProductOptions: (NSMutableArray*)value ];
    [self.tableView  reloadData ] ;

}
-(void) getTariffMockup
{
    //  using local resource file in mockup mode
    NSString *XMLPath = nil ;
    XMLPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ProductExtractResponseNew.xml"];
    NSData *XMLData =nil;
    XMLData = [NSData dataWithContentsOfFile:XMLPath];

    [self setProductOptions:[self populateOptionArrayWithData:(NSData*) XMLData]] ;
    [self setCoverageArray:[self populateCoverageArrayWithData:(NSData*) XMLData]];
    
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
}
#pragma mark -
#pragma mark XML flow parsing
-(NSMutableArray*) populateOptionArrayWithData:(NSData*) XMLDataFlow
{
    NSMutableArray *resultArray = [NSMutableArray array] ;
    NSError *err = nil ;
    NSData *XMLData =nil;
    XMLData = [self conformInputString: XMLDataFlow ];

    CXMLDocument *doc = nil ;
    doc = [[CXMLDocument alloc] initWithData:XMLData options:0 error:&err];
    //
    NSArray *nodes = nil ;
    // namespace
    NSDictionary *dict = @{ @"http://www.csc.com/graphtalk/aia" : @"aia"  };
    //  searching for Contract nodes
    nodes = [doc nodesForXPath:@"//*[local-name()='ProductOption']" namespaceMappings:dict error:&err];
    // namespace
    @try {
        for (CXMLNode *node in nodes)
        {
            // creating contract objects from content
            CSCProductOption *productOption = nil;
            productOption = [CSCProductOption createWithNode:node];
            if (productOption) {
                [resultArray addObject:productOption] ;
            }
        }
    }
    @catch ( NSException *exception )
    {
        //TODO:being here prevents a crash ... but it is not a solution 
    }
    
    return resultArray ;
}
//
-(NSMutableArray*) populateCoverageArrayWithData:(NSData*) XMLDataFlow
{
    NSMutableArray *resultArray = [NSMutableArray array] ;
    NSError *err = nil ;
    NSData *XMLData =nil;
    XMLData = [self conformInputString: XMLDataFlow ];

    CXMLDocument *doc = nil ;
    doc = [[CXMLDocument alloc] initWithData:XMLData options:0 error:&err];
    //
    NSArray *nodes = nil ;
    // namespace
    NSDictionary *dict = @{ @"http://www.csc.com/graphtalk/aia" : @"aia"  };
    //  searching for Contract nodes
    nodes = [doc nodesForXPath:@"//*[local-name()='Coverage']" namespaceMappings:dict error:&err];
    // namespace
    @try {
        for (CXMLNode *node in nodes)
        {
            // creating contract objects from content
            CSCCoverage *coverage = nil;
            coverage = [CSCCoverage createWithNode:node];
            if (coverage    ) {
                [resultArray   addObject:coverage] ;
            }
        }
    }
    @catch ( NSException *exception )
    {
        //TODO:being here prevents a crash ... but it is not a solution
    }

    return resultArray ;
}
//
-(NSData*) conformInputString:(NSData* )data
{
    NSString *responseString, *responseStringASCII, *responseStringUTF8 ;

    responseStringASCII = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    if (!responseStringASCII) // ASCII is not working, will try utf-8!
        responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    else
    {
        //  ASCII is working, but check if UTF8 gives less characters
        responseStringUTF8  = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if(responseStringUTF8 != nil && [responseStringUTF8 length] < [responseStringASCII length])
            responseString  =   responseStringUTF8 ;
        else
            responseString  =   responseStringASCII ;
    }
    NSData *returnedData = [ responseString dataUsingEncoding:NSUTF8StringEncoding];
    return returnedData ;
}
//
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
		case 0:
            return 1;
		case 1:
            return 5;
    }
    return 0;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil ;
	int section = indexPath.section ;
    // Configure the cell...
    // http://themecraft.net/www/medibank.com.au
    // Young    0.4196	0.6510	0.8157
    // Basic    0.2235	0.5176	0.7451
    // Mid      0.1686	0.4196	0.5451
    // Top      0.0667	0.2392	0.3765
    // Ultra    0.3451	0.1569	0.4471
    UIColor *young =    [UIColor colorWithRed:0.4196 green:0.6510 blue:0.8157 alpha:1.0f] ;
    UIColor *basic =    [UIColor colorWithRed:0.2235 green:0.5176 blue:0.7451 alpha:1.0f] ;
    UIColor *mid =      [UIColor colorWithRed:0.1686 green:0.4196 blue:0.5451 alpha:1.0f] ;
    UIColor *top =      [UIColor colorWithRed:0.0667 green:0.2392 blue:0.3765 alpha:1.0f] ;
    UIColor *ultra =    [UIColor colorWithRed:0.3451 green:0.1569 blue:0.4471 alpha:1.0f] ;

    switch (section) {
		case 0:
		{
            cell = (QuoteCell*)[tableView dequeueReusableCellWithIdentifier:@"QuoteCell"] ;
            break;
		}
        case 1:
		{
            cell = (CoverageViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CoverageCell"] ;
            [[(CoverageViewCell*)cell coverageLabel] setText:[[[self coverageArray] objectAtIndex: indexPath.row ]DisplayId]];
            switch (indexPath.row) {
                case 0:
                    [cell setBackgroundColor: young] ;
                    break;
                case 1:
                    [cell setBackgroundColor: basic ] ;
                    break ;
                case 2:
                    [cell setBackgroundColor: mid ] ;
                    break;
                case 3:
                    [cell setBackgroundColor: top ] ;
                    break ;
                case 4:
                    [cell setBackgroundColor: ultra ] ;
                    break;
                default:
                    [cell setBackgroundColor: [UIColor blackColor] ] ;
                    break;
            }
            break ;
		}
    }
    //FIXME: why the hell do we have those lines
    //[self tableView:tableView viewForHeaderInSection:indexPath.section] ;
    //indexPaths = @[indexPath] ;
    //[tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade] ;
    return cell ;
}
//
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return [[self coverageHeaderView ]view] ;
    }
    return nil;
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 220 ;
    }
    return 0 ;
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate
// trick to allow accesory segue in IOS 5 (usually do not work)
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier: @"detailCoverage" sender: [tableView cellForRowAtIndexPath: indexPath]];
}
//
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CoverageViewCell *cell = (CoverageViewCell*)[tableView cellForRowAtIndexPath:indexPath] ;
    [cell.checkview setHidden:TRUE];
}
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CoverageViewCell *cell = (CoverageViewCell*)[tableView cellForRowAtIndexPath:indexPath] ;
    [cell.checkview setHidden:FALSE];
    //[cell coverageLabel] setText:[[self coverageArray] objectAtIndex: indexPath.row ];
}
#pragma mark - Segue Stuff
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailCoverage"])
    {
        CoverageDetailViewController *targetVC = (CoverageDetailViewController*)segue.destinationViewController;
        //FIXME: pass the cell
    }
}
//
//- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//
//}
//
@end
