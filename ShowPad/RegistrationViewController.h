//
//  RegistrationViewController.h
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowTableViewController.h"
#import "ExhibitorDataSource.h"
#import "ExhibitorEntryViewController.h"

@interface RegistrationViewController : UIViewController <ShowTableSelectionDelegate,ExhibitorDataSourceDelegate,UISearchBarDelegate,ExhibitorEntryViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *registrationTable;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnSelectShow;

@end
