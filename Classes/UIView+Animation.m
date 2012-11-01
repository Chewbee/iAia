//
//  UIView+Animation.m
//  iAia
//
//  Created by Georges-Henry PORTEFAIT on 31/10/12.
//
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

// add with a fade-in effect
- (void) addSubviewWithFadeAnimation:(UIView*)view duration:(float)secs option:(UIViewAnimationOptions)option
{
	view.alpha = 0.0;	// make the view transparent
	[self addSubview:view];	// add it
	[UIView animateWithDuration:secs delay:0.0 options:option
                     animations:^{view.alpha = 0.5f;}
                     completion:nil];	// animate the return to visible
}

// remove self making it "drain" from the sink!
- (void) removeWithSinkAnimation:(int)steps
{
	NSTimer *timer;
	if (steps > 0 && steps < 100)	// just to avoid too much steps
		self.tag = steps;
        else
            self.tag = 50;
            timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(removeWithSinkAnimationRotateTimer:) userInfo:nil repeats:YES];
            }
- (void) removeWithSinkAnimationRotateTimer:(NSTimer*) timer
{
	CGAffineTransform trans = CGAffineTransformRotate(CGAffineTransformScale(self.transform, 0.9, 0.9),0.314);
	self.transform = trans;
	self.alpha = self.alpha * 0.98;
	self.tag = self.tag - 1;
	if (self.tag <= 0)
	{
		[timer invalidate];
		[self removeFromSuperview];
	}
}

@end