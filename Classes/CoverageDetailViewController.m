//
//  CoverageDetailViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 29/10/12.
//
//

#import "CoverageDetailViewController.h"

@interface CoverageDetailViewController ()

@end

@implementation CoverageDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
//
-(void) viewWillAppear:(BOOL)animated
{
    CSCHealthCoverageDetail *hcd = [[self coverage] HealthCoverageDetail] ;
    NSMutableArray *formulasArray = [hcd FormulaList] ;
    for (CSCHealthFormula *formula in formulasArray){
        for (CSCHealthFormulaItem *formulaItem in [formula ItemList]){
            if ([[formulaItem TextList]count]>0) {
                for (NSString *detailText in formulaItem.TextList) {
                    if (! [detailText hasPrefix:@"<Health"])
                        [[self coverageTextView] setText:
                         [NSString stringWithFormat:@"%@ \n %@",[[self coverageTextView] text],detailText ] ];
                }
            }
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCoverageTextView:nil];
    [super viewDidUnload];
}
@end
