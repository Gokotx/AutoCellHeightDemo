//
//  BaseTableViewCell.m
//  AutoCellHeight
//
//  Created by Goko on 04/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if ([self conformsToProtocol:@protocol(BaseTableViewCellDelegate)]&&[self respondsToSelector:@selector(configUI)]) {
            [self performSelector:@selector(configUI)];
        }
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.contentView.backgroundColor = randomColor;
    }
    return self;
}
-(void)fillCellWithModel:(BaseCellModel *)model{
    NSAssert(NO, @"Subclass must override this method ! please check 'self' class to figure it out.");
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
