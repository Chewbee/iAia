//
//  ContractTableViewCell.h
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContractDataSource.h"
#import "CSCContract.h"

@interface ContractTableViewCell : UITableViewCell {

}
@property (strong, nonatomic) IBOutlet UILabel *contractLblCtl;
@property (strong,nonatomic) CSCContract *contract ; 
@end
