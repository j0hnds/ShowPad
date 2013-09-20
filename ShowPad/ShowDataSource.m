//
//  ShowDataSource.m
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "ShowDataSource.h"

@interface ShowDataSource () {
    UITableView *_tableView;
    id<ShowDataSourceDelegate> _delegate;
}

- (id)initWithTableView:(UITableView *)tableView
               delegate:(id<ShowDataSourceDelegate>)delegate;
@end

@implementation ShowDataSource

#pragma mark
#pragma mark Construction

+ (id)createWithTableView:(UITableView *)tableView
                 delegate:(id<ShowDataSourceDelegate>)delegate {
    
    return [[ShowDataSource alloc] initWithTableView:tableView
                                            delegate:delegate];
}

- (id)initWithTableView:(UITableView *)tableView
               delegate:(id<ShowDataSourceDelegate>)delegate {
    self = [super init];
    if (self) {
        _tableView = tableView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _delegate = delegate;
    }
    
    return self;
}

#pragma mark
#pragma mark UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Need to access the list of shows and return how many there are.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShowCell"];
    
    // Get the show that represents the index
    
    cell.textLabel.text = @"A Show";
    
    return cell;
}

#pragma mark
#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Get the show that represents the index
    Show *show = nil;
    
    [_delegate showSelected:show];
}

@end
