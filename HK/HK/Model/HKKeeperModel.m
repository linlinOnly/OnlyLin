//
//  HKKeeperModel.m
//  HK
//
//  Created by 马涛 on 14-4-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKKeeperModel.h"

@implementation HKKeeperModel

-(id)init
{
    self = [super init];
    if (self) {
        //
        _photoUrl = [[NSString alloc] init];
        _name = [[NSString alloc] init];
        _serverStatus = [[NSString alloc] init];
        _orderTime = [[NSString alloc] init];
        _serverTime = [[NSString alloc] init];
        _tel = [[NSString alloc] init];
        _sureTime = [[NSString alloc] init];
        
    }
    
    return self;
}

-(id)initWithPhoto:(NSString *)url name:(NSString *)name serverStatus:(NSString *)serverStatus orderTime:(NSString *)orderTime serverTime:(NSString *)serverTime tel:(NSString *)tel sureTime:(NSString *)sureTime
{
    self = [super init];
    if (self) {
        //
        _photoUrl = [[NSString alloc] init];
        _name = [[NSString alloc] init];
        _serverStatus = [[NSString alloc] init];
        _orderTime = [[NSString alloc] init];
        _serverTime = [[NSString alloc] init];
        _tel = [[NSString alloc] init];
        _sureTime = [[NSString alloc] init];
        
        
        _photoUrl =url;
        _name = name;
        _serverStatus = serverStatus;
        _orderTime = orderTime;
        _serverTime = serverTime;
        _sureTime = sureTime;
        _tel = tel;
        
    }
    
    return self;
}

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //
        _photoUrl = [[NSString alloc] init];
        _name = [[NSString alloc] init];
        _serverStatus = [[NSString alloc] init];
        _orderTime = [[NSString alloc] init];
        _serverTime = [[NSString alloc] init];
        _tel = [[NSString alloc] init];
        _sureTime = [[NSString alloc] init];
    }
    
    return self;
}

@end
