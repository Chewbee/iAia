//
//  UITableViewCell+contentFromSource.h
//  iAia
//
//  Created by Georges-Henry Portefait on 01/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UITableViewCell.h>

@interface UITableViewCell ( UITableViewCell_contentFromSource ) 

-(void) cellContentFromDataSource: (id) aDataSource contractForRow: (NSInteger)row;
-(void) cellContentFromDataSource: (id) aDataSource personForRow: (NSInteger)row;

@end
