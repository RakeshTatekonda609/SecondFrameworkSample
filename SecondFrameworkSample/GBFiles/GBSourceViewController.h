//
//  ViewController.h
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBBaseViewController.h"

@interface GBSourceViewController : GBBaseViewController

+ (void)showSignInVCAsModalToVC:(UIViewController *)viewController animate:(BOOL)animated andFromBuyFlow:(BOOL)fromBuyFlow;

@end

