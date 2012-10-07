//
//  iAIADataController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 07/10/12.
//
//

#import "iAIADataController.h"

@implementation iAIADataController

@synthesize personDataSource , contractDataSource , financialEventDataSource ;

#pragma mark -
// Singleton implemention
+(iAIADataController*) sharedInstance {
	static iAIADataController * _theiAIADataController = nil ;
	
	if ( _theiAIADataController == nil ) {
		_theiAIADataController = [[self alloc]init] ;
	}
	return _theiAIADataController ;
}
//
-(id)init
{
    if (self = [super init]) {
        personDataSource =[PersonDataSource sharedInstance] ;
        contractDataSource = [ContractDataSource sharedInstance] ;
        financialEventDataSource = [FinancialEventDataSource sharedInstance] ;
        return self ;
    }
    return nil ;
}
-(void)query
{
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:YES] ;
    //
    //[personDataSource basicQuery] ;
    [contractDataSource refreshData] ;
    //
    [[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
}

@end
