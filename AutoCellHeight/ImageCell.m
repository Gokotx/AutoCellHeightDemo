//
//  ImageCell.m
//  AutoCellHeight
//
//  Created by Goko on 04/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import <UIImageView+WebCache.h>
#import <Masonry.h>
#import "ImageCell.h"
#import "ImageCellModel.h"
#import <UITableView+FDTemplateLayoutCell.h>

@interface ImageCell ()<BaseTableViewCellDelegate>

@property(nonatomic,weak) UIImageView * cellImage;

@end

@implementation ImageCell 


-(void)configUI{
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:imageView];
    _cellImage = imageView;
    _cellImage.backgroundColor = [UIColor redColor];
}
-(void)layoutSubviews{
    [_cellImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.contentView);
    }];
}

-(void)fillCellWithModel:(BaseCellModel *)model{
    if ([model isKindOfClass:[ImageCellModel class]]) {        
        ImageCellModel * cellModel = (ImageCellModel *)model;
        [_cellImage sd_setImageWithURL:[NSURL URLWithString:cellModel.imagePath] placeholderImage:[UIImage imageNamed:@"大赛.png"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (cacheType == SDImageCacheTypeNone) {
                [model.tableView reloadRowsAtIndexPaths:@[model.indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
        }];
    }
}

//cell自动高度需要实现这个方法，如果用自动布局，必须contentview的上下左右都有被依赖。
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    CGSize imageSize = _cellImage.image.size;
    CGFloat tempHeight = UIScreen.mainScreen.bounds.size.width * imageSize.height/imageSize.width;
    //限定image的高度
//    NSLog(@"%f_%f_%f",self.contentView.bounds.size.width,tempHeight,[self.cellImage sizeThatFits:size].height);
    totalHeight += [self.cellImage sizeThatFits:size].height>tempHeight?tempHeight:[self.cellImage sizeThatFits:size].height;
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
