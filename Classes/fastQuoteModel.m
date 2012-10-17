//
//  fastQuoteModel.m
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import "FastQuoteModel.h"

@implementation FastQuoteModel

-(id)init
{
    if ((self = [super init]) != nil) {
        [self setFamilyStructure:0];
        [self setBirthDates:[[NSMutableDictionary alloc ]init]];
        [self setState:0];
    }
    return self ;
}
@end
