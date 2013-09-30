//
//  Exhibitor.m
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "Exhibitor.h"

@interface Exhibitor ()

- (id)initExhibitorWithId:(NSInteger)exhibitorId;
- (id)initExhibitorWithDictionary:(NSDictionary *)exhibitorData;

@end

@implementation Exhibitor

@synthesize exhibitorId=_exhibitorId;
@synthesize firstName=_firstName;
@synthesize lastName=_lastName;
@synthesize address1=_address1;
@synthesize address2=_address2;
@synthesize city=_city;
@synthesize state=_state;
@synthesize postalCode=_postalCode;
@synthesize phone=_phone;
@synthesize fax=_fax;
@synthesize cell=_cell;
@synthesize email=_email;

+ (id)createExhibitorWithId:(NSInteger)exhibitorId {
    return [[Exhibitor alloc] initExhibitorWithId:exhibitorId];
}

+ (id)createExhibitorWithDictionary:(NSDictionary *)exhibitorData {
    return [[Exhibitor alloc] initExhibitorWithDictionary:exhibitorData];
}

- (id)initExhibitorWithId:(NSInteger)exhibitorId {
    self = [super init];
    if (self) {
        _exhibitorId = exhibitorId;
    }
    return self;
}

- (id)initExhibitorWithDictionary:(NSDictionary *)exhibitorData {
    self = [super init];
    if (self) {
        self.exhibitorId = [[exhibitorData objectForKey:@"id"] intValue];
        self.firstName = [exhibitorData objectForKey:@"first_name"];
        self.lastName = [exhibitorData objectForKey:@"last_name"];
        self.address1 = [exhibitorData objectForKey:@"address_1"];
        self.address2 = [exhibitorData objectForKey:@"address_2"];
        self.city = [exhibitorData objectForKey:@"city"];
        self.state = [exhibitorData objectForKey:@"state"];
        self.postalCode = [exhibitorData objectForKey:@"postal_code"];

        // Loop through all the phones and put them in the correct spot
        for (NSDictionary *phoneData in [exhibitorData objectForKey:@"phones"]) {
            NSString *emailType = [phoneData objectForKey:@"phone_type"];
            if ([@"phone" isEqualToString:emailType]) {
                self.phone = [phoneData objectForKey:@"phone_number"];
            } else if ([@"fax" isEqualToString:emailType]) {
                self.fax = [phoneData objectForKey:@"phone_number"];
            } else if ([@"cell" isEqualToString:emailType]) {
                self.cell = [phoneData objectForKey:@"phone_number"];
            }
        }

        // There should be zero or one emails on an exhibitor
        NSArray *emails = [exhibitorData objectForKey:@"emails"];
        if ([emails count] > 0) {
            NSDictionary *emailData = emails.lastObject;
            self.email = [emailData objectForKey:@"address"];
        }
    }
    return self;
}

- (NSString *)formattedName {
    return [NSString stringWithFormat:@"%@, %@", self.lastName, self.firstName];
}

- (NSString *)formattedInformation {
    NSMutableString *s = [NSMutableString stringWithString:self.formattedName];
    [s appendString:@"\n"];
    if (self.address1 && self.address1.length > 0) {
        [s appendString:self.address1];
        [s appendString:@"\n"];
    } else if (self.address2 && self.address2.length > 0) {
        [s appendString:self.address2];
        [s appendString:@"\n"];
    }
    [s appendFormat:@"%@, %@  %@", self.city, self.state, self.postalCode];
    if (self.phone && self.phone.length > 0) {
        [s appendString:@"\n"];
        [s appendFormat:@"Phone: %@", self.phone];
    }
    if (self.fax && self.fax.length > 0) {
        [s appendString:@"\n"];
        [s appendFormat:@"Fax: %@", self.fax];
    }
    if (self.cell && self.cell.length > 0) {
        [s appendString:@"\n"];
        [s appendFormat:@"Cell: %@", self.cell];
    }
    if (self.email && self.email.length > 0) {
        [s appendString:@"\n"];
        [s appendFormat:@"Email: %@", self.email];
    }
    
    return s;
}


- (BOOL)matchesFilterText:(NSString *)filterText {
    return [self.firstName rangeOfString:filterText options:NSCaseInsensitiveSearch].location != NSNotFound ||
           [self.lastName rangeOfString:filterText options:NSCaseInsensitiveSearch].location != NSNotFound;
}

@end
