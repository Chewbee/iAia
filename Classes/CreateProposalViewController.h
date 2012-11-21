//
//  CreateProposalViewController.h
//  iAia
//
//  Created by Georges-Henry Portefait on 09/11/12.
//
//

#import <UIKit/UIKit.h>
#import "fastQuoteModel.h"




@interface CreateProposalViewController : UIViewController
//model
@property (nonatomic,strong) FastQuoteModel     *fastQuoteModel ;
//interface outlets
@property (strong, nonatomic) IBOutlet UIButton *createProposalButton;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *streetName;
@property (weak, nonatomic) IBOutlet UITextField *zipCode;
@property (weak, nonatomic) IBOutlet UITextField *state;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *familyTextField;
@property (weak, nonatomic) IBOutlet UITextField *coverageTextField;
// IB actions 
- (IBAction)createProposal:(id)sender;


@end
