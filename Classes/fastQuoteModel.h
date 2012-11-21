//
//  fastQuoteModel.h
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import <Foundation/Foundation.h>
#import "serviceProductExtract.h"
#import "CSCArrayOfDate.h"


@interface FastQuoteModel : NSObject

//refenrential props
@property (nonatomic,assign)NSInteger           familyStructure;
@property (nonatomic,strong)NSArray             *familyCode ;
@property (nonatomic,strong)NSArray             *familyStructureArray ;

@property (nonatomic,assign)NSInteger           state;
@property (nonatomic,strong)NSArray             *statesArray ;
@property (nonatomic,strong)NSArray             *statesCode ;

@property (nonatomic,strong)NSMutableDictionary *birthDates;

@property (nonatomic,strong)NSMutableArray     *productDetail ;

@property (nonatomic, strong)CSCContract        *contract ;
@property (nonatomic,strong) CSCCoverage        *coverage ;
@property (nonatomic,strong) CSCWMStatus        *status ; 

- (void)invokeServiceProductExtract:(NSString*) productIdentifier;
- (NSString*) familyString ;
- (NSString*) stateString ;
- (NSString*) longFamilyString;
- (NSString*) longStateString;
- (CSCArrayOfDate*) birthDatesArray ;
-(BOOL) isElligibleForYoung ;
-(NSTimeInterval) oldest ;
-(void) setContractFromXMLFlow:(NSData*)XMLFlow ; 
@end
