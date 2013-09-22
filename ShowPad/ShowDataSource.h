//
//  ShowDataSource.h
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowPuller.h"

@class Show;
@protocol ShowDataSourceDelegate;

@interface ShowDataSource : NSObject <UITableViewDelegate, UITableViewDataSource, ShowPullerDelegate>

+ (id)createWithTableView:(UITableView *)tableView
                 delegate:(id<ShowDataSourceDelegate>)delegate;

@end

@protocol ShowDataSourceDelegate <NSObject>

- (void)showSelected:(Show *)show;

@end

