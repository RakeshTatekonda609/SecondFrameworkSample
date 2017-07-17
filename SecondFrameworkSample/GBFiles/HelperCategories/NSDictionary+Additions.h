//
//  NSDictionary+Additions.h
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)

-(BOOL)isValidDictionary;
-(id)valueFromDictionaryWithNSNullCheck:(NSString *)key;

@end
