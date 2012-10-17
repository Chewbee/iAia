//
//  QuoteViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import "QuoteFamilyStructureViewController.h"

@implementation QuoteFamilyStructureViewController

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
    [self setFamilyStructure:@[@"Single",@"Couple",@"Family",@"Family w/o minor",@"Single family"]];
	[self setFastQuoteModel:[[FastQuoteModel alloc]init]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [self setFamilyPicker:nil];
    [super viewDidUnload];
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
    return [[self familyStructure] count];
}
//
#pragma mark -
#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[self familyStructure] objectAtIndex:row] ;
}
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.fastQuoteModel setFamilyStructure: [[self familyPicker]selectedRowInComponent:0]];
    [segue.destinationViewController setFastQuoteModel:[self fastQuoteModel] ] ;
}
//
@end
