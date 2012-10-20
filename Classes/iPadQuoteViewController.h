//
//  iPadQuoteViewController.h
//  iAia
//
//  Created by Georges-Henry PORTEFAIT on 20/10/12.
//
//

#import <UIKit/UIKit.h>
#import "fastQuoteModel.h"

@interface iPadQuoteViewController : UIViewController
//
@property (nonatomic,strong)NSArray *familyStructure ;
@property (nonatomic,strong)NSArray *states ;
@property (nonatomic,strong)FastQuoteModel* fastQuoteModel ;
//
@property (weak, nonatomic) IBOutlet UIPickerView *familyPicker;
@property (weak, nonatomic) IBOutlet UIPickerView *statePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *subscriberSegmented;
//
- (IBAction)segmentedClicked:(id)sender;
- (IBAction)datePickerSelect:(id)sender;
@end
