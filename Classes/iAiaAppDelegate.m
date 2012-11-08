//
//  iAiaAppDelegate.m
//  iAia
//
//  Created by Georges-Henry Portefait on 08/04/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "iAiaAppDelegate.h"
#import "iAiaViewController.h"
#import "UIColor+CreateMethods.h"

@implementation iAiaAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Register the preference defaults early.
    NSDictionary *appDefaults = @{
    @"server"               : @"https://ec2-54-241-1-254.us-west-1.compute.amazonaws.com/graphtalk/soap/services" ,
    @"number_preference"    : @"PRSN0000430" ,
    @"login_preference"     : @"cscadmin" , // cscadmin
    @"password_preference"  : @"Physicpyrite" , // Physicpyrite
    @"mocked"               : @"NO" } ;

    [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];

    [self themeColors];
    //
	[self.window makeKeyAndVisible];
    return TRUE ;
}
//
-(void) themeColors
{
    /*
     #fafafa blanc
     #e1e1e1 gris clair
     #c8c8c8 gris moyen
     #4b7daf navy blue
     #7dc8e1 sky blue
     */
    UIColor *brokenWhiteColor   = [UIColor colorWithHex:@"#fafafa" alpha:1.0f] ;
    UIColor *lightGraycolor     = [UIColor colorWithHex:@"#e1e1e1" alpha:1.0f] ;
    UIColor *midGraycolor       = [UIColor colorWithHex:@"#c8c8c8" alpha:1.0f] ;
    UIColor *naviBlueColor      = [UIColor colorWithHex:@"#4b7daf" alpha:1.0f] ;
    UIColor *skyBluecolor       = [UIColor colorWithHex:@"#7dc8e1" alpha:1.0f] ;
    // 
    UIImage *navImage   = [UIImage imageNamed:@"navBar.png"] ;
    UIImage *tabBar     = [UIImage imageNamed:@"tabBar.png"] ;
    UIImage *leatherBack= [UIImage imageNamed:@"leatherWhite.png"] ;
    //
    //navImage = [navImage resizableImageWithCapInsets: UIEdgeInsetsMake (1.0f,1.0f,1.0f,1.0f)];
    //tabBar = [tabBar resizableImageWithCapInsets: UIEdgeInsetsMake (1.0f,1.0f,1.0f,1.0f)];
    // Navigation bar
    UINavigationBar  *uinApp = [UINavigationBar  appearance];
    [uinApp setTintColor: naviBlueColor];
    [uinApp setBackgroundImage:navImage forBarMetrics:UIBarMetricsDefault];
    // tableView
    UITableView *uitv = [UITableView appearance];
    [uitv setBackgroundColor:lightGraycolor];
    UIImageView *uiv = [[UIImageView alloc] initWithImage:leatherBack] ;
    [uitv setBackgroundView:uiv] ;
    [uitv setSeparatorColor:midGraycolor] ;
    [uitv setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    // Tab tab
    UITabBar *uitb = [UITabBar appearance];
    [uitb setBackgroundImage:tabBar];
    // Segmented control
    UISegmentedControl *uisc = [UISegmentedControl appearance];
    //[uisc setBackgroundColor:lightGraycolor];
    //[uisc setBackgroundImage:navImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault] ;
    // [uisc setDividerImage:nil forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    // Button
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
