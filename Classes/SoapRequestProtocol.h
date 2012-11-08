//
//  SoapRequestProtocol.h
//  iAia
//
//  Created by Georges-Henry Portefait on 07/11/12.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SoapRequestProtocol <NSObject>

- (void)requestNeedsUserInteraction;
- (void)requestUserInteractionEnds;

@end