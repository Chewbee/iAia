//
//  iAiaViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 08/04/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UITableViewCell+contentFromSource.h"

#import "iAIADataController.h"

#import "PersonTableViewCell.h"
#import "ContractTableViewCell.h"
#import "FinancialEventTableViewCell.h"

#import "PersonTableViewFooter.h"

#import "ContractDetailViewController.h"
#import "FinancialEventsDetailsViewController.h"


@interface iAiaViewController : UITableViewController
{
	PersonTableViewCell			* personViewCell ; 
	ContractTableViewCell		* contractViewCell ; 
	FinancialEventTableViewCell	* eventViewCell ; 	
		
    iAIADataController          * __weak dataController ;
	
}

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButtonItem;
@property (nonatomic, strong)  PersonTableViewCell			* personViewCell ; 
@property (nonatomic, strong)  ContractTableViewCell		* contractViewCell ; 
@property (nonatomic, strong)  FinancialEventTableViewCell	* eventViewCell ; 
@property (weak) iAIADataController* dataController ;


- (IBAction)refreshPressed:(id)sender;
-(void) customizeNavigationBar ; 
-(void) customizeToolbar;
-(void) reload;

-(id)cellFromCellClass: (Class)theClass inTableView:(UITableView*)theTable withReuseId:(NSString*) reuseId ;

@end

