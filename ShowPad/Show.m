//
//  Show.m
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "Show.h"

@interface Show ()

- (id)initShowWithId:(NSInteger)showId andName:(NSString *)name;

@end

@implementation Show

@synthesize showId=_showId;
@synthesize name=_name;

+ (id)createShowWithId:(NSInteger)showId andName:(NSString *)name {
    return [[Show alloc] initShowWithId:showId andName:name];
}

- (id)initShowWithId:(NSInteger)showId andName:(NSString *)name {
    self = [super init];
    if (self) {
        _showId = showId;
        _name = name;
    }
    return self;
}

@end
