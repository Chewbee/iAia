//
//  fastQuoteModel.h
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import <Foundation/Foundation.h>

@interface FastQuoteModel : NSObject

@property (nonatomic,assign)NSInteger           familyStructure;
@property (nonatomic,strong)NSMutableDictionary  *birthDates;
@property (nonatomic,assign)NSInteger           state;
@end
