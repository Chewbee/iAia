//
//  ContractDetailViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 04/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContractDetailViewController.h"


@implementation ContractDetailViewController


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
//
-(void) viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:[[self contract] DisplayId]];
}


@end
