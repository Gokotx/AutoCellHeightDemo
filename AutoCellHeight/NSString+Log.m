//
//  NSString+Log.m
//  AutoCellHeight
//
//  Created by Goko on 07/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "NSString+Log.h"

#define TotalParams(firstParam) ({\
    NSMutableArray * paramArray = [[NSMutableArray alloc]init];\
    va_list argList;\
    if (firstParam) {\
        [paramArray addObject:firstParam];\
        va_start(argList, firstParam);\
        id tempObject;\
        while ((tempObject = va_arg(argList, id))) {\
            [paramArray addObject:tempObject];\
        }\
    va_end(argList);\
    }\
    paramArray;\
})

@implementation NSString (Log)

#pragma mark - Log Method
__attribute__((overloadable)) void Log(CGFloat value){
#if LOG_ENABLE
    NSLog(@"%@",String(value));
#endif
}
__attribute__((overloadable)) void Log(CGRect value){
#if LOG_ENABLE
    NSLog(@"%@",String(value));
#endif
}

__attribute__((overloadable)) void Log(id firstParam, ...){
#if LOG_ENABLE
    NSArray * params = TotalParams(firstParam);
    
    NSMutableString * logString = [NSMutableString string];
    [params enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [logString appendString:[obj description]];
    }];
    NSLog(@"%@",logString);
#endif
}

__attribute__((overloadable)) void Log_N(id firstParam, ...){
#if LOG_ENABLE
    NSArray * params = TotalParams(firstParam);
    [params enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@",[obj description]);
    }];
#endif
}


#pragma mark - String Method

__attribute__((overloadable)) NSString * String(CGFloat value) {
    NSString * string = @"";
    if (isIntValue(value)) {
        string = [@(value) stringValue];
    }else{
        string = [NSString stringWithFormat:@"%f",value];
    }
    return string;
}
__attribute__((overloadable)) NSString * String(CGRect value) {
    return NSStringFromCGRect(value);
}
__attribute__((overloadable)) NSString * String(id firstParam, ...){
    NSArray * params = TotalParams(firstParam);
    NSMutableString * finalStr = [NSMutableString string];
    [params enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [finalStr appendString:[obj description]];
    }];
    return finalStr;
}

static inline BOOL isIntValue(CGFloat value){
    NSNumber * numberValue = @(value);
    NSString * stringValue = [numberValue stringValue];
    NSScanner * scanner = [NSScanner scannerWithString:stringValue];
    int intValue;
    return [scanner scanInt:&intValue]&&[scanner isAtEnd];
}

@end
