//
//  PersonTableViewCell.m
//  iAia
//
//  Created by Georges-Henry Portefait on 08/04/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "PersonTableViewCell.h"


@implementation PersonTableViewCell

@synthesize  clientNumberLabel, dateOfBirthLabel, maritalStatusLabel, professionalStatusLabel ; 
//
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}
//
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
    [super setSelected:selected animated:NO];
    // Configure the view for the selected state
}
//
- (void)dealloc {
    [super dealloc];
}
//
-(void) cellContentFromDataSource: (id) aDataSource with: aCustomerKey {
	
	[[self clientNumberLabel]setText:[aDataSource clientNumber]] ; 
	[[self dateOfBirthLabel]setText:[aDataSource dateOfBirth]] ; 
	[[self maritalStatusLabel]setText:[aDataSource maritalStatus]] ; 
	[[self professionalStatusLabel]setText:[aDataSource professionalStatus]] ; 
}

@end
