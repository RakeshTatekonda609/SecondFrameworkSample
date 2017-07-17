//
//  GBUtility.m
//  SecondFrameworkSample
//
//  Created by Nowfloats on 17/07/17.
//  Copyright © 2017 NowFloats. All rights reserved.
//

#import "GBUtility.h"

@implementation GBUtility

+(NSBundle *)getBundleForFramework{
    NSBundle* frameworkBundle = [NSBundle bundleForClass:[self class]];
    NSURL *bundleUrl = [frameworkBundle URLForResource:@"SecondFrameworkSample" withExtension:@"bundle"];
    return [NSBundle bundleWithURL:bundleUrl];
}

@end
