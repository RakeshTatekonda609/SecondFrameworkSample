//
//  GBArticleResponseObject.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import "GBArticleResponseObject.h"
#import "GBArticleObjectModel.h"

#import "NSDictionary+Additions.h"

@implementation GBArticleResponseObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        if ([dictionary isValidDictionary]) {
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"articles"] && [[dictionary valueFromDictionaryWithNSNullCheck:@"articles"] isKindOfClass:[NSArray class]]) {
                NSMutableArray *articlesMutableArray = [[NSMutableArray alloc] init];
                for (NSDictionary *articleDict in [dictionary valueFromDictionaryWithNSNullCheck:@"articles"]) {
                    GBArticleObjectModel *articleDictModel = [[GBArticleObjectModel alloc] initWithDictionary:articleDict];
                    [articlesMutableArray addObject:articleDictModel];
                }
                self.articles = articlesMutableArray;
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"status"]) {
                self.status = [dictionary valueFromDictionaryWithNSNullCheck:@"status"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"source"]) {
                self.source = [dictionary valueFromDictionaryWithNSNullCheck:@"source"];
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"sortBy"]) {
                self.source = [dictionary valueFromDictionaryWithNSNullCheck:@"sortBy"];
            }
            
        }
    }
    return self;
}

@end

