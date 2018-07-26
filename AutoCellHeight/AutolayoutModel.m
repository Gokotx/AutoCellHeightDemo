//
//  AutolayoutModel.m
//  AutoCellHeight
//
//  Created by Goko on 09/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "AutolayoutModel.h"
#import "AutolayoutCell.h"

@implementation AutolayoutModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"layouts":AutolayoutModel.class};
}

-(Class)bindingCellClass{
    return [AutolayoutCell class];
}
-(NSString *)reuseIdentifier{
    if (self.type) {
        return [@(self.type) stringValue];
    }
    return [super reuseIdentifier];
}

-(CGFloat)rowHeight{
    return self.height*[UIScreen mainScreen].bounds.size.width/320;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@++layouts:%@++action:%@",self.class,self.layouts,self.action];
}

@end
