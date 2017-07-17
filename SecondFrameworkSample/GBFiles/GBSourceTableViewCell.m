//
//  GBSourceTableViewCell.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import "GBSourceTableViewCell.h"
#import "NSString+Additions.h"

@interface GBSourceTableViewCell (
                                  )
@property (weak, nonatomic) IBOutlet UIImageView *sourceImageView;
@property (weak, nonatomic) IBOutlet UILabel *sourceTitle;
@property (weak, nonatomic) IBOutlet UILabel *sourceDescription;


@end


@implementation GBSourceTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithData:(GBSourceObjectModel *)sourceObjectModel{
    self.sourceTitle.text = sourceObjectModel.sourceName;
    self.sourceDescription.text = sourceObjectModel.sourceDescription;
}


@end
