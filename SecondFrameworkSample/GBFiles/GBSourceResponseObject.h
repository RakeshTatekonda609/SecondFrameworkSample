//
//  GBSourceResponseObject.h
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBSourceResponseObject : NSObject

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSArray *sources;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
