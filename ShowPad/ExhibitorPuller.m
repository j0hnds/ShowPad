//
//  ExhibitorPuller.m
//  ShowPad
//
//  Created by David Sieh on 9/21/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "ExhibitorPuller.h"
#import "RestRequest.h"
#import "Exhibitor.h"

@interface ExhibitorPuller () {
    id<ExhibitorPullerDelegate> _delegate;
}

- (id)init;
- (NSArray *)mapToExhibitors:(NSArray *)exhibitorHashes;

@end

@implementation ExhibitorPuller

+ (id)create {
    return [[ExhibitorPuller alloc] init];
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)pullAndLetMeKnow:(id<ExhibitorPullerDelegate>) delegate {
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.133:3000/exhibitors"];
    RestRequest *request = [RestRequest createRequestWithURL:url
                                                 andDelegate:self
                                          andIsAuthenticated:NO];
    _delegate = delegate;
    
    [request start];
}

#pragma mark -
#pragma mark RestRequestDelegate Methods

- (void)request:(RestRequest *)request didFailWithError:(NSError *)error {
    NSLog(@"Error pulling exhibitors: %@", error.localizedDescription);
}

- (void)requestDidFinishLoading:(RestRequest *)request {
    switch (request.statusCode) {
        case 200: // Success
            [_delegate pulledExhibitors:[self mapToExhibitors:request.responseObject]];
            break;
        default:
            NSLog(@"Something other than a 200");
            break;
    }
}

- (NSArray *)mapToExhibitors:(NSArray *)exhibitorHashes {
    NSMutableArray *exhibitors = [NSMutableArray array];
    
    for (NSDictionary *exhibitorData in exhibitorHashes) {
        [exhibitors addObject:[Exhibitor createExhibitorWithDictionary:exhibitorData]];
    }
    
    return exhibitors;
}

@end
