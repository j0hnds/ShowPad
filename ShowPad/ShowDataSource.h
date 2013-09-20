//
//  ShowDataSource.h
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Show;

@protocol ShowDataSourceDelegate <NSObject>

- (void)showSelected:(Show *)show;

@end

@interface ShowDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>

+ (id)createWithTableView:(UITableView *)tableView
                 delegate:(id<ShowDataSourceDelegate>)delegate;

@end
