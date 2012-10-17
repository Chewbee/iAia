//
//  QuoteViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import <UIKit/UIKit.h>
#import "fastQuoteModel.h"

@interface QuoteFamilyStructureViewController : UIViewController <UIPickerViewDataSource , UIPickerViewDelegate>
{

}
@property (strong, nonatomic) IBOutlet UIPickerView *familyPicker;
@property (nonatomic,strong)NSArray *familyStructure ;
@property (nonatomic,strong)FastQuoteModel* fastQuoteModel ;
@end
