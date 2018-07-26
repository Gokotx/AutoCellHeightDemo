//
//  BaseCellModel.h
//  AutoCellHeight
//
//  Created by Goko on 04/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BaseCellModel : NSObject

@property(nonatomic, strong, readonly) Class bindingCellClass;
@property(nonatomic, strong, readonly) NSString * reuseIdentifier;
@property(nonatomic, assign, readonly) CGFloat rowHeight;


@property(nonatomic, strong) NSIndexPath * indexPath;
@property(nonatomic, strong) UITableView * tableView;

@end
