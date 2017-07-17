//
//  NSString+Additions.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

- (BOOL)isValidString {
    if ([self isKindOfClass:[NSNull class]] || !self || [self length] <= 0 )
        return NO;
    return YES;
}

@end
