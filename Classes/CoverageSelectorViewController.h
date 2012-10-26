//
//  CoverageSelectorViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import <UIKit/UIKit.h>
#import "fastQuoteModel.h"
#import "ServiceGetTariff.h"


@interface CoverageSelectorViewController : UITableViewController

@property (nonatomic,strong) NSDictionary* coverages ; 
@property (nonatomic,strong)FastQuoteModel* fastQuoteModel ;
@property (nonatomic,strong)NSString    *familyStructure ;


-(void) getTariff ;

@end
