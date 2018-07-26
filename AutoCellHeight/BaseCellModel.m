//
//  BaseCellModel.m
//  AutoCellHeight
//
//  Created by Goko on 04/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "BaseCellModel.h"

@implementation BaseCellModel

-(Class)bindingCellClass{
    NSAssert(NO, @"Subclass must override this method ! please check 'self' class to figure it out.");
    return [BaseTableViewCell class];
}
-(NSString *)reuseIdentifier{
    return NSStringFromClass([self bindingCellClass]);
}
-(CGFloat)rowHeight{
    return 0;
}

@end
