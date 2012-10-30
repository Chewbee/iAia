//
//  CoverageViewCell.h
//  iAia
//
//  Created by Georges-Henry PORTEFAIT on 26/10/12.
//
//

#import <UIKit/UIKit.h>
#import "CSCCoverage.h"

@interface CoverageViewCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UIImageView *checkview;
@property (nonatomic, strong) CSCCoverage *coverage ; 
@end