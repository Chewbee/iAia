//
//  iPadQuoteViewController.m
//  iAia
//
//  Created by Georges-Henry PORTEFAIT on 20/10/12.
//
//

#import "iPadQuoteViewController.h"

@interface iPadQuoteViewController ()


@end

@implementation iPadQuoteViewController

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
    [self setFamilyStructure:@[@"Single",@"Couple",@"Family",@"Family w/o minor",@"Single family"]];
    [self setStates:@[@"Australian Capital Territory",@"New South Wales",@"Queensland",@"Southern Australia",@"Tasmania",@"Victoria",@"Western Australia"]];
	[self setFastQuoteModel:[[FastQuoteModel alloc]init]];
    [[self fastQuoteModel] invokeServiceProductExtract:@"HE_%" ];
}
-(void)viewWillAppear:(BOOL)animated
{
        // register segmented control action
    [self.subscriberSegmented addTarget:self
                                 action:@selector(segmentedClicked:)
                       forControlEvents:UIControlEventValueChanged];
    // set the date picker properly according to the segmented control
    [self setDates];
}
//
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == self.familyPicker ) {
        [self.fastQuoteModel setFamilyStructure: [[self familyPicker]selectedRowInComponent:0]];
    } else if ( pickerView == self.statePicker )
    {
        [self.fastQuoteModel setState: [[self familyPicker]selectedRowInComponent:0]];
    }
    //
    // if the family structure is only one adult, hide the segmented control
    if ([[self fastQuoteModel]familyStructure]== 0 || [[self fastQuoteModel]familyStructure]== 4) {
        [self.subscriberSegmented setHidden:TRUE];
    }
    else
    {
        [self.subscriberSegmented setHidden:FALSE];
    }
}
//
- (IBAction)segmentedClicked:(id)sender
{
    [self setDates];
}
-(void) setDates
{
    if ([[self subscriberSegmented] selectedSegmentIndex]==0) {
        NSDate *date = [[self.fastQuoteModel birthDates] valueForKey:@"subscriber" ];
        if (date) {
            [self.datePicker setDate:date];
        }
    } else if ([[self subscriberSegmented] selectedSegmentIndex]==1)
    {
        //[[[self fastQuoteModel] birthDates] setValue:[self.datePicker date ] forKey:@"partner"];
        NSDate *date = [[self.fastQuoteModel birthDates] valueForKey:@"partner" ];
        if (date) {
            [self.datePicker setDate:date];
        }
    }
}

- (IBAction)datePickerSelect:(id)sender
{
    if ([[self subscriberSegmented] selectedSegmentIndex]==0) {
        [[[self fastQuoteModel] birthDates] setValue:[self.datePicker date ] forKey:@"subscriber"];
    } else if ([[self subscriberSegmented] selectedSegmentIndex]==1)
    {
        [[[self fastQuoteModel] birthDates] setValue:[self.datePicker date ] forKey:@"partner"];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)viewDidUnload {
    [self setFamilyStructure:nil];
    [self setStates:nil];
    [self setFamilyPicker:nil];
    [self setStatePicker:nil];
    [self setDatePicker:nil];
    [self setSubscriberSegmented:nil];
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
    if (pickerView == self.familyPicker ) {
        return [[self familyStructure] count];
    } else return [[self states] count];
}
//
#pragma mark -
#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.familyPicker ) {
        return [[self familyStructure] objectAtIndex:row] ;
    } else return [[self states] objectAtIndex:row] ;
    
}
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.fastQuoteModel setFamilyStructure: [[self familyPicker]selectedRowInComponent:0]];
    [segue.destinationViewController setFastQuoteModel:[self fastQuoteModel] ] ;
}
//
@end
