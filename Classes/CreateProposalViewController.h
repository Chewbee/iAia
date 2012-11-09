//
//  CreateProposalViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 09/11/12.
//
//

#import <UIKit/UIKit.h>

@interface CreateProposalViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *createProposalButton;
- (IBAction)createProposal:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@end
