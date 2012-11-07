//
//  FakeHUD.h
//  iAia
//
//  Created by Georges-Henry PORTEFAIT on 31/10/12.
//
//

#import <UIKit/UIKit.h>
#import "UIView+Animation.h"

@interface FakeHUD : UIView

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)cancelButtonPressed;
+ (id) newFakeHUD;
-(void) gradient ; 
@end