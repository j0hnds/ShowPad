//
//  ExhibitorDataSource.m
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "ExhibitorDataSource.h"
#import "Exhibitor.h"

@interface ExhibitorDataSource () {
    UITableView *_tableView;
    id<ExhibitorDataSourceDelegate> _delegate;
    NSArray *_exhibitorList;
    NSArray *_fullList;
    ExhibitorPuller *_exhibitorPuller;
    NSString *_filterText;
    
}

- (id)initWithTableView:(UITableView *)tableView
               delegate:(id<ExhibitorDataSourceDelegate>)delegate;
@end

@implementation ExhibitorDataSource

#pragma mark
#pragma mark Construction

+ (id)createWithTableView:(UITableView *)tableView
                 delegate:(id<ExhibitorDataSourceDelegate>)delegate {
    
    return [[ExhibitorDataSource alloc] initWithTableView:tableView
                                            delegate:delegate];
}

- (id)initWithTableView:(UITableView *)tableView
               delegate:(id<ExhibitorDataSourceDelegate>)delegate {
    self = [super init];
    if (self) {
        _tableView = tableView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _delegate = delegate;
        _exhibitorList = nil;
        _exhibitorPuller = [ExhibitorPuller create];
        [_exhibitorPuller pullAndLetMeKnow:self];
        
    }
    
    return self;
}

- (void)filterTable:(NSString *)filterText {
    _filterText = filterText;
    _exhibitorList = nil;
    _exhibitorList = [NSMutableArray array];
    if (filterText && filterText.length > 0) {
        for (Exhibitor *exhibitor in _fullList) {
            if ([exhibitor matchesFilterText:filterText]) {
                [((NSMutableArray *)_exhibitorList) addObject:exhibitor];
            }
        }
    }
    [_tableView reloadData];
}

#pragma mark -
#pragma mark UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Need to access the list of exhibitors and return how many there are.
    return (_exhibitorList) ? _exhibitorList.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ExhibitorCell"];
    
    // Get the exhibitor that represents the index
    Exhibitor *exhibitor = (Exhibitor *)[_exhibitorList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [exhibitor formattedName];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Get the exhibitor that represents the index
    Exhibitor *exhibitor = (Exhibitor *)[_exhibitorList objectAtIndex:indexPath.row];
    
    [_delegate exhibitorSelected:exhibitor];
}

#pragma mark -
#pragma mark ExhibitorPullerDelegate Methods

- (void)pulledExhibitors:(NSArray *)exhibitors {
    _exhibitorList = exhibitors;
    _fullList = [NSArray arrayWithArray:_exhibitorList];
    [_tableView reloadData];
}

@end
