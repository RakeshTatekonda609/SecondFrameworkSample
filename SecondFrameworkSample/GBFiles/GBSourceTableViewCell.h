//
//  GBSourceTableViewCell.h
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBSourceObjectModel.h"

@interface GBSourceTableViewCell : UITableViewCell

-(void)configureCellWithData:(GBSourceObjectModel *)sourceObjectModel;

@end
