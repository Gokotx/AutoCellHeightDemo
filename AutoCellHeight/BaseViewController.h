//
//  BaseViewController.h
//  AutoCellHeight
//
//  Created by Goko on 10/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, weak) UITableView * tableView;
@property(nonatomic, strong) NSMutableArray<BaseCellModel*> * modelArray;

@end
