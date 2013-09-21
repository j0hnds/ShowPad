//
//  ShowPuller.h
//  ShowPad
//
//  Created by David Sieh on 9/21/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestRequest.h"

@protocol ShowPullerDelegate;

@interface ShowPuller : NSObject <RestRequestDelegate>

+ (id)create;

- (void)pullAndLetMeKnow:(id<ShowPullerDelegate>)delegate;

@end

@protocol ShowPullerDelegate <NSObject>

- (void)pulledShows:(NSArray *)shows;

@end