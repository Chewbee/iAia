//
//  iAiaViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 08/04/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UITableViewCell+contentFromSource.h"

#import "PersonTableViewCell.h"
#import "ContractTableViewCell.h"
#import "FinancialEventTableViewCell.h"

#import "PersonDataSource.h"
#import "ContractDataSource.h"
#import "FinancialEventDataSource.h"

#import "PersonTableViewFooter.h"

#import "ContractDetailViewController.h"
#import "FinancialEventsDetailsViewController.h"


@interface iAiaViewController : UITableViewController
{
	PersonTableViewCell			* personViewCell ; 
	ContractTableViewCell		* contractViewCell ; 
	FinancialEventTableViewCell	* eventViewCell ; 	
	
	PersonDataSource			* __weak personDataSource ; 
	ContractDataSource			* __weak contractDataSource ; 
	FinancialEventDataSource	* __weak financialEventDataSource ;
	
	
	UIActivityIndicatorView		* _activityIndicator ;
	UIBarButtonItem				* _refreshButtonItem ; 
	UIBarButtonItem				* _activityButtonItem ; 
	
}

@property (nonatomic, strong)  PersonTableViewCell			* personViewCell ; 
@property (nonatomic, strong)  ContractTableViewCell		* contractViewCell ; 
@property (nonatomic, strong)  FinancialEventTableViewCell	* eventViewCell ; 

@property ( weak) PersonDataSource                          * personDataSource ;
@property ( weak) ContractDataSource						* contractDataSource ; 
@property ( weak) FinancialEventDataSource                  * financialEventDataSource ;

-(void) refreshButtonPressed ; 
-(void) customizeNavigationBar ; 
-(void) customizeToolbar;

-(id)cellFromCellClass: (Class)theClass inTableView:(UITableView*)theTable withReuseId:(NSString*) reuseId ;

@end

