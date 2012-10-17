//
//  StateViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import "StateViewController.h"

@interface StateViewController ()

@end

@implementation StateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setStates:@[@"Australian Capital Territory",@"New South Wales",@"Queensland",@"Southern Australia",@"Tasmania",@"Victoria",@"Western Australia"]];
	[self setFastQuoteModel:[[FastQuoteModel alloc]init]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//

#pragma mark -
#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1 ;
}
//
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[self states] count];
}
//
#pragma mark -
#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[self states] objectAtIndex:row] ;
}
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.fastQuoteModel setState: [[self statePicker]selectedRowInComponent:0]];
    [segue.destinationViewController setFastQuoteModel:[self fastQuoteModel] ] ;
}
//
- (void)viewDidUnload {
    [self setStatePicker:nil];
    [super viewDidUnload];
}
//
@end
