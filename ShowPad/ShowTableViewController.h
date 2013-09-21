//
//  ShowTableViewController.h
//  ShowPad
//
//  Created by David Sieh on 9/21/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowDataSource.h"

@class Show;
@protocol ShowTableSelectionDelegate;

@interface ShowTableViewController : UIViewController <ShowDataSourceDelegate>

@property (strong, nonatomic) IBOutlet UITableView *showTable;
@property (strong, nonatomic) id<ShowTableSelectionDelegate>delegate;

@end

@protocol ShowTableSelectionDelegate <NSObject>

- (void)showSelected:(Show *)show;

@end
