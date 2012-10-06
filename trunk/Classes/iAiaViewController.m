//
//  iAiaViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 08/04/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "iAiaViewController.h"

@implementation iAiaViewController

@synthesize personViewCell, contractViewCell, eventViewCell ;  

#pragma mark -
#pragma mark interactions
- (void) clearWaitingIndicators {
	self.navigationItem.rightBarButtonItem = _refreshButtonItem ;
}
//
- (void) setUpWaitingIndicators {
	//
	if (_refreshButtonItem == nil) {
		_refreshButtonItem = [self.navigationItem.rightBarButtonItem retain] ;
	}
	//
	if (_activityIndicator == nil) {
		CGRect theFrame = CGRectMake(0,0,20,20) ;
		_activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:theFrame];
	}
	if (_activityButtonItem == nil) {
		_activityButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_activityIndicator];
	}
	//
	self.navigationItem.rightBarButtonItem = _activityButtonItem ;
	[_activityIndicator startAnimating];
}
-(void) refreshButtonPressed {
	//
	[[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:YES] ; 
	[self setUpWaitingIndicators];
	//
	@try {
		// Fire up a new thread to handle the web request
		[NSThread detachNewThreadSelector:@selector(updateDataSource) toTarget:self withObject:nil];
	}
	@catch (NSException * e) {
		NSLog(@"Catches Exception in thread");
	}
} 
#pragma mark -
#pragma mark Table views
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
	return 3 ; 
}
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
			// the contract list capped to ten 
		{
			///TODO:get the number of contract from the datasource
			return 1 ; 
		}
			break;
		case 1:
			// the contract list capped to ten 
		{
			///TODO: Get the number of contract from the datasource
			return 2 ; 
		}
			break;
		case 2:
			// last  financial events capped to ten 
		{
			///TODO: Get the last ten financial movements from the datasource
			return 3 ; 
		}
			break;
			
		default :
			return 1;
			break;
	}
	return 0 ; 
}
//
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	switch (section) {
		case 0:
		{ 
			@try {
				[_headerText setString:[[[PersonFacadeModel sharedInstance] title] capitalizedString]]; [_headerText appendString:@" " ];
				[_headerText appendString:[[[PersonFacadeModel sharedInstance] firstName]capitalizedString]]; [_headerText appendString:@" "] ;
				[_headerText appendString:[[[PersonFacadeModel sharedInstance] name] capitalizedString]];[_headerText appendString:@" " ];
				
			}
			@catch (NSException * e) {
				[_headerText setString: @"PlaceHolder Text"] ;
			}
			@finally {
				;
			}
		}
			break;
		case 1:
			[_headerText setString:  @"Contracts"] ;
			break;
		case 2:
			[_headerText setString:  @"Financial activities"] ;
	}
	return _headerText;
}
//

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	
	NSString *footerText = nil ; 
	
	switch (section) {
		case 0:
			footerText =  @"Sensitive Customer(VIP)" ;
			
			break;
		case 1:
			footerText =  @"List of all the inforce contracts" ;
			break;
		case 2:
			footerText =  @"Latest movements" ;
	}
	return footerText ;	
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	int section = indexPath.section ;
	switch (section) {
		case 0:
			return 148.0;
			break;
		case 1:
		case 2:
			return 44 ; 
			break;
		default:
			break;
	}
	return 44 ; 
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = nil ; 
	int section = indexPath.section ;
	NSArray *nibObjects = nil ; 
	id nibObject = nil ; 
	
	
	switch (section) {
		case 0:
		{
			cell = (PersonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"PersonTableViewCell"] ;
			if (cell == nil ) 
			{
				nibObjects = [[NSBundle mainBundle] loadNibNamed:@"PersonTableViewCell" owner:self options:nil] ;
				for (nibObject in nibObjects)
				{
					// if it is a PersonTableViewCell get it 
					if ([nibObject isKindOfClass:[PersonTableViewCell class]]) {
						cell = (PersonTableViewCell *) nibObject ; 
						[cell retain];
					} 
				}
			}
			
			[cell cellContentFromDataSource: [PersonFacadeModel sharedInstance] with: @"12345" ] ; 
			[self tableView:tableView titleForHeaderInSection:indexPath.section] ;
		}
			break;
		case 1:
		{
			cell = (ContractTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"ContractTableViewCell"] ;
			if (cell == nil ) 
			{
				nibObjects = [[NSBundle mainBundle] loadNibNamed:@"ContractTableViewCell" owner:self options:nil] ;
				for ( nibObject in nibObjects)
				{
					if ([nibObject isKindOfClass:[ContractTableViewCell class]]) {
						cell = (ContractTableViewCell*) nibObject ; 
						[cell retain];
						break ; 
					}
				}
			}
			[cell cellContentFromDataSource: [PersonFacadeModel sharedInstance] with: @"12345" ] ; 
		}
			break;
		case 2:
		{
			cell = (FinancialEventTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"FinancialEventTableViewCell"] ;
			if (cell == nil ) 
			{
				nibObjects = [[NSBundle mainBundle] loadNibNamed:@"FinancialEventTableViewCell" owner:self options:nil] ;
				for (nibObject in nibObjects)
				{
					if ([nibObject isKindOfClass:[FinancialEventTableViewCell class]]) {
						cell = (FinancialEventTableViewCell*) nibObject ; 
						[cell retain];
						break ; 
					}
				}
			}
			[cell cellContentFromDataSource: [PersonFacadeModel sharedInstance] with: @"12345" ] ; 
		}
			break;			
	}
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[self clearWaitingIndicators];
	
	int section = indexPath.section ;
	
	switch (section)
	{
		case 0:
			break;
		case 1:
		{
			ContractDetailViewController *cdvc = [[ContractDetailViewController alloc]
												  initWithNibName:@"ContractDetailViewController" bundle:[NSBundle mainBundle]] ;
			[cdvc setTitle:@"Contract Details"] ; 
			[[self navigationController] pushViewController:cdvc animated:YES] ; 
			[cdvc release] ;
		}
			break;
		case 2:
		{
			FinancialEventDetailsViewController *fedvc = [[FinancialEventDetailsViewController alloc]
														  initWithNibName:@"FinancialEventsDetailsViewController" bundle:[NSBundle mainBundle]] ;
			[fedvc setTitle:@"Financial Operations"] ; 
			[[self navigationController] pushViewController:fedvc animated:YES] ; 
			[fedvc release] ;
		}
			break;			
	}	
}
#pragma mark -
#pragma mark Threaded selectors


//
-(void) updateDataSource {
	[[PersonFacadeModel sharedInstance] getInformationWith:nil];	
	[self performSelectorOnMainThread:@selector(doneUpdating:) withObject:nil waitUntilDone:YES ];
}
-(void) doneUpdating:(id) anObject {
	[[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ; 
	[self clearWaitingIndicators];
}
#pragma mark -
#pragma mark View methods
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		// 
		[[PersonFacadeModel sharedInstance] 
		 addObserver:self 
		 forKeyPath:@"updating" 
		 options:NSKeyValueObservingOptionNew 
		 context:nil] ;
		//
		[[PersonFacadeModel sharedInstance] 
		 addObserver:self 
		 forKeyPath:@"aPersonDataSource.title" 
		 options:NSKeyValueObservingOptionNew 
		 context:nil] ;
		[[PersonFacadeModel sharedInstance] 
		 addObserver:self 
		 forKeyPath:@"aContractDataSource.contractProduct" 
		 options:NSKeyValueObservingOptionNew 
		 context:nil] ;
	}
	return self;
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	[super viewDidLoad];
	
	if (_footerText == nil ) _footerText = [[NSMutableString alloc ]init];
	if (_headerText == nil ) _headerText = [[NSMutableString alloc ]init];
	
	[PersonFacadeModel sharedInstance];
	
	[self customizeNavigationBar];
	[self customizeToolbar];
	//
	[self refreshButtonPressed];
}
- (void)viewDidUnload {
	
	[self clearWaitingIndicators];
	
	[_headerText release];
	[_footerText release] ; 
	
	[personViewCell release];
	[contractViewCell release] ; 
	[eventViewCell release];
	
	[super viewDidUnload];
}
#pragma mark -
#pragma mark interfac bar customizations
-(void) customizeNavigationBar {
	
	// create a UIBarButton
	UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc ]
										   initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh 
										   target:self 
										   action:@selector(refreshButtonPressed)];
	
	
	self.navigationItem.rightBarButtonItem=rightBarButtonItem ;
	//
	
	//logo CSC
	UIImage *cscImage = [UIImage imageNamed:@"cscImage.png" ] ; 
	UIImageView *iView = [[UIImageView alloc]initWithImage:cscImage ] ; 
	self.navigationItem.titleView = iView ; 
	
	[iView release ] ; 
	[rightBarButtonItem release];
}
-(void) customizeToolbar {}
#pragma mark -
#pragma mark KVO Handling
//
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	
	[(UITableView* )[self view]reloadData];
}
//
- (void)unregisterForChangeNotification
{
	@try {
		[[PersonFacadeModel sharedInstance] removeObserver:self
												forKeyPath:@"updating"];
		[[PersonFacadeModel sharedInstance] removeObserver:self
												forKeyPath:@"aPersonDataSource.title"];
		[[PersonFacadeModel sharedInstance] removeObserver:self
												forKeyPath:@"aContractDataSource.contractProduct"];
	}
	@catch (NSException * e) {
		NSLog(@"Exception catch in unregisterForChangeNotification for iAiaViewController");
	}
	@finally {
		;
	}
}
#pragma mark -
#pragma mark Memory management
//
- (void)didReceiveMemoryWarning {
	
	[self clearWaitingIndicators];
	
	[_headerText release];
	[_footerText release] ; 
	
	[personViewCell release];
	[contractViewCell release] ; 
	[eventViewCell release];
	
	
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}
//
- (void)dealloc {
	
	[self clearWaitingIndicators];
	[self unregisterForChangeNotification];
	
	[_headerText release];
	[_footerText release] ; 
	
	[personViewCell release];
	[contractViewCell release] ; 
	[eventViewCell release];
	
    [super dealloc];
}

@end
