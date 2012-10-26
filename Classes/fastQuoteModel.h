//
//  fastQuoteModel.h
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import <Foundation/Foundation.h>
#import "serviceProductExtract.h"


@interface FastQuoteModel : NSObject

@property (nonatomic,assign)BOOL                errorStatus ;
@property (nonatomic,assign)NSInteger           familyStructure;
@property (nonatomic,strong)NSMutableDictionary *birthDates;
@property (nonatomic,assign)NSInteger           state;
@property (nonatomic,strong) NSMutableArray     *productDetail ;

@property (nonatomic,strong)NSDictionary        *familyStructureDic ;
@property (nonatomic,strong)NSDictionary        *statesDic ;

@property (nonatomic,strong)NSArray             *familyStructureArray ;
@property (nonatomic,strong)NSArray             *statesArray ;

- (void)invokeServiceProductExtract:(NSString*) productIdentifier;
- (NSString*) familyString ;
- (NSString*) stateString ;
-(NSArray*) birthDatesArray ; 

@end
