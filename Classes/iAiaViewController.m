//
//  iAiaViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 08/04/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "iAiaViewController.h"


#define PERSON_HEIGHT	208
#define OTHER_HEIGHT	44

@implementation iAiaViewController

@synthesize personViewCell, contractViewCell, eventViewCell ;
@synthesize dataController  ;


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
	return 3 ;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	switch (section) {
		case 0:
		{
			return 1 ;
		}
			break;
		case 1:
            return [[dataController contractDataSource]contractCount ] ;
			break;
		case 2:
		{
			///TODO: get the last ten financial movements from the datasource
            return 3 ;
		}
			break;
	}
	return 1 ;
}
//

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
	NSMutableString *headerText = [[NSMutableString alloc]init] ;
	
	
	switch (section) {
		case 0:
		{
			@try {
                /*
				[headerText setString:[[[self.dataController personDataSource] title] capitalizedString]];
                [headerText appendString:@" " ];
				[headerText appendString:[[[self.dataController personDataSource] firstName]capitalizedString]];
                [headerText appendString:@" "] ;
				[headerText appendString:[[[self.dataController personDataSource] name] capitalizedString]];
                [headerText appendString:@" " ];
				*/
			}
			@catch (NSException * e) {
				[headerText setString: @"PlaceHolder Text"] ;
			}
			@finally {
				;
			}
		}
			break;
		case 1:
        {
            NSString *contractHeader = [ NSString stringWithFormat:@"List of the %d In-force contracts",[[dataController contractDataSource]contractCount ]]  ;
            [headerText setString:contractHeader ] ;
        }
			break;
		case 2:
			[headerText setString:  @"Financial activities"] ;
	}
    
	return headerText;
}
//

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	
	NSString *footerText = nil ;
	
	switch (section) {
		case 0:
			///TODO : Get this from the contract synthesis
            footerText = [NSString stringWithFormat: @"VIP Customer"] ;
			
			break;
		case 1:
			footerText =  [NSString stringWithFormat: @"List of all the inforce contracts" ];
			break;
		case 2:
			footerText = [NSString stringWithFormat:  @"Latest financials movements"] ;
	}
	
	return footerText ;
}

#pragma mark -
#pragma mark Cell get and setting content

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	int section = indexPath.section ;
	switch (section) {
		case 0:
			return PERSON_HEIGHT;
			break;
		case 1:
		case 2:
			return OTHER_HEIGHT ;
			break;
	}
	return 44 ;
}
// Customize the appearance of table view cells.
-(id)cellFromCellClass: (Class)theClass inTableView:(UITableView*)theTable withReuseId:(NSString*) reuseId
{
    UITableViewCell *cell = nil ;
    
    cell = [theTable dequeueReusableCellWithIdentifier:reuseId] ;
    
    if (cell == nil )
    {
        cell = [[theClass alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId ] ;
    }
    return cell ; 
}
// according to sections the cell type is different
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *cell = nil ;
	int section = indexPath.section ;
	NSArray *indexPaths = nil ;
	
	switch (section) {
		case 0:
		{
			cell = (PersonTableViewCell*) [self cellFromCellClass: [PersonTableViewCell class] inTableView:tableView withReuseId:@"PersonCell"];
            
            [cell cellContentFromDataSource: [self.dataController personDataSource] forRow: indexPath.row] ;
			[self tableView:tableView titleForHeaderInSection:indexPath.section] ;
			indexPaths = @[indexPath] ;
			[tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade] ;
		}
			break;
		case 1:
		{
            cell = (ContractTableViewCell*) [self cellFromCellClass: [ContractTableViewCell class] inTableView:tableView withReuseId:@"ContractCell"];

			[cell cellContentFromDataSource: [self.dataController contractDataSource] forRow: indexPath.row] ;
			[self tableView:tableView titleForHeaderInSection:indexPath.section] ;
			indexPaths = @[indexPath] ;
			[tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade] ;
		}
			break;
		case 2:
		{
            cell = (FinancialEventTableViewCell*) [self cellFromCellClass: [FinancialEventTableViewCell class] inTableView:tableView withReuseId:@"FinancialCell"];
            
			[cell cellContentFromDataSource: [self.dataController contractDataSource] forRow: indexPath.row ] ;
			[self tableView:tableView titleForHeaderInSection:indexPath.section] ;
			indexPaths = @[indexPath] ;
			[tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade] ;
        }
			break;
	}
	
	return cell;
}

#pragma mark -
#pragma mark Segue Stuff
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@" In prepareForSegue ");
    if ([[segue identifier] isEqualToString:@"ContractDetails"]) {
        NSLog(@"In ContractDetails prepareForSegue ");
        NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow] ;
        ContractTableViewCell * ctvc = (ContractTableViewCell*)[self tableView:[self tableView] cellForRowAtIndexPath:selectedRowIndex];
        [segue.destinationViewController setContract:[ctvc contract]];
    }
    if ([[segue identifier] isEqualToString:@"FinancialDetails"]) {
        NSLog(@"In FinancialDetails prepareForSegue ");
        // NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
    }
}
#pragma mark interactions

#pragma mark -
#pragma view methods
- (void)viewDidLoad
{
    [self initializeDataSources];
    //
    [self customizeNavigationBar];
    [self customizeToolbar];
    //
    [(UITableView* )[self view]reloadData];
}
//
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:NO] ;
}
//
- (void) initializeDataSources {
    
    dataController  = [iAIADataController sharedInstance ] ;
    [dataController query] ;
}
//
-(void) customizeNavigationBar {
    //logo CSC
    UIImage *cscImage = [UIImage imageNamed:@"cscImage.png" ] ;
    UIImageView *iView = [[UIImageView alloc]initWithImage:cscImage ] ;
    self.navigationItem.titleView = iView ;
}
-(void) customizeToolbar
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (Class) cellClassForSection:(int) section {
    return nil ;
}

@end
