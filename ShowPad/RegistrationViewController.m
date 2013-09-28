//
//  RegistrationViewController.m
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController () {
    UIPopoverController *_showPopoverController;
    ExhibitorDataSource *_exhibitorDataSource;
}

- (void)dismissShowPopoverController;

@end

@implementation RegistrationViewController

@synthesize registrationTable=_registrationTable;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *startingViewController;
    
    ShowTableViewController *showTable;
    
    startingViewController = (UIViewController *)segue.sourceViewController;
    showTable = (ShowTableViewController *)segue.destinationViewController;
    
    _showPopoverController = ((UIStoryboardPopoverSegue *)segue).popoverController;
    
    NSLog(@"Setting the delegate for show selection");
    
    showTable.delegate = self;
}

#pragma mark -
#pragma mark ShowTableViewControllerDelegate

- (void)showSelected:(Show *)show {
    NSLog(@"A show was selected");
    [self dismissShowPopoverController];
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

- (void)exhibitorSelected:(Exhibitor *)show {
    NSLog(@"Exhibitor Selected!!!");
}

#pragma mark -
#pragma mark UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [_exhibitorDataSource filterTable:searchText];
}
@end
