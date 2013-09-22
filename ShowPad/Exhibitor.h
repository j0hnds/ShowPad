//
//  Exhibitor.h
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exhibitor : NSObject

@property (nonatomic) NSInteger exhibitorId;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *address1;
@property (strong, nonatomic) NSString *address2;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *postalCode;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *fax;
@property (strong, nonatomic) NSString *cell;
@property (strong, nonatomic) NSString *email;

+ (id)createExhibitorWithId:(NSInteger)showId;
+ (id)createExhibitorWithDictionary:(NSDictionary *)exhibitorData;

- (NSString *)formattedName;

@end
