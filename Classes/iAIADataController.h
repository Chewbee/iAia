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
#import "serviceProductExtract.h"

@class iAiaViewController ; 

@interface iAIADataController : NSObject
{
}
@property (nonatomic,strong) PersonDataSource        * personDataSource ;
@property (nonatomic,strong) NSMutableArray         * contracts ;
@property (nonatomic,strong) NSMutableArray         * contractsDetailed ;
@property (atomic,strong) SoapRequest               *soapRequest ;
@property (nonatomic, weak) iAiaViewController      *viewController ;

#pragma mark Init stuff
+(iAIADataController*) sharedInstance ;
-(id)init ;
#pragma mark Request
-(void)query ;
#pragma mark contract related methods
-(CSCContract*) getContractFromIdx:(NSInteger)row ;
-(NSInteger) contractCount ;
- (void)invokeServiceContractSummary:(NSString*) contractNumber ;
@end
