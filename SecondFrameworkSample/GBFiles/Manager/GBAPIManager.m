//
//  GBAPIManager.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import "GBAPIManager.h"

static NSString *keyAPIKey = @"a96a35e2d1fb434f83fe73d4c75b6b4e";

@implementation GBAPIManager

+ (instancetype)sharedInstance
{
    static id object;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        object = [[self alloc] init];
    });
    
    return object;
}

- (void)fetchNewsSourcesWithcompletionBlock:(GBAPIResponse)completed
{
    NSString *requestUrlString = [NSString stringWithFormat:@"%@", @"https://newsapi.org/v1/sources"];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:requestUrlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.timeoutIntervalForRequest = 20;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!error) {
            
            NSDictionary* responseData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            completed(responseData,response,error);
        }else{
            completed(nil,response,error);
        }
    }];
    
    [dataTask resume];
}

- (void)fetchNewsArticlesWithSource:(NSString *)source andSortBy:(NSString *)sortBy CompletionBlock:(GBAPIResponse)completed
{
    NSString *requestUrlString = [NSString stringWithFormat:@"https://newsapi.org/v1/articles?source=%@&sortBy=%@&apiKey=%@",source,sortBy,keyAPIKey];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:requestUrlString]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.timeoutIntervalForRequest = 60;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!error) {
            
            NSDictionary* responseData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            completed(responseData,response,error);
        }else{
            completed(nil,response,error);
        }
    }];
    
    [dataTask resume];
}
@end
