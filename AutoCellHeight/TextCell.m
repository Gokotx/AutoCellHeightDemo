//
//  TextCell.m
//  AutoCellHeight
//
//  Created by Goko on 04/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "TextCell.h"
#import "TextCellModel.h"

@interface TextCell ()<BaseTableViewCellDelegate>

@property(nonatomic, weak)UILabel * label;
@property(nonatomic, weak)UIImageView * cellImage;

@end

@implementation TextCell

-(void)configUI{
    UILabel * label = [UILabel new];
    label.textColor = UIColor.whiteColor;
    label.numberOfLines = 0;
    [self.contentView addSubview:label];
    _label = label;
    
    UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"111.jpg"]];
    [self.contentView addSubview:imageView];
    _cellImage = imageView;
}
-(void)layoutSubviews{
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.cellImage.mas_top);
    }];
    [_cellImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom);
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_lessThanOrEqualTo(200);
    }];
    [super layoutSubviews];
}


-(void)fillCellWithModel:(BaseCellModel *)model{
    if ([model isKindOfClass:[TextCellModel class]]) {
        TextCellModel * cellModel = (TextCellModel *)model;
        _label.text = cellModel.title;
    }
}
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.label sizeThatFits:size].height;
    totalHeight += [self.cellImage sizeThatFits:size].height>200?200:[self.cellImage sizeThatFits:size].height;
    totalHeight += 10; // margins
    return CGSizeMake(size.width, totalHeight);
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
