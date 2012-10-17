//
//  StateViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import <UIKit/UIKit.h>
#import "fastQuoteModel.h"
@interface StateViewController : UIViewController <UIPickerViewDataSource , UIPickerViewDelegate>



@property (nonatomic,strong)FastQuoteModel* fastQuoteModel ;
@property (strong, nonatomic) IBOutlet UIPickerView *statePicker;
@property (nonatomic,strong)NSArray *states ;


@end
