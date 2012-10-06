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

#import "PersonFacadeModel.h"

#import "ContractDetailViewController.h"
#import "FinancialEventDetailsViewController.h"


@interface iAiaViewController : UITableViewController 
{ 
	PersonTableViewCell			* personViewCell ; 
	ContractTableViewCell		* contractViewCell ; 
	FinancialEventTableViewCell	* eventViewCell ; 	
	
	NSMutableString				* _headerText ; 
	NSMutableString				* _footerText ; 
	
	UIActivityIndicatorView		* _activityIndicator ;
	UIBarButtonItem				* _refreshButtonItem ; 
	UIBarButtonItem				* _activityButtonItem ; 
	
}

@property (nonatomic, retain)  PersonTableViewCell			* personViewCell ; 
@property (nonatomic, retain)  ContractTableViewCell		* contractViewCell ; 
@property (nonatomic, retain)  FinancialEventTableViewCell	* eventViewCell ; 

-(void) refreshButtonPressed ; 

-(void) customizeNavigationBar ; 
-(void) customizeToolbar; 

@end

