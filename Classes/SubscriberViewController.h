//
//  SubscriberViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import <UIKit/UIKit.h>
#import "fastQuoteModel.h"

@interface SubscriberViewController : UIViewController
{
    
}
@property (strong, nonatomic) IBOutlet UISegmentedControl *subscriberSegmented;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIImageView *mediBankImage;
- (IBAction)segmentedClicked:(id)sender;
- (IBAction)datePickerSelect:(id)sender;
@property (nonatomic,strong)FastQuoteModel* fastQuoteModel ;
@end
