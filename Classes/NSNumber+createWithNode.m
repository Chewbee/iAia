//
//  NSNumber+createWithNode.m
//  iAia
//
//  Created by Georges-Henry Portefait on 09/11/12.
//
//

#import "NSNumber+createWithNode.h"

@implementation NSNumber (createWithNode)

+ (NSNumber*) createWithNode: (CXMLNode*) node
{
    if(node == nil) { return nil; }
    return (NSNumber*)[[NSNumber alloc] initWithNode: node];
}
//
- (id) initWithNode: (CXMLNode*) node
{
    if (self = [self init])
    {
        NSString *numTex = [NSString stringWithString:[Soap getNodeValue: node withName: @"Premium"]];
        double num = [ numTex doubleValue ] ;
        return([self initWithDouble:num] ) ;
    }
    return nil ; 
}
@end