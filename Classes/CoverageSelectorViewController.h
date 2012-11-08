//
//  CoverageSelectorViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import "CoverageDetailViewController.h"
#import "CoverageHeaderViewController.h"
#import "CoverageViewCell.h"
#import "QuoteCell.h"
#import "ServiceGetTariff.h"
#import "ServiceContractCreate.h"
#import "fastQuoteModel.h"
#import <Foundation/Foundation.h>
#import <Foundation/NSException.h>
#import <UIKit/UIKit.h>
#import "FakeHUD.h"


@interface CoverageSelectorViewController : UITableViewController

@property (nonatomic,strong) NSArray            *coveragesId ;
@property (nonatomic,strong) FastQuoteModel     *fastQuoteModel ;
@property (nonatomic,strong) NSString           *familyStructure ;

@property (nonatomic,strong) NSDictionary       *productOptions ;
@property (nonatomic,strong) NSDictionary       *coverageDictionnary ;

@property (nonatomic, weak) CSCContract         *contract;

@property (nonatomic, weak) QuoteCell           *quoteCell ; 

@property (nonatomic, strong) CoverageHeaderViewController *coverageHeaderView ;
@property (nonatomic, weak) FakeHUD             *theSubView ;

@property (weak, nonatomic) IBOutlet UIBarButtonItem        *refreshButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem      *turnIntoContractButton;

- (IBAction)refreshButtonPressed:(id)sender;


-(void) getTariff ;

@end
