//
//  AppSettings.h
//  ShowPad
//
//  Created by David Sieh on 9/28/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Show;

@interface AppSettings : NSObject

+ (void)setDefaults;
+ (NSString *)stringForKey:(NSString *)key;

// Values we want to store/retrieve.
+ (void) setCurrentShow:(Show *)currentShow;
+ (Show *)getCurrentShow;

@end
