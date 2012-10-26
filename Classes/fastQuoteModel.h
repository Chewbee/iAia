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

@property (nonatomic,assign)BOOL                      errorStatus ;
@property (nonatomic,assign)NSInteger           familyStructure;
@property (nonatomic,strong)NSMutableDictionary  *birthDates;
@property (nonatomic,assign)NSInteger           state;
@property (nonatomic,strong) NSMutableArray         *productDetail ;

- (void)invokeServiceProductExtract:(NSString*) productIdentifier;
@end
