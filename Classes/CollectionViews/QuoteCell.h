//
//  QuoteCell.h
//  iAia
//
//  Created by Georges-Henry PORTEFAIT on 27/10/12.
//
//

#import <UIKit/UIKit.h>
#import "CSCCoverage.h"

@interface QuoteCell : UITableViewCell

@property (weak,nonatomic)CSCCoverage           *coverage ;


@property (weak, nonatomic) IBOutlet UILabel    *premiumAmount;

-(void) refresh ; 

@end
