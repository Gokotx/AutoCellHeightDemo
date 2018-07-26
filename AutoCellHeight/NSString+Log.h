//
//  NSString+Log.h
//  AutoCellHeight
//
//  Created by Goko on 07/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#ifdef DEBUG
    #define LOG_ENABLE 1
#else
    #define LOG_ENABLE 0
#endif




@interface NSString (Log)


__attribute__((overloadable)) void Log(CGFloat value);
__attribute__((overloadable)) void Log(CGRect value);
/**
 #warning 必须所有的参数都是对象类型
 *输出结果在一行中
 */
__attribute__((overloadable)) void Log(id firstParam, ...) NS_REQUIRES_NIL_TERMINATION;

/**
 #warning 必须所有的参数都是对象类型
 *输出结果根据参数换行
 */
__attribute__((overloadable)) void Log_N(id firstParam, ...) NS_REQUIRES_NIL_TERMINATION;


__attribute__((overloadable)) NSString * String(CGFloat value);
__attribute__((overloadable)) NSString * String(CGRect value);
/**
 #warning 必须所有的参数都是对象类型
 */
__attribute__((overloadable)) NSString * String(id firstParam, ...) NS_REQUIRES_NIL_TERMINATION;

@end
