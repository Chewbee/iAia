//
//  iAIADataController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 07/10/12.
//
//

#import <Foundation/Foundation.h>

#import "PersonDataSource.h"
#import "serviceListContract.h"
#import "serviceContractGetSummary.h"

@interface iAIADataController : NSObject
{
}
@property (nonatomic, weak) PersonDataSource        * personDataSource ;
@property (nonatomic,strong) NSMutableArray         * contracts ;

#pragma mark Init stuff
+(iAIADataController*) sharedInstance ;
-(id)init ;
#pragma mark Request
-(void)query ;
#pragma mark contract related methods
-(CSCContract*) getContractFromIdx:(NSInteger)row ;
-(NSInteger) contractCount ;
@end
