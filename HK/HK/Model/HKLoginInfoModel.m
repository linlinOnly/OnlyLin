//
//  HKLoginInfoModel.m
//  HK
//
//  Created by 马涛 on 14-5-3.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKLoginInfoModel.h"

@implementation HKLoginInfoModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        _userId = [[dic objectForKey:@"result"] objectForKey:@"uid"];
        _mobile = [[dic objectForKey:@"result"] objectForKey:@"mobile"];
    }
    return self;
}

@end
