//
//  GBSourceObjectModel.h
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GBIconModel;

@interface GBSourceObjectModel : NSObject

@property (nonatomic, strong) NSString *sourceID;
@property (nonatomic, strong) NSString *sourceName;
@property (nonatomic, strong) NSString *sourceDescription;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) GBIconModel *urlsToLogos;
@property (nonatomic, strong) NSArray *sortBysAvailable;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


@interface GBIconModel : NSObject

@property (nonatomic, strong) NSString *smallIcon;
@property (nonatomic, strong) NSString *mediumIcon;
@property (nonatomic, strong) NSString *largeIcon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

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
