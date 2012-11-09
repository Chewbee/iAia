//
//  CreateProposalViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 09/11/12.
//
//

#import "CreateProposalViewController.h"

@interface CreateProposalViewController ()

@end

@implementation CreateProposalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//
//
-(void)turnIntoContractfMockup
{
    /*
     [self displayRefreshingIndicators];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    BOOL mocked = [defaults boolForKey:@"mocked"] ;
    // mocked is now a user setting
    if (mocked) {
        [self turnIntoContractfMockup];
        return ;
    } else {
        NSString *login = [defaults stringForKey:@"login_preference" ] ;
        NSString *password = [defaults stringForKey:@"password_preference" ] ;
        ServiceContractCreate *service = [ServiceContractCreate serviceWithUsername:login andPassword:password];
        // get the params
        // Returns CSCContract*.
        [service ContractCreate:self
                         action:@selector(ContractCreateHandler:)
                    Environment: [[CSCWMEnv alloc] init]
                ActivityRequest: [[CSCActivityRequest alloc] init]
                  SavingsScheme: [[CSCSavingsScheme alloc] init]
                       Contract: [[CSCContract alloc] init]];
    }
     */
}
//
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCreateProposalButton:nil];
    [self setEmailTextField:nil];
    [self setNameTextField:nil];
    [super viewDidUnload];
}
- (IBAction)createProposal:(id)sender {
}
@end