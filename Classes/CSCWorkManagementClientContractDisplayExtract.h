/*
 CSCWorkManagementClientExample.h
 Provides example and test runs the service's proxy methods.
 Generated by SudzC.com
 */
#import "CSCContract.h"

@interface CSCWorkManagementClientContractDisplayExtract : NSObject <UIAlertViewDelegate>
{
}

@property (nonatomic, assign, getter=isFaulty) BOOL faulty ;
@property (nonatomic,strong) NSMutableArray* serviceAnswer ;

-(void)invokeService;

@end
