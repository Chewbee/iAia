//
//  ContractTableViewCell.m
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContractTableViewCell.h"


@implementation ContractTableViewCell

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
-(void) cellContentFromDataSource: (id) aDataSource contractForRow: (NSInteger)row
{
    if ([self dataController] == nil) {
        [self setDataController:aDataSource];
    }
    [self setContract:[aDataSource getContractFromIdx:row]] ;
    [[self contractLblCtl ] setText: [[self contract] DisplayId] ] ;
}

@end
