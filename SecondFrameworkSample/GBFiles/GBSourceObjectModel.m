//
//  GBSourceObjectModel.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import "GBSourceObjectModel.h"
#import "NSDictionary+Additions.h"

@implementation GBSourceObjectModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        if ([dictionary isValidDictionary]) {
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"id"]) {
                self.sourceID = [dictionary valueFromDictionaryWithNSNullCheck:@"id"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"name"]) {
                self.sourceName = [dictionary valueFromDictionaryWithNSNullCheck:@"name"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"description"]) {
                self.sourceDescription = [dictionary valueFromDictionaryWithNSNullCheck:@"description"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"url"]) {
                self.url = [dictionary valueFromDictionaryWithNSNullCheck:@"url"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"category"]) {
                self.category = [dictionary valueFromDictionaryWithNSNullCheck:@"category"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"language"]) {
                self.language = [dictionary valueFromDictionaryWithNSNullCheck:@"language"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"country"]) {
                self.country = [dictionary valueFromDictionaryWithNSNullCheck:@"country"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"urlsToLogos"] && [[dictionary valueFromDictionaryWithNSNullCheck:@"urlsToLogos"] isKindOfClass:[NSDictionary class]]) {
                self.urlsToLogos = [[GBIconModel alloc] initWithDictionary:[dictionary valueFromDictionaryWithNSNullCheck:@"urlsToLogos"]];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"sortBysAvailable"] && [[dictionary valueFromDictionaryWithNSNullCheck:@"sortBysAvailable"] isKindOfClass:[NSArray class]]) {
                self.sortBysAvailable = [dictionary valueFromDictionaryWithNSNullCheck:@"sortBysAvailable"];
            }
        }
    }
    return self;
}
@end


@implementation GBIconModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        if ([dictionary isValidDictionary]) {
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"small"]) {
                self.smallIcon = [dictionary valueFromDictionaryWithNSNullCheck:@"small"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"medium"]) {
                self.mediumIcon = [dictionary valueFromDictionaryWithNSNullCheck:@"medium"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"large"]) {
                self.largeIcon = [dictionary valueFromDictionaryWithNSNullCheck:@"large"];
            }
        }
    }
    return self;
}

@end

/*
 {
 "id": "buzzfeed",
 "name": "Buzzfeed",
 "description": "BuzzFeed is a cross-platform, global network for news and entertainment that generates seven billion views each month.",
 "url": "https://www.buzzfeed.com",
 "category": "entertainment",
 "language": "en",
 "country": "us",
 "urlsToLogos": {
 "small": "http://i.newsapi.org/buzzfeed-s.png",
 "medium": "http://i.newsapi.org/buzzfeed-m.png",
 "large": "http://i.newsapi.org/buzzfeed-l.png"
 },
 "sortBysAvailable": [
 "top",
 "latest"
 ]
 },
 */

