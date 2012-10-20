//
//  SubscriberViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 17/10/12.
//
//

#import "SubscriberViewController.h"

@interface SubscriberViewController ()

@end

@implementation SubscriberViewController

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
	
}
-(void)viewWillAppear:(BOOL)animated
{
    // if the family structure is only one adult, hide the segmented control
    if ([[self fastQuoteModel]familyStructure]== 0 || [[self fastQuoteModel]familyStructure]== 4) {
        [self.subscriberSegmented setHidden:TRUE];
        [self.mediBankImage setHidden:FALSE];
    }
    else
    {
        [self.subscriberSegmented setHidden:FALSE];
        [self.mediBankImage setHidden:TRUE];
    }
    // register segmented control action
    [self.subscriberSegmented addTarget:self
                         action:@selector(segmentedClicked:)
               forControlEvents:UIControlEventValueChanged];
    // set the date picker properly according to the segmented control
    [self setDates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setSubscriberSegmented:nil];
    [self setDatePicker:nil];
    [self setMediBankImage:nil];
    [super viewDidUnload];
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
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [segue.destinationViewController setFastQuoteModel:[self fastQuoteModel] ] ;
}
//
@end
