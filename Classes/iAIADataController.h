//
//  iAIADataController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 07/10/12.
//
//

#import <Foundation/Foundation.h>

#import "PersonDataSource.h"
#import "ContractDataSource.h"
#import "FinancialEventDataSource.h"

@interface iAIADataController : NSObject
{
    PersonDataSource			* __weak personDataSource ;
	ContractDataSource			* __weak contractDataSource ;
	FinancialEventDataSource	* __weak financialEventDataSource ;
    
}
@property ( weak) PersonDataSource                          * personDataSource ;
@property ( weak) ContractDataSource						* contractDataSource ;
@property ( weak) FinancialEventDataSource                  * financialEventDataSource ;

+(iAIADataController*) sharedInstance ;
-(id)init ;
-(void)query ;
@end
