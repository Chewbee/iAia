//
//  NSNumber+createWithNode.h
//  iAia
//
//  Created by Georges-Henry Portefait on 09/11/12.
//
//

#import <Foundation/Foundation.h>
#import "Soap.h"

@interface NSNumber (createWithNode)

+ (NSNumber*) createWithNode: (CXMLNode*) node;
- (id) initWithNode: (CXMLNode*) node;

@end
