//
//  CoverageDetailViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 29/10/12.
//
//

#import <UIKit/UIKit.h>
#import "CSCCoverage.h"
#import "CSCHealthCoverageDetail.h"
#import "CSCHealthFormula.h"
#import "CSCHealthFormulaItem.h"


@interface CoverageDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *coverageWebView;
@property (nonatomic, strong) CSCCoverage *coverage ; 
@end
