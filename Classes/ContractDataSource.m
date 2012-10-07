//
//  ContractDataSource.m
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContractDataSource.h"




@implementation ContractDataSource

@synthesize dataReady ;

#pragma mark -
#pragma mark alloc and dealloc
//
static ContractDataSource * _theContractDataSource = nil ;
// Singleton implemention
+(ContractDataSource*) sharedInstance {
	if ( _theContractDataSource == nil ) {
		_theContractDataSource = [[self alloc]init] ;
	}
	return _theContractDataSource ;
}

-(id)init {
    CSCWMccde =[[CSCWorkManagementClientContractDisplayExtract alloc]init] ;
    [self setDataReady: FALSE] ;
    _contracts = [NSMutableArray array] ;
    return self ;
}
//
-(void) refreshData {
    [CSCWMccde invokeService];
    [self setDataReady: [CSCWMccde isFaulty]];
#ifdef MOCKING
    // plug the file from Krasen as a return 
    [self mockupFile];
#else
    // 
#endif
}
//
-(NSInteger) contractCount {
    return [_contracts count];
}
//
-(CSCContract*) getContractFromIdx:(NSInteger) idx
{
    return [[self contracts]objectAtIndex:idx ];
}
//
-(void) mockupFile {
    NSError *err = nil ;
    //  using local resource file in mockup mode
    NSString *XMLPath = nil ;
    XMLPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ContractGetSummaryResponse_IUL00000348.txt"];
    NSData *XMLData =nil;
    XMLData = [NSData dataWithContentsOfFile:XMLPath];
    CXMLDocument *doc = nil ;
    doc = [[CXMLDocument alloc] initWithData:XMLData options:0 error:nil];
    //
    NSArray *nodes = nil ;
    // namespace
    NSDictionary *dict = @{ @"http://www.csc.com/graphtalk/aia" : @"aia"  };
    //  searching for Contract nodes
    nodes = [doc nodesForXPath:@"//*[local-name()='Contract']" namespaceMappings:dict error:&err];
    
    NSLog(@"Resultnodes: %@", nodes);
    
    for (CXMLNode *node in nodes)
    {
        // creating contract objects from content
        CSCContract *contract= [CSCContract createWithNode:node];
        if (contract) {
            [self.contracts addObject:contract] ;
        }
    }
    
    //  and we print our results
}

@end
