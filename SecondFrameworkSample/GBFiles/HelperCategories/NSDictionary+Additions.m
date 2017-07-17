//
//  NSDictionary+Additions.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

-(BOOL)isValidDictionary
{
    if (self && [self isKindOfClass:[NSDictionary class]])
        return YES;
    return NO;
}

-(id)valueFromDictionaryWithNSNullCheck:(NSString *)key {
    NSObject* value = nil;
    if([self isValidDictionary])
    {
        value = [self valueForKey:key];
        if([value isKindOfClass:[NSNull class]]) {
            value = nil;
        }
    }
    return value;
}

@end
