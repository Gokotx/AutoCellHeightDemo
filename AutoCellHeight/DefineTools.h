
//
//  DefineTools.h
//  RouterTest
//
//  Created by Goko on 28/07/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#ifndef DefineTools_h
#define DefineTools_h


#define TotalParams_id(firstParam) ({\
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

#define TotalParams_float(firstParam) ({\
    NSMutableArray * paramArray = [[NSMutableArray alloc]init];\
    va_list argList;\
    if (firstParam) {\
        [paramArray addObject:firstParam];\
        va_start(argList, firstParam);\
        float tempObject;\
        while ((tempObject = va_arg(argList, float))) {\
            [paramArray addObject:@(tempObject)];\
        }\
        va_end(argList);\
    }\
    paramArray;\
})

#define randomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]

#endif /* DefineTools_h */
