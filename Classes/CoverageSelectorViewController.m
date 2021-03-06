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
#import "FakeHUD.h"
#import "UIView+Animation.h"
#import "CreateProposalViewController.h"

@interface CoverageSelectorViewController ()

@end

@implementation CoverageSelectorViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
    }
    return self;
}
#pragma mark - View related stuff
//
-(void) viewWillLoad
{
    [self setCoveragesId:@[
     @"75",
     @"67",@"73",@"74",
     @"77",@"69",@"70",
     @"82",@"71",@"72"
     ]];

    [self.tableView registerClass:[CoverageViewCell class] forCellReuseIdentifier:@"QuoteCell" ] ;
    // header view
    [self setCoverageHeaderView:[[CoverageHeaderViewController alloc]initWithNibName:@"CoverageHeaderViewController" bundle:[NSBundle mainBundle ]]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    /*
     Old Identifier			Label				New Identifier
     -----------------------------------------------------------------------------------------
     ["Pr_Young_Hos", "67"], 	%Young Hospital No Excess
     ["Pr_Basic_250", "52"], 	%Basic Hospital Excess $250	["Pr_Basic_250", "76"]
     ["Pr_Basic_500", "68"], 	%Basic Hospital Excess $500
     ["Pr_Mid_Noex", "53"], 	 	%Mid Hospital No Excess		["Pr_Mid_Noex", "77"]
     ["Pr_Mid_250", "69"], 		%Mid Hospital Excess $250
     ["Pr_Mid_500", "70"], 		%Mid Hospital Excess $500
     ["Pr_Top_Noex", "54"], 		%Top Hospital No Excess		["Pr_Top_Noex", "82"]
     ["Pr_Top_250", "71"], 		%Top Hospital $250
     ["Pr_Top_500", "72"], 		%Top Hospital $500
     ["Pr_BasicEx_55", "73"], 	%Basic Extras 55% back
     ["Pr_BasicEx_70", "74"], 	%Basic Extras 70% back
     ["Pr_TopExt_55", "40"], 	%Top Extras 55% back		["Pr_TopExt_55", "79"]
     ["Pr_TopEx_70", "41"], 	 	%Top Extras 70% back		["Pr_TopEx_70", "80"]
     ["Pr_TopEx_85", "42"], 		%Top Extras 85% back		["Pr_TopEx_85", "81"]
     ["Pr_Ultra_Health", "63"] 	%Ultra Health Cover		["Pr_Ultra_Health", "75"]
     */
    //
    [self setCoveragesId:@[
     @"67",
     @"73",@"74",
     @"77",@"69",@"70",
     @"82",@"71",@"72",
     @"75"
     ]];
    [self setCoveragesRef:@[
     @"67",
     @"76", @"68",
     @"77", @"69", @"70",
     @"82", @"71", @"72",
     @"73" , @"74",
     @"79", @"80", @"81",
     @"75"
     ]];
    // header view
    [self setCoverageHeaderView:[[CoverageHeaderViewController alloc]initWithNibName:@"CoverageHeaderViewController" bundle:[NSBundle mainBundle ]]];

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self productExtract];
    [self getTariff] ;
}
//
-(void) viewDidAppear:(BOOL)animated
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - turn into Contract Web Service stuff
//
- (IBAction)turnIntoContract:(id)sender
{
    [self performSegueWithIdentifier: @"CreateProposal" sender:self];
}

//
#pragma mark - Get tarif Web Service stuff
-(void) getTariff
{
    [self displayRefreshingIndicators];
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
        CSCArrayOfDate *dateArray = [[self fastQuoteModel] birthDatesArray] ; 
        [service  CalculationOfPremium: self action:@selector(ServiceGetTariffHandler:)
                           Environment: [[CSCWMEnv alloc] init]
                       FamilyStructure:[NSString stringWithString:[[self fastQuoteModel] familyString]]
                                 State:[NSString stringWithString:[[self fastQuoteModel] stateString ]]
                         BirthDateList: dateArray
                              Contract: nil ];
    }

}

// Handle the response from invokeServiceContractList.
- (void) ServiceGetTariffHandler: (id) value
{
	[self hideRefreshingIndicators];
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
    if ([value isKindOfClass:[CSCArrayOfReal class]]) {
        [self setTarifDictionary:[self populateTarifDictionaryWithArray:value]];
    }
    else
        [self setTarifDictionary:[self populateTarifDictionaryWithData:value]];
    [self.tableView reloadData ] ;

}
-(void) getTariffMockup
{
    [self hideRefreshingIndicators];
    //  using local resource file in mockup mode
    NSString *XMLPath = nil ;
    XMLPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Response Flow Variant 1_3.xml"];
    NSData *XMLData =nil;
    XMLData = [NSData dataWithContentsOfFile:XMLPath];

    [self ServiceGetTariffHandler:XMLData];
}
//
-(NSMutableDictionary*) populateTarifDictionaryWithData:(NSData*) XMLDataFlow
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc]init] ;
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
    nodes = [doc nodesForXPath:@"//*[local-name()='Real']" namespaceMappings:dict error:&err];
    // namespace
    CXMLElement *node = nil ;
    integer_t i=0;
    @try {
        for (node in nodes)
        {
            NSNumber *tarif = [[NSNumber alloc] initWithFloat:[[node stringValue]doubleValue]];
            if (tarif && (i <= [[self coveragesRef]count]) )
                [result setValue:tarif forKey: [[self coveragesRef] objectAtIndex:i++]] ;
        }
    }
    @catch ( NSException *exception )
    {
        // Being here prevents a crash in case the data are not in UTF-8
        // BUT conformInputString solves the case for now
    }
    return result ;
}
//
-(NSMutableDictionary*) populateTarifDictionaryWithArray:(CSCArrayOfReal*) array
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc]init] ;
    NSDecimalNumber *node = nil ;

    integer_t i=0;
    @try {
        for (node in array)
        {
            if (i <= [[self coveragesRef]count])
                [result setValue:node forKey: [[self coveragesRef] objectAtIndex:i++]] ;
        }
    }
    @catch ( NSException *exception )
    {
        // Being here prevents a crash in case the data are not in UTF-8
        // BUT conformInputString solves the case for now
    }
    return result ;
}
//

#pragma mark - productExtract Web Service stuff
//
-(void) productExtract
{
    [self displayRefreshingIndicators];
    //
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    BOOL mocked = [defaults boolForKey:@"mocked"] ;
    // mocked is now a user setting
    if (mocked) {
        [self productExtractMockup];
        return ;
    } else {
        NSString *login = [defaults stringForKey:@"login_preference" ] ;
        NSString *password = [defaults stringForKey:@"password_preference" ] ;
        serviceProductExtract *service = [serviceProductExtract serviceWithUsername:login andPassword:password] ;
        // get the params
        CSCContract *cscContract = [[CSCContract alloc] init];
        [cscContract setProductIdentifier:@"HE_MEDI01"];
        [service ProductExtract: self action: @selector(ServiceProductExtractHandler:)
                    Environment: [[CSCWMEnv alloc] init]
                ActivityRequest: [[CSCActivityRequest alloc]init]
                       Contract: cscContract] ;
    }

}
// Handle the response from invokeServiceContractList.
- (void) ServiceProductExtractHandler: (id) value
{
    [self hideRefreshingIndicators];
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

    [self setProductOptions:[self populateOptionArrayWithData:[value XMLData]]] ;
    [self setCoverageDictionnary:[self populateCoverageDictionnaryWithData:[value XMLData]]];
    [[self fastQuoteModel] setContract:[self populateContractFromData:[value XMLData]]];

    [self hideRefreshingIndicators];
    
    [self.tableView  reloadData ] ;
}
//
-(void) productExtractMockup
{
    //  using local resource file in mockup mode
    NSString *XMLPath = nil ;
    XMLPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ProductExtractResponseNew.xml"];
    NSData *XMLData =nil;
    XMLData = [NSData dataWithContentsOfFile:XMLPath];

    [self setProductOptions:[self populateOptionArrayWithData:(NSData*) XMLData]] ;
    [self setCoverageDictionnary:[self populateCoverageDictionnaryWithData:(NSData*) XMLData]];

    [self hideRefreshingIndicators];
}
//
-(CSCContract*) populateContractFromData:(NSData*) XMLDataFlow
{
    CSCContract *contract = nil ;

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
    nodes = [doc nodesForXPath:@"//*[local-name()='Contract']" namespaceMappings:dict error:&err];
    // namespace
    for (CXMLNode *node in nodes)
    {
        // creating contract objects from content
        contract = [CSCContract createWithNode:node];
    }
    return contract;
}
//
-(NSMutableDictionary*) populateOptionArrayWithData:(NSData*) XMLDataFlow
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc]init] ;
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
                [result setObject:productOption forKey:[productOption Label]] ;
            }
        }
    }
    @catch ( NSException *exception )
    {
        // Being here prevents a crash in case the data are not in UTF-8
        // BUT conformInputString solves the case for now
    }

    return result ;
}
//
-(NSMutableDictionary*) populateCoverageDictionnaryWithData:(NSData*) XMLDataFlow
{
    NSMutableDictionary *resultDictionnary = [[NSMutableDictionary alloc]initWithCapacity:5] ;
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
            if (coverage ) {
                [resultDictionnary setObject:coverage forKey:[coverage Identifier]] ;
            }
        }
    }
    @catch ( NSException *exception )
    {
        // Beiing here prevents a crash ... but it is not a solution
    }
    //  NSArray* reversedArray = [[resultArray reverseObjectEnumerator] allObjects];
    return resultDictionnary ;
}
//
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
		case 0:
            return 1;
		case 1:
            if ([[self productOptions]count])
            {
                if (! [[self fastQuoteModel]isElligibleForYoung]) {
                    return  ([[self coveragesId]count]-1);
                }
                return  [[self coveragesId]count];
            }
            else return 0;
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
            cell = [tableView dequeueReusableCellWithIdentifier:@"QuoteCell"] ;
            [self setQuoteCell:(QuoteCell*)cell];
            break;
		}
        case 1:
		{
            cell = [tableView dequeueReusableCellWithIdentifier:@"CoverageCell"] ;
            //
            int row = [indexPath row] ; 
            //
            if ( ! [[self fastQuoteModel]isElligibleForYoung])
                row ++ ;

            // Assign the coverage itself to the cell
            CSCCoverage *cover = [[self coverageDictionnary]
                                  objectForKey:[[self coveragesId ]
                                                objectAtIndex:row]];

            [(CoverageViewCell*)cell setCoverage:cover] ;

            NSString *coverageDisplayId = [[(CoverageViewCell*)cell coverage]DisplayId];
            [[(CoverageViewCell*)cell coverageLabel] setText:coverageDisplayId];
            
            if ([coverageDisplayId hasPrefix:@"YOUNG"])
                [cell setBackgroundColor: young] ;
            else if ([coverageDisplayId hasPrefix:@"BASIC"])
                [cell setBackgroundColor: basic ] ;
            else if ([coverageDisplayId hasPrefix:@"MID"])
                [cell setBackgroundColor: mid ] ;
            else if ([coverageDisplayId hasPrefix:@"TOP"])
                [cell setBackgroundColor: top ] ;
            else if ([coverageDisplayId hasPrefix:@"ULTRA"])
                [cell setBackgroundColor: ultra ] ;
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
  //      return [[self coverageHeaderView ]view] ;
    }
    return nil;
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0; // was 220
    }
    return 0 ; 
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

	int section = indexPath.section ;
	switch (section) {
		case 0:
			return 132;
			break;
		case 1:
			return 64 ;
			break;
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
// trick to allow accesory segue in IOS 5 (otherwise it does not work)
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier: @"detailCoverage" sender: [tableView cellForRowAtIndexPath: indexPath]];
}
//
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section ] != 0) {
        CoverageViewCell *cell = (CoverageViewCell*)[tableView cellForRowAtIndexPath:indexPath] ;
        [cell.checkview setHidden:TRUE];
    }
    [[self fastQuoteModel] setCoverage:nil];
}
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section]==0) {
     //   [self slideOutWebView];
        return;
    }
    CoverageViewCell *cell = (CoverageViewCell*)[tableView cellForRowAtIndexPath:indexPath] ;
    [[cell coverage] setAmount:[[self tarifDictionary] objectForKey:[[cell coverage]Identifier ]] ];
    [[self fastQuoteModel] setCoverage:[cell coverage]];
    [cell.checkview setHidden:FALSE];

    [self updatePremiumDisplay:[cell coverage]];
   // [self slideInWebViewfor];
}
//
-(void) updatePremiumDisplay:(CSCCoverage*)coverage
{
    [[self quoteCell]setCoverage:coverage];
    [[self quoteCell] refresh];
}
#pragma mark - Segue Stuff
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailCoverage"])
    {
        CoverageDetailViewController *targetVC = (CoverageDetailViewController*)segue.destinationViewController;
        [targetVC setCoverage:[(CoverageViewCell*)sender coverage]] ;
    }
    // CreateProposal
    if ([segue.identifier isEqualToString:@"CreateProposal"])
    {
        CreateProposalViewController *targetVC = (CreateProposalViewController*)segue.destinationViewController;
        [targetVC setFastQuoteModel:[self fastQuoteModel]] ;
    }
}
//
#pragma mark - WebView for details
- (void)slideInWebViewfor
{
    [self composeCoverageDetaislPage];
    NSString *pathAndFileName = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:pathAndFileName isDirectory:NO]];
    [[self webDetails] loadRequest:request];
    //[[self webDetails] setDelegate:self];
    //
	//CGRect webFrame = [[self webDetails ]frame] ;

    CGRect webFrame = CGRectMake(0, 768, 768, 874);
    [[self webDetails] setFrame:webFrame];

	[UIView beginAnimations:@"Web" context:nil] ;
	webFrame.origin.y = 150 ;
	[[self webDetails] setFrame:webFrame];
	[[self view] bringSubviewToFront:[self webDetails]] ;
	[UIView commitAnimations] ;
}
//
- (void)slideOutWebView
{
    CGRect webFrame = [[self webDetails]frame] ;

	[UIView beginAnimations:nil context:nil] ;
	webFrame.origin.y = 1024 ;
	[[self webDetails] setFrame:webFrame];
	[UIView commitAnimations] ;
}
//
-(void)composeCoverageDetaislPage
{
    NSMutableString *HTMLpage = [ NSMutableString stringWithString:@"<HTML><HEADER> <style type=\"text/css\"> h2 { color: #4B7DAF; }  </style> </HEADER><BODY bgcolor=\"#e1e1e1\">"] ;
    //
    CSCHealthCoverageDetail *hcd = [[[self quoteCell] coverage] HealthCoverageDetail] ;
    NSMutableArray *formulasArray = [hcd FormulaList] ;
    for (CSCHealthFormula *formula in formulasArray){
        for (CSCHealthFormulaItem *formulaItem in [formula ItemList]){
            if ([[formulaItem TextList]count]>0) {
                for (NSString *detailText in formulaItem.TextList) {
                    if (! [detailText hasPrefix:@"<Health"])
                    {
                        NSString *line = [NSString stringWithString:detailText];
                        [HTMLpage appendFormat:@"%@",[self HTMLFromText:[line capitalizedString]] ] ;
                    }
                }
            }
        }
    }
    //
    NSString *pathAndFileName = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSError *error = nil ;
    [HTMLpage appendString:@"</BODY></HTML>"];
    [HTMLpage writeToFile:pathAndFileName atomically:YES encoding: NSUTF8StringEncoding error:&error];
}
//
//
-(NSString*) HTMLFromText: (NSString*) text
{
    NSMutableString *returnString = [NSMutableString stringWithString:@""];

    if ([text hasPrefix:@"**"]) {
        [returnString appendFormat:@"%@<br>",text];

    } else if ([text hasPrefix:@"*"]){
        [returnString appendFormat:@"<H3>%@</H3>",text];

    } else if ([text hasPrefix:@"-"]) {
        [returnString appendString:@"<hr width=\"75%\"      >"];

    } else if ([text isEqualToString:@"\n" ])
        [returnString appendString:@"<br>"];
    else
        [returnString appendFormat:@"<H2>%@</H2>",text];

    return returnString ;
}
#pragma mark - TOOLS
- (void)displayRefreshingIndicators
{
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:TRUE] ;
    
    if (self.theSubView == nil ) {
        
        [self setTheSubView:[FakeHUD newFakeHUD]];
    }
    //[[self theSubView]gradient];
    [self.view addSubviewWithFadeAnimation:[self theSubView] duration:1.0 option:UIViewAnimationOptionCurveEaseOut];
}
//
- (void)hideRefreshingIndicators
{
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
    [[self theSubView]removeWithSinkAnimation:40 ];
}
//
- (IBAction)refreshButtonPressed:(id)sender
{
    [self getTariff];
    [[self tableView] reloadData] ;
}
//
-(NSData*) conformInputString:(NSData* )data
{
    NSString *responseString, *responseStringASCII, *responseStringUTF8 ;

    if ([data isKindOfClass:[NSData class]])
    {
        responseStringASCII = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    }
    else return nil ;

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
- (void)viewDidUnload {
    [self setTurnIntoContractButton:nil];
    [super viewDidUnload];
}
@end
