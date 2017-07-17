//
//  GBArticleResponseObject.h
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBArticleResponseObject : NSObject

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *sortBy;
@property (nonatomic, strong) NSArray *articles;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


