//
//  CoverageCollectionViewController.m
//  iAia
//
//  Created by Georges-Henry PORTEFAIT on 27/10/12.
//
//

#import "CoverageCollectionViewController.h"

@interface CoverageCollectionViewController ()

@end

@implementation CoverageCollectionViewController

#pragma mark - UICollectieDataSource protocol methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
		case 0:
            return 1;
            break;
        case 1:
            return 5 ;
            break;
        case 2:
            return 3 ;
            break;
    }
    return 0 ;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2 ;
}
//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil ;
	int section = indexPath.section ;
	
    
    
    switch (section) {
		case 0:
        {
            QuoteCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QuoteCell" forIndexPath:indexPath] ;
            [cell.premiumAmount setText: @"100.0" ];
            [cell setBackgroundColor: [UIColor blackColor] ] ;
        }
            break;
        case 1:
        {
            CoverageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CoverageCell" forIndexPath:indexPath] ;
            switch (indexPath.row) {
                case 0:
                    [cell.contentView.layer setBackgroundColor: (__bridge CGColorRef)(_young)] ;
                    break;
                case 1:
                    [cell.contentView.layer setBackgroundColor: (__bridge CGColorRef)(_basic)] ;
                    break ;
                case 2:
                    [cell.contentView.layer setBackgroundColor: (__bridge CGColorRef)(_mid)] ;
                    break;
                case 3:
                    [cell.contentView.layer setBackgroundColor: (__bridge CGColorRef)(_top)] ;
                    break ;
                case 4:
                    [cell.contentView.layer setBackgroundColor: (__bridge CGColorRef)(_ultra)] ;
                    break;
                default:
                    [cell setBackgroundColor: [UIColor blackColor] ] ;
                    break;
            }
           
        }
            break;
        default:
            break;
    }

    //
//    [cell.contentView.layer setCornerRadius:20.0f];
//    [cell.contentView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
//    [cell.contentView.layer setBorderWidth:1.5f];
//    [cell.contentView.layer setShadowColor:[UIColor blackColor].CGColor];
//    [cell.contentView.layer setShadowOpacity:0.8];
//    [cell.contentView.layer setShadowRadius:3.0];
//    [cell.contentView.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    return cell ;
}
//
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    int section = indexPath.section ;
    UICollectionReusableView *view = nil ;

    switch (section) {
		case 0:
            view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"QuoteHeader" forIndexPath:indexPath ] ;
            break;
        case 1:
            view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CoverageHeader" forIndexPath:indexPath ] ;
            break;
        case 2:
            //view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"OptionsHeader" forIndexPath:indexPath ] ;
            break;
    }
    return view ;
}
#pragma mark Layout Stuff
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return CGSizeMake(768, 50);
            break;

        default:
            break;
    }
    return CGSizeMake(768, 10);
}
//
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10) ;
}
//
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(500, 150) ;
            break;
        case 1:
            return CGSizeMake(100, 500);
        default:
            break;
    }
    return CGSizeMake(50, 50);
}
#pragma mark - Web Service stuff
-(void) getTariff
{
    //
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    BOOL mocked = [defaults boolForKey:@"mocked"] ;
    // mocked is now a user setting
    if (mocked) {
        [self getTariffMockup];
        return ;
    } else {
        NSString *login = [defaults stringForKey:@"login_preference" ] ;
        NSString *password = [defaults stringForKey:@"password_preference" ] ;
        ServiceGetTariff  *service = [ServiceGetTariff serviceWithUsername:login andPassword:password] ;
        // get the params
        [service  CalculationOfPremium: self action:@selector(ServiceGetTariffHandler:)
                           Environment: [[CSCWMEnv alloc] init]
                       FamilyStructure: [[self fastQuoteModel] familyString]
                                 State:[[self fastQuoteModel]stateString ]
                         BirthDateList:[NSMutableArray arrayWithArray:[[self fastQuoteModel] birthDatesArray]]
                              Contract: nil ];
    }

}
#pragma mark -
#pragma mark Service returns
// Handle the response from invokeServiceContractList.
- (void) ServiceGetTariffHandler: (id) value
{
	[[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ;
    // Handle errors
	if([value isKindOfClass:[NSError class]]) {
        NSString *errorMsg = [(NSError*)value localizedDescription] ;
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:errorMsg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView setDelegate:self ] ;
        [alertView show] ;
		return;
	}
	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
        NSString *errorMsg = [(SoapFault*)value faultString] ;
        UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"Fault" message:errorMsg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView setDelegate:self ] ;
        [alertView show] ;
		return;
    }
    // Do something with the NSMutableArray* result
    //TODO: do the work
    //    [self setContracts: (NSMutableArray*)value ];

}
-(void) getTariffMockup
{
    //  using local resource file in mockup mode
    NSString *XMLPath = nil ;
    XMLPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ProductExtractResponse.xml"];
    NSData *XMLData =nil;
    XMLData = [NSData dataWithContentsOfFile:XMLPath];
    //FIXME: IT IS a product that is returned
    //[self setProductDetail:[self populateContractArrayWithData:(NSData*) XMLData]];
}

//
#pragma mark -
#pragma mark init stuff did load etc . 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _young =    [UIColor colorWithRed:0.4196 green:0.6510 blue:0.8157 alpha:1.0f] ;
    _basic =    [UIColor colorWithRed:0.2235 green:0.5176 blue:0.7451 alpha:1.0f] ;
    _mid =      [UIColor colorWithRed:0.1686 green:0.4196 blue:0.5451 alpha:1.0f] ;
    _top =      [UIColor colorWithRed:0.0667 green:0.2392 blue:0.3765 alpha:1.0f] ;
    _ultra =    [UIColor colorWithRed:0.3451 green:0.1569 blue:0.4471 alpha:1.0f] ;
    // Custom initialization
    [self.collectionView registerClass:[QuoteCell class] forCellWithReuseIdentifier:@"QuoteCell"];
    [self.collectionView registerClass:[CoverageViewCell class] forCellWithReuseIdentifier:@"CoverageCell"];
    //[self.collectionView registerNib:[UINib nibWithNibName:@"CoverageCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CoverageCell"];

    // suplemmentary views
    [self.collectionView registerClass:[QuoteHeaderView class ]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"QuoteHeader"];
    [self.collectionView registerClass:[CoverageHeaderView class ]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CoverageHeader"];
    [self.collectionView registerClass:[OptionHeaderView class ]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"OptionHeader"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
