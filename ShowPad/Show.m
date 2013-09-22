//
//  Show.m
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "Show.h"

@interface Show ()

- (id)initShowWithId:(NSInteger)showId;
- (id)initShowWithDictionary:(NSDictionary *)showData;

@end

@implementation Show

@synthesize showId=_showId;
@synthesize name=_name;

+ (id)createShowWithId:(NSInteger)showId {
    return [[Show alloc] initShowWithId:showId];
}

+ (id)createShowWithDictionary:(NSDictionary *)showData {
  return [[Show alloc] initShowWithDictionary:showData];
}

- (id)initShowWithId:(NSInteger)showId {
    self = [super init];
    if (self) {
        _showId = showId;
    }
    return self;
}

- (id)initShowWithDictionary:(NSDictionary *)showData {
    self = [super init];
    if (self) {
      self.showId = [[showData objectForKey:@"id"] intValue];
      self.name = [showData objectForKey:@"name"];
    }
    return self;
}

@end
