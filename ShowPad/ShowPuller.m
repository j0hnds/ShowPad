//
//  ShowPuller.m
//  ShowPad
//
//  Created by David Sieh on 9/21/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "ShowPuller.h"
#import "RestRequest.h"
#import "Show.h"

@interface ShowPuller () {
    id<ShowPullerDelegate> _delegate;
}

- (id)init;
- (NSArray *)mapToShows:(NSArray *)showHashes;

@end

@implementation ShowPuller

+ (id)create {
    return [[ShowPuller alloc] init];
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)pullAndLetMeKnow:(id<ShowPullerDelegate>) delegate {
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.133:3000/shows"];
    RestRequest *request = [RestRequest createRequestWithURL:url
                                                 andDelegate:self
                                          andIsAuthenticated:NO];
    _delegate = delegate;
    
    [request start];
}

#pragma mark -
#pragma mark RestRequestDelegate Methods

- (void)request:(RestRequest *)request didFailWithError:(NSError *)error {
    NSLog(@"Error pulling shows: %@", error.localizedDescription);
}

- (void)requestDidFinishLoading:(RestRequest *)request {
    switch (request.statusCode) {
        case 200: // Success
            [_delegate pulledShows:[self mapToShows:request.responseObject]];
            break;
        default:
            NSLog(@"Something other than a 200");
            break;
    }
}

- (NSArray *)mapToShows:(NSArray *)showHashes {
    NSMutableArray *shows = [NSMutableArray array];
    
    for (NSDictionary *showData in showHashes) {
        Show *show = [Show createShowWithId:[[showData objectForKey:@"id"] intValue]
                                    andName:[showData objectForKey:@"name"]];
        [shows addObject:show];
    }
    
    return shows;
}

@end
