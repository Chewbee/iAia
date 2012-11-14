//
//  CoverageDetailViewController.m
//  iAia
//
//  Created by Georges-Henry Portefait on 29/10/12.
//
//

#import "CoverageDetailViewController.h"

@interface CoverageDetailViewController ()

@end

@implementation CoverageDetailViewController

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
}
//
-(void) viewWillAppear:(BOOL)animated
{
    NSMutableString *HTMLpage = [ NSMutableString stringWithString:@"<HTML><HEADER> <style type=\"text/css\"> h2 { color: #4B7DAF; }  </style> </HEADER><BODY bgcolor=\"#e1e1e1\">"] ;
    //
    CSCHealthCoverageDetail *hcd = [[self coverage] HealthCoverageDetail] ;
    NSMutableArray *formulasArray = [hcd FormulaList] ;
    for (CSCHealthFormula *formula in formulasArray){
        for (CSCHealthFormulaItem *formulaItem in [formula ItemList]){
            if ([[formulaItem TextList]count]>0) {
                for (NSString *detailText in formulaItem.TextList) {
                    if (! [detailText hasPrefix:@"<Health"])
                    {
                        NSString *line = [NSString stringWithString:detailText];
                        [HTMLpage appendFormat:@"%@",[self HTMLFromText:[line capitalizedString]] ] ;
                    }
                }
            }
        }
    }
    //
    NSString *pathAndFileName = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    
    NSError *error = nil ;
    [HTMLpage appendString:@"</BODY></HTML>"];
    [HTMLpage writeToFile:pathAndFileName atomically:YES encoding: NSUTF8StringEncoding error:&error];
    //
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:pathAndFileName isDirectory:NO]];
    //
    [[self coverageWebView] loadRequest:request];
}
//
-(NSString*) HTMLFromText: (NSString*) text
{
    NSMutableString *returnString = [NSMutableString stringWithString:@""];

    if ([text hasPrefix:@"**"]) {
        [returnString appendFormat:@"%@<br>",text];

    } else if ([text hasPrefix:@"*"]){
       [returnString appendFormat:@"<H3>%@</H3>",text];
        
    } else if ([text hasPrefix:@"-"]) {
        [returnString appendString:@"<hr width=\"75%\"      >"];
        
    } else if ([text isEqualToString:@"\n" ])
               [returnString appendString:@"<br>"];
    else
        [returnString appendFormat:@"<H2>%@</H2>",text];

    return returnString ;
}
//
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCoverageWebView:nil];
    [super viewDidUnload];
}
@end