//
//  AttendanceViewController.m
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "AttendanceViewController.h"

@interface AttendanceViewController () {
    UIPopoverController *_showPopoverController;
}

- (void)dismissShowPopoverController;

@end

@implementation AttendanceViewController

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


@end
