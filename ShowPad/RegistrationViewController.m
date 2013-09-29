//
//  RegistrationViewController.m
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "RegistrationViewController.h"
#import "AppSettings.h"
#import "Show.h"
#import "ExhibitorSummaryViewController.h"

@interface RegistrationViewController () {
    UIPopoverController *_showPopoverController;
    ExhibitorDataSource *_exhibitorDataSource;
    Exhibitor *_currentExhibitor;
}

- (void)dismissShowPopoverController;

@end

@implementation RegistrationViewController

@synthesize registrationTable=_registrationTable;
@synthesize btnSelectShow=_btnSelectShow;

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
    _exhibitorDataSource = [ExhibitorDataSource createWithTableView:self.registrationTable delegate:self];
    
    Show *currentShow = [AppSettings getCurrentShow];
    if (currentShow) {
        self.btnSelectShow.title = currentShow.name;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *startingViewController;
    startingViewController = (UIViewController *)segue.sourceViewController;
    
    if ([segue.identifier isEqualToString:@"ShowPopover"]) {
    
        ShowTableViewController *showTable;
    
        showTable = (ShowTableViewController *)segue.destinationViewController;
    
        _showPopoverController = ((UIStoryboardPopoverSegue *)segue).popoverController;
    
        showTable.delegate = self;
    } else if ([segue.identifier isEqualToString:@"ExhibitorInfo"]) {
        
        NSIndexPath *path = self.registrationTable.indexPathForSelectedRow;
        Exhibitor *exhibitor = [_exhibitorDataSource exhibitorAtRow:path.row];
        ExhibitorSummaryViewController *summaryController = (ExhibitorSummaryViewController *)segue.destinationViewController;
        
        summaryController.exhibitor = exhibitor;
    }
}

#pragma mark -
#pragma mark ShowTableViewControllerDelegate

- (void)showSelected:(Show *)show {
    NSLog(@"A show was selected");
    [self dismissShowPopoverController];
    
    // Set the name of the selected show...
    self.btnSelectShow.title = show.name;
    
    [AppSettings setCurrentShow:show];
}


#pragma mark -
#pragma mark Private Methods

- (void)dismissShowPopoverController {
    if (_showPopoverController) {
        [_showPopoverController dismissPopoverAnimated:YES];
        _showPopoverController = nil;
    }
}

#pragma mark -
#pragma mark ExhibitorDataSourceDelegate methods

- (void)exhibitorSelected:(Exhibitor *)exhibitor {
    NSLog(@"Exhibitor Selected!!!");
    _currentExhibitor = exhibitor;
}

#pragma mark -
#pragma mark UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [_exhibitorDataSource filterTable:searchText];
}
@end
