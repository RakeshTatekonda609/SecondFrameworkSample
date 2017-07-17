//
//  GBArticleTableViewCell.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import "GBArticleTableViewCell.h"
#import "NSString+Additions.h"

@interface GBArticleTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *articleImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishedByLabel;

@end

@implementation GBArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellWithData:(GBArticleObjectModel *)articleObjectModel{
    if ([articleObjectModel.title isValidString]) {
        self.titleLabel.text = articleObjectModel.title;
    }
    if ([articleObjectModel.articleDescription isValidString]) {
        self.descriptionLabel.text = articleObjectModel.articleDescription;
    }
    if ([articleObjectModel.publishedAt isValidString]) {
        self.publishedByLabel.text = [NSString stringWithFormat:@"At : %@",articleObjectModel.publishedAt];
    }
}

@end
