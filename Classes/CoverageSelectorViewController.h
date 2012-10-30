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
#import "fastQuoteModel.h"
#import <Foundation/Foundation.h>
#import <Foundation/NSException.h>
#import <UIKit/UIKit.h>


@interface CoverageSelectorViewController : UITableViewController

@property (nonatomic,strong) NSDictionary       *coverages ;
@property (nonatomic,strong)FastQuoteModel      *fastQuoteModel ;
@property (nonatomic,strong)NSString            *familyStructure ;

@property (nonatomic,strong) NSMutableArray     *productOptions ;
@property (nonatomic,strong) NSMutableArray     *coverageArray ;


@property (nonatomic, strong) CoverageHeaderViewController *coverageHeaderView ;


-(void) getTariff ;

@end
