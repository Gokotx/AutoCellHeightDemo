//
//  AutolayoutModel.h
//  AutoCellHeight
//
//  Created by Goko on 09/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "BaseCellModel.h"

@class AutolayoutModel;
typedef NSString* HandleAction;
typedef NSArray<AutolayoutModel *>* Layouts;

@interface AutolayoutModel : BaseCellModel <YYModel>

@property(nonatomic, assign) NSInteger axis;
@property(nonatomic, assign) NSInteger type;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat spacing;
@property(nonatomic, assign) CGFloat margin;
@property(nonatomic, copy) NSString * source;
@property(nonatomic, copy) HandleAction action;
@property(nonatomic, copy) Layouts layouts;

@end
