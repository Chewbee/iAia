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
    [[self dataController]invokeServiceContractSummary:[[self contract]Number] ];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self dataController]contractsDetailed]count];
}
// according to sections the cell type is different
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = nil ;

    cell = [tableView dequeueReusableCellWithIdentifier:@"ContractDetail"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContractDetail"];
    }
    //[cell cellContentFromDataSource: [self dataController ] personForRow: indexPath.row] ;
  	return cell;
}
@end
