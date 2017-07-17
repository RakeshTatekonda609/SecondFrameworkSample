//
//  GBArticleObjectModel.h
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBArticleObjectModel : NSObject

@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *articleDescription;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *urlToImage;
@property (nonatomic, strong) NSString *publishedAt;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

/*
 {
 "author": "Bryan Clark",
 "title": "Feast your eyes on the first Google Cardboard prototype",
 "description": "Even the world’s biggest companies have to start somewhere. In this case, that company is Google, and its starting point was this hideous contraption that later became known as Google Cardboard. This is the very first Google Cardboard prototype. 10 million followed. pic.twitter.com/8YayRtYx8s — Clay Bavor (@claybavor) March 1, 2017 Ever been to a tech …",
 "url": "https://thenextweb.com/google/2017/03/02/feast-eyes-first-google-cardboard-prototype/",
 "urlToImage": "https://cdn2.tnwcdn.com/wp-content/blogs.dir/1/files/2017/03/google-cardboard-prototype.png",
 "publishedAt": "2017-03-02T22:45:15Z"
 }
 */
