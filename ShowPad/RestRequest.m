//
//  RestRequest.m
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "RestRequest.h"

@interface RestRequest () {
    NSURL *_requestURL;
    id _responseObject;
    NSMutableURLRequest *_request;
    id<RestRequestDelegate> _delegate;
}

- (void)setUpHeadersForRequest:(NSMutableURLRequest *)request
           thatIsAuthenticated:(BOOL)authenticated;

@end

@implementation RestRequest

@synthesize responseData=_responseData;
@synthesize statusCode=_statusCode;


#pragma mark
#pragma mark Construction

+ (id)createRequestWithURL:(NSURL *)requestURL
               andDelegate:(id<RestRequestDelegate>)delegate
        andIsAuthenticated:(BOOL)authenticated {
    
    return [[RestRequest alloc] initRequestWithURL:requestURL
                                       andDelegate:delegate
                                andIsAuthenticated:authenticated];
}

- (id)initRequestWithURL:(NSURL *)requestURL
             andDelegate:(id<RestRequestDelegate>)delegate
      andIsAuthenticated:(BOOL)authenticated {
    
    self = [super init];
    if (self) {
        _requestURL = requestURL;
        _delegate = delegate;
        _request = [NSMutableURLRequest requestWithURL:_requestURL];
        
        [self setUpHeadersForRequest:_request
                 thatIsAuthenticated:authenticated];
    }
    return self;
}

#pragma mark
#pragma mark Request Methods

- (void)setHTTPMethod:(NSString *)method {
    [_request setHTTPMethod:method];
}

- (void)headerValue:(NSString *)value forKey:(NSString *)key {
    [_request setValue:value forHTTPHeaderField:key];
}

- (void)setJSONRequestData:(id)requestData {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:requestData options:kNilOptions error:&error];
    
    [_request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [_request setHTTPBody:jsonData];
}

- (void)start {
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:_request delegate:self];
    
    _responseData = [NSMutableData data];
    
    [connection start];
}

- (id)responseObject {
    if (_responseObject == nil) {
        NSError *error;
        _responseObject = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:&error];
    }
    return _responseObject;
}

#pragma mark
#pragma mark Private Methods

- (void)setUpHeadersForRequest:(NSMutableURLRequest *)request
           thatIsAuthenticated:(BOOL)authenticated {
    // Whenever we get authentication set up, put the detiails here.
}

#pragma mark
#pragma mark URLConnection Delegate

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {

    [_responseData setLength:0];
    
    _statusCode = [(NSHTTPURLResponse *)response statusCode];
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [_delegate requestDidFinishLoading:self];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
    [_delegate request:self didFailWithError:error];
}

#ifndef NDEBUG

/*
 In DEBUG mode, we will go ahead and allow this method to be
 overridden. This is the case were we can test against servers
 that may have a self-signed cert.
 
 In RELEASE mode (which is how things get delivered to the AppStore)
 this method override will not exist (see the ifdef, above).
 
 Please don't remove the conditional compilation.
 */

- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    // Warning!!!! Don't deliver this to production!!!
    //
    // There is a good chance that the app will be rejected from the App Store
    // If you do this.
    //
    // What this code does is say that it's OK to hit the server with an invalid (or self-signed) certificate.
    // In general not a good policy. Unfortunately, trinity uses self-signed certs. So there you go.
    //
    [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]
         forAuthenticationChallenge:challenge];
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
    
}

#endif


@end
