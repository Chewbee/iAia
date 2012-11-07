//
//  UIView+Animation.h
//  iAia
//
//  Created by Georges-Henry PORTEFAIT on 31/10/12.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)
- (void) addSubviewWithFadeAnimation:(UIView*)view duration:(float)secs option:(UIViewAnimationOptions)option;
- (void) removeWithSinkAnimation:(int)steps;
- (void) removeWithSinkAnimationRotateTimer:(NSTimer*) timer;
@end
