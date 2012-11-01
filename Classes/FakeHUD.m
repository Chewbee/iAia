//
//  FakeHUD.m
//  iAia
//
//  Created by Georges-Henry PORTEFAIT on 31/10/12.
//
//

#import "FakeHUD.h"
#import "UIView+Animation.h"
#import <QuartzCore/QuartzCore.h>

@implementation FakeHUD

// create a new view from the xib
+ (id) newFakeHUD
{
	UINib *nib = [UINib nibWithNibName:@"FakeHUD" bundle:nil];
	NSArray *nibArray = [nib instantiateWithOwner:self options:nil];
    FakeHUD *me = [nibArray objectAtIndex: 0];
   
	return me;
}
-(void) gradient
{
    //
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = [self frame] ;
    gradient.opacity = 0.5f ; 
    gradient.masksToBounds = YES;
    gradient.cornerRadius = 15.0f;
    //gradient.mask = [[[self imageView] image] ];
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor blackColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
    [self.layer insertSublayer:gradient atIndex:0];
    //
}
/*
- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();

    CGGradientRef glossGradient;
    CGColorSpaceRef rgbColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 1.0, 0.35,  // Start color
        1.0, 1.0, 1.0, 0.06 }; // End color

    rgbColorspace = CGColorSpaceCreateDeviceRGB();
    glossGradient = CGGradientCreateWithColorComponents(rgbColorspace, components, locations, num_locations);

    CGRect currentBounds = [[self imageView] bounds] ;
    CGPoint topCenter = CGPointMake(CGRectGetMidX(currentBounds), 0.0f);
    CGPoint midCenter = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMidY(currentBounds));
    CGContextDrawLinearGradient(currentContext, glossGradient, topCenter, midCenter, 0);

    CGGradientRelease(glossGradient);
    CGColorSpaceRelease(rgbColorspace);
}
*/
- (IBAction)cancelButtonPressed
{
	// the following method will be defined and explained later: ignore the warning
	[self removeWithSinkAnimation:40];
}
@end

/*

 UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)] autorelease];
 CAGradientLayer *gradient = [CAGradientLayer layer];
 gradient.frame = view.bounds;
 gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor blackColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
 [view.layer insertSublayer:gradient atIndex:0];
 
*/