//
//  ContractDataSource.h
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContractTableViewCell.h"
#import "CSCWorkManagementClientContractDisplayExtract.h"
#import "CSCContract.h"

@interface ContractDataSource : NSObject {
    CSCWorkManagementClientContractDisplayExtract *CSCWMccde ;
    CSCContract                                    *cscContract ;
    
}
@property BOOL dataReady ;
+(ContractDataSource*) sharedInstance ; 
//
-(void) refreshData;
@end
