//
//  GBAPIManager.h
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^GBAPIResponse)(NSDictionary *data, NSURLResponse *response, NSError *error);

@interface GBAPIManager : NSObject

+ (instancetype)sharedInstance;

- (void)fetchNewsSourcesWithcompletionBlock:(GBAPIResponse)completed;
- (void)fetchNewsArticlesWithSource:(NSString *)source andSortBy:(NSString *)sortBy CompletionBlock:(GBAPIResponse)completed;

@end
