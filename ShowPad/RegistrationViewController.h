//
//  RegistrationViewController.h
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowTableViewController.h"

@interface RegistrationViewController : UIViewController <ShowTableSelectionDelegate>

@property (strong, nonatomic) IBOutlet UITableView *registrationTable;

@end
