//
//  AppSettings.m
//  ShowPad
//
//  Created by David Sieh on 9/28/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "AppSettings.h"
#import "Show.h"

static NSString * const kCurrentShowId = @"CurrentShowId";
static NSString * const kCurrentShowName = @"CurrentShowName";


@interface AppSettings ()

+ (NSUserDefaults *)userDefaults;

@end


@implementation AppSettings

+ (void)setDefaults {
    // None yet...
}

+ (NSString *)stringForKey:(NSString *)key {
    return [self.userDefaults stringForKey:key];
}

#pragma mark - 
#pragma mark Value Settings

+ (void) setCurrentShow:(Show *)currentShow {
    [self.userDefaults setInteger:currentShow.showId forKey:kCurrentShowId];
    [self.userDefaults setObject:currentShow.name forKey:kCurrentShowName];
}

+ (Show *)getCurrentShow {
    NSInteger showId = [self.userDefaults integerForKey:kCurrentShowId];
    NSString *showName = [self stringForKey:kCurrentShowName];
    Show *show = nil;
    if (showName) {
        show = [Show createShowWithId:showId];
        show.name = showName;
    }
    return show;
}

#pragma mark -
#pragma mark Private Methods

+ (NSUserDefaults *)userDefaults {
    return [NSUserDefaults standardUserDefaults];
}

@end
