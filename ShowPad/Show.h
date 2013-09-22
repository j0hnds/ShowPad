//
//  Show.h
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Show : NSObject

@property (nonatomic) NSInteger showId;
@property (strong, nonatomic) NSString *name;

+ (id)createShowWithId:(NSInteger)showId;
+ (id)createShowWithDictionary:(NSDictionary *)showData;

@end
