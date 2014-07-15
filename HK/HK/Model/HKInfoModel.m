//
//  HKInfoModel.m
//  HK
//
//  Created by 马涛 on 14-5-3.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKInfoModel.h"

@implementation HKInfoModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //
        
        _status = [[dic objectForKey:@"code"] intValue];
        
    }
    return self;
}

@end
