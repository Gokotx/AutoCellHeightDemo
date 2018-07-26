//
//  BaseTableViewCell.h
//  AutoCellHeight
//
//  Created by Goko on 04/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCellModel.h"


@protocol BaseTableViewCellDelegate <NSObject>

@required
-(void)configUI;


@end

@interface BaseTableViewCell : UITableViewCell

-(void)fillCellWithModel:(BaseCellModel *)model;

@end
