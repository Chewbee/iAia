//
//  CoverageCollectionViewController.h
//  iAia
//
//  Created by Georges-Henry PORTEFAIT on 27/10/12.
//
//

#import <UIKit/UIKit.h>

#import "CoverageViewCell.h"
#import "QuoteCell.h"
#import "CoverageHeaderView.h"
#import "QuoteHeaderView.h"
#import "OptionHeaderView.h"
#import "fastQuoteModel.h"
#import "ServiceGetTariff.h"

@interface CoverageCollectionViewController : UICollectionViewController < UICollectionViewDataSource, UICollectionViewDelegateFlowLayout >
{
    UIColor *_young  ;
    UIColor *_basic  ;
    UIColor *_mid    ;
    UIColor *_top    ;
    UIColor *_ultra  ;
}
@property (nonatomic,strong) NSDictionary* coverages ;
@property (nonatomic,strong)FastQuoteModel* fastQuoteModel ;
@property (nonatomic,strong)NSString    *familyStructure ;


-(void) getTariff ;


@end
