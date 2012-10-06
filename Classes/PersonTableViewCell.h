//
//  PersonTableViewCell.h
//  iAia
//
//  Created by Georges-Henry Portefait on 08/04/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonDataSource.h"


@interface PersonTableViewCell : UITableViewCell {
	IBOutlet UILabel * clientNumberLabel ; 
	IBOutlet UILabel * dateOfBirthLabel ; 
	IBOutlet UILabel * maritalStatusLabel ; 
	IBOutlet UILabel * professionalStatusLabel ; 
	
}
- (IBAction)RefreshButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lastUpdateLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIImageView *statusImage;
@property (strong, nonatomic) IBOutlet UIButton *refreshButton;
@property	(nonatomic,strong) IBOutlet UILabel * clientNumberLabel ;
@property	(nonatomic,strong) IBOutlet UILabel * dateOfBirthLabel ;
@property	(nonatomic,strong) IBOutlet UILabel * maritalStatusLabel ; 
@property	(nonatomic,strong) IBOutlet UILabel * professionalStatusLabel ; 

@end
