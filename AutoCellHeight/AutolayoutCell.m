//
//  AutolayoutCell.m
//  AutoCellHeight
//
//  Created by Goko on 09/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "AutolayoutCell.h"
#import "AutolayoutModel.h"
#import <UIImageView+WebCache.h>
#import <SafariServices/SafariServices.h>


@interface AutolayoutCell ()<BaseTableViewCellDelegate>

@end

@implementation AutolayoutCell

-(void)configUI{
    
}

-(void)fillCellWithModel:(BaseCellModel *)model{
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView * container = [UIView new];
    if ([model isKindOfClass:[AutolayoutModel class]]) {
        AutolayoutModel * cellModel = (AutolayoutModel*)model;
        container = [self p_autoLayoutWithModel:cellModel];
    }
    container.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, model.rowHeight);
    [self.contentView addSubview:container];
}
-(UIView *)p_autoLayoutWithModel:(AutolayoutModel *)model{
    UIView * view = nil;
    if (model.layouts.count<=0) {
        if ([model.source hasPrefix:@"http://"]) {
            UIImageView * imageView = [UIImageView new];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.source] placeholderImage:[UIImage imageNamed:@"大赛.png"]];
            view = imageView;
        }else{
            UILabel * label = [UILabel new];
            label.textColor = [UIColor whiteColor];
            label.numberOfLines = 0;
            label.text = model.source;
            label.textAlignment = NSTextAlignmentCenter;
            view = label;
        }
        [view addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            if (model.action.length>0) {
                //解析跳转url，待替换
                NSString * url = [model.action substringFromIndex:@"mbyd://openurl?".length];
                SFSafariViewController * webView = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:url]];
                [[RootNavigation shareRootNavigation] presentViewController:webView animated:YES completion:nil];
            }else{
                Log(model.action, nil);
            }
        }];
    }else{
        UIStackView * superView = [self p_createStackView:model];
        [model.layouts enumerateObjectsUsingBlock:^(AutolayoutModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [superView addArrangedSubview:[self p_autoLayoutWithModel:obj]];
        }];
        view = superView;
    }
    view.backgroundColor = randomColor;
    return view;
}

-(UIStackView *)p_createStackView:(AutolayoutModel *)model{
    UIStackView * stackView = [[UIStackView alloc] init];
    stackView.axis = model?model.axis:UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = model?model.spacing:0;
    return stackView;
}
-(void)p_addTapGes:(UIView *)view complete:(void(^)(void))callback{
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(p_viewTapped:)]];
}
-(void)p_viewTapped:(UITapGestureRecognizer *)ges{
    NSLog(@"%@",ges.view);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
