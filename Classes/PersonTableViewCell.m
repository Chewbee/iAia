//
//  PersonTableViewCell.m
//  iAia
//
//  Created by Georges-Henry Portefait on 08/04/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "PersonTableViewCell.h"


@implementation PersonTableViewCell

@synthesize  clientNumberLabel, dateOfBirthLabel, maritalStatusLabel, professionalStatusLabel, lastUpdateLabel , activityIndicator , statusImage , refreshButton ;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}

-(void) cellContentFromDataSource: (id) aPersonDataSource with: aCustomerKey {
	
	///FIXME: [aPersonDataSource getPersonInformationWith: aCustomerKey] ; 
	
	[[self clientNumberLabel]setText:[aPersonDataSource clientNumber]] ; 
	[[self dateOfBirthLabel]setText:[aPersonDataSource dateOfBirth]] ; 
	[[self maritalStatusLabel]setText:[aPersonDataSource maritalStatus]] ; 
	[[self professionalStatusLabel]setText:[aPersonDataSource professionalStatus]] ; 
}

- (IBAction)RefreshButtonPressed:(id)sender {

    [refreshButton setHidden:TRUE];
    [statusImage setImage:[UIImage imageNamed:@"lg-alertO-glass"]];
    ///FIXME: [aPersonDataSource getPersonInformationWith:nil ] ;
}
@end
