//
//  GBSourceResponseObject.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import "GBSourceResponseObject.h"
#import "NSDictionary+Additions.h"
#import "GBSourceObjectModel.h"

@implementation GBSourceResponseObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        if ([dictionary isValidDictionary]) {
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"sources"] && [[dictionary valueFromDictionaryWithNSNullCheck:@"sources"] isKindOfClass:[NSArray class]]) {
                NSMutableArray *sourcesMutableArray = [[NSMutableArray alloc] init];
                for (NSDictionary *sourceDict in [dictionary valueFromDictionaryWithNSNullCheck:@"sources"]) {
                    GBSourceObjectModel *sourceDictModel = [[GBSourceObjectModel alloc] initWithDictionary:sourceDict];
                    [sourcesMutableArray addObject:sourceDictModel];
                }
                self.sources = sourcesMutableArray;
            }
            if ([dictionary valueFromDictionaryWithNSNullCheck:@"status"]) {
                self.status = [dictionary valueFromDictionaryWithNSNullCheck:@"status"];
            }
        }
    }
    return self;
}

@end
