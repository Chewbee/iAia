//
//  iAiaAppDelegate.m
//  iAia
//
//  Created by Georges-Henry Portefait on 08/04/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "iAiaAppDelegate.h"
#import "iAiaViewController.h"

@implementation iAiaAppDelegate

@synthesize window;
@synthesize navController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	
	// Creating initializing and adding the PersonViewController, releasing afterwards
	iAiaViewController * iavc = [[iAiaViewController alloc]initWithNibName:@"iAiaViewController" bundle:[NSBundle mainBundle]] ;
	// empty the stack first 
	[navController setViewControllers:nil];
	// push the view on the stack
	[navController pushViewController:iavc animated:NO];
	// Override point for customization after app launch    
	[window addSubview:navController.view];
	[window makeKeyAndVisible];
	[iavc release];
	
	return YES;
}
//
- (void)dealloc {
	[navController release];
	[window release];
	[super dealloc];
}


@end
