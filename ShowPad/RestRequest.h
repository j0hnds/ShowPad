//
//  RestRequest.h
//  ShowPad
//
//  Created by David Sieh on 9/15/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RestRequestDelegate;

@interface RestRequest : NSObject <NSURLConnectionDataDelegate>

@property (readonly,nonatomic) NSMutableData *responseData;

@property (readonly) id responseObject;

@property (readonly) int statusCode;

+ (id)createRequestWithURL:(NSURL *)requestURL
         andDelegate:(id<RestRequestDelegate>)delegate
  andIsAuthenticated:(BOOL)authenticated;

- (id)initRequestWithURL:(NSURL *)requestURL
             andDelegate:(id<RestRequestDelegate>)delegate
      andIsAuthenticated:(BOOL)authenticated;

- (void)setHTTPMethod:(NSString *)method;

- (void)headerValue:(NSString *)value forKey:(NSString *)key;

- (void)setJSONRequestData:(id)requestData;

- (void)start;

@end


@protocol RestRequestDelegate <NSObject>

- (void)request:(RestRequest *)request didFailWithError:(NSError *)error;

- (void)requestDidFinishLoading:(RestRequest *)request;

@end
