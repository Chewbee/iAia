//
//  FinancialEventTableViewCell.m
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 IDO Productions. All rights reserved.
//

#import "FinancialEventTableViewCell.h"


@implementation FinancialEventTableViewCell
//
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}
//
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//
- (void)dealloc {
    [super dealloc];
}
//
-(void) cellContentFromDataSource: (id) aDataSource with: aCustomerKey {
	
	//[aDataSource getInformationWith: aCustomerKey] ; 
	
}

@end
