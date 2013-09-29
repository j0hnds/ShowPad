//
//  ExhibitorDataSource.h
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExhibitorPuller.h"

@class Exhibitor;
@protocol ExhibitorDataSourceDelegate;

@interface ExhibitorDataSource : NSObject <UITableViewDelegate, UITableViewDataSource, ExhibitorPullerDelegate>

+ (id)createWithTableView:(UITableView *)tableView
                 delegate:(id<ExhibitorDataSourceDelegate>)delegate;

- (void)filterTable:(NSString *)filterText;

- (Exhibitor *)exhibitorAtRow:(NSInteger)row;

@end

@protocol ExhibitorDataSourceDelegate <NSObject>

- (void)exhibitorSelected:(Exhibitor *)exhibitor;

@end

