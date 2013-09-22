//
//  ExhibitorPuller.h
//  ShowPad
//
//  Created by David Sieh on 9/21/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestRequest.h"

@protocol ExhibitorPullerDelegate;

@interface ExhibitorPuller : NSObject <RestRequestDelegate>

+ (id)create;

- (void)pullAndLetMeKnow:(id<ExhibitorPullerDelegate>)delegate;

@end

@protocol ExhibitorPullerDelegate <NSObject>

- (void)pulledExhibitors:(NSArray *)exhibitors;

@end
