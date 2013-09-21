//
//  ShowTableViewController.m
//  ShowPad
//
//  Created by David Sieh on 9/21/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "ShowTableViewController.h"

@interface ShowTableViewController () {
    ShowDataSource *_showDataSource;
}

@end

@implementation ShowTableViewController

@synthesize showTable=_showTable;
@synthesize delegate=_delegate;

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
//    [self.showTable reloadData];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"Hit the viewDidLoadMethod");
    _showTable = [ShowDataSource createWithTableView:self.showTable delegate:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark ShowDataSourceDelegate methods

- (void)showSelected:(Show *)show {
    if (self.delegate) {
        [self.delegate showSelected:show];
    }
}

@end
