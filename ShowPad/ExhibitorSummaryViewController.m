//
//  ExhibitorSummaryViewController.m
//  ShowPad
//
//  Created by David Sieh on 9/29/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "ExhibitorSummaryViewController.h"
#import "Exhibitor.h"

@interface ExhibitorSummaryViewController ()

- (void)displayExhibitorInformation;

@end

@implementation ExhibitorSummaryViewController

@synthesize lblExhibitorInfo=_lblExhibitorInfo;
@synthesize exhibitor=_exhibitor;
@synthesize exhibitorModified=_exhibitorModified;

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
    // Sets the exhibitor information on the label
    [self displayExhibitorInformation];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *startingViewController;
    startingViewController = (UIViewController *)segue.sourceViewController;
    
    if ([segue.identifier isEqualToString:@"EditExhibitor"]) {
        ExhibitorEntryViewController *entryController = (ExhibitorEntryViewController *)segue.destinationViewController;
        entryController.delegate = self;
        entryController.exhibitor = self.exhibitor;
    }
}

#pragma mark -
#pragma mark ExhibitorEntryViewDelegate Methods

- (void)exhibitorEditingComplete:(Exhibitor *)exhibitor {
    NSLog(@"Completed exhibitor editing");
    self.exhibitor = exhibitor;
    _exhibitorModified = YES;
    [self displayExhibitorInformation];
}

//- (void)setExhibitor:(Exhibitor *)exhibitor {
//    _exhibitor = exhibitor;
//    
//    // Sets the exhibitor information on the label
//    NSString *info = exhibitor.formattedInformation;
//    
//    NSMutableAttributedString *s = [[NSMutableAttributedString alloc] initWithString:info];
//    NSRange range = NSMakeRange(0, [info rangeOfString:@"\n"].length);
//    [s addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14.0] range:range];
//    
//    self.lblExhibitorInfo.attributedText = s;
//}

- (IBAction)dismissSummary:(id)sender {
//    ((ViewController *)self.presentingViewController).emailLabel.text=
//    self.emailField.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Private Methods

- (void)displayExhibitorInformation {
    NSString *info = self.exhibitor.formattedInformation;
    
    NSMutableAttributedString *s = [[NSMutableAttributedString alloc] initWithString:info];
    NSRange range = NSMakeRange(0, [info rangeOfString:@"\n"].location);
    [s addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:18.0] range:range];
    
    self.lblExhibitorInfo.attributedText = s;
}
@end
