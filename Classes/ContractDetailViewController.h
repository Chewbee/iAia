//
//  ContractDetailViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 04/05/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSCContract.h"
#import "iAIADataController.h"


@interface ContractDetailViewController :UIViewController {

	
}
@property (nonatomic,strong) CSCContract *contract ;
@property (nonatomic,weak) iAIADataController *dataController ;
@end
