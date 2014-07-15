//
//  HKOrderItemModel.m
//  HK
//
//  Created by 马涛 on 14-5-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKOrderItemModel.h"

@implementation HKOrderItemModel

-(id)init
{
    self = [super init];
    if (self) {
        
        _address = [[NSString alloc] init];
        _allot = [[NSDictionary alloc] init];
        _serverMobile = [[NSString alloc] init];
        _serverName = [[NSString alloc] init];
        
        _contacts = [[NSString alloc] init];
        _create_time = [[NSString alloc] init];
        _date = [[NSString alloc] init];
        _duration = [[NSString alloc] init];
        _mobile = [[NSString alloc] init];
        _order_id = [[NSString alloc] init];
        _order_sn = [[NSString alloc] init];
        
        _order_type = [[NSString alloc] init];
        _product_id = [[NSString alloc] init];
        _remarks = [[NSString alloc] init];
        _service_type = [[NSString alloc] init];
        _sex = [[NSString alloc] init];
        _tool = [[NSDictionary alloc] init];
        _c_time = [[NSString alloc] init];
        _comment = [[NSString alloc] init];
        _evaluation = [[NSString alloc] init];
        
        
        _uid = [[NSString alloc] init];
        _work_times = [[NSString alloc] init];
    }
    return self;
}


-(id)initWithDic:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        //
        [self fillItembyDic:dic];
    }
    return self;
}

-(void)fillItembyDic:(NSDictionary *)dic
{
    
//    NSLog(@"orderList %@",dic);
    
    
    _address = [dic objectForKey:@"address"];
    _allot = [dic objectForKey:@"allot"];
    _serverName = [_allot objectForKey:@"username"];
    _serverMobile = [_allot objectForKey:@"mobile"];
    _contacts = [dic objectForKey:@"contacts"];
    _create_time = [dic objectForKey:@"create_time"];
    _date = [dic objectForKey:@"date"];
    _duration = [dic objectForKey:@"duration"];
    _mobile  = [dic objectForKey:@"mobile"];
    _order_id = [dic objectForKey:@"order_id"];
    _order_sn = [dic objectForKey:@"order_sn"];
    _order_type = [dic objectForKey:@"order_type"];
    _product_id = [dic objectForKey:@"product_id"];
    _remarks = [dic objectForKey:@"remarks"];
    _service_type = [dic objectForKey:@"service_type"];
    _sex = [dic objectForKey:@"sex"];
    //    _source = [[dic objectForKey:@"source"] intValue];
    _tool = [dic objectForKey:@"tool"];
    _c_time = [_tool objectForKey:@"c_time"];
    _comment = [_tool objectForKey:@"comment"];
    _evaluation = [_tool objectForKey:@"evaluation"];
    
    _uid = [dic objectForKey:@"uid"];
//    _work_times = [dic objectForKey:@"work_times"];
    
    
    if ([[dic objectForKey:@"date"] isEqual:[NSNull null]]) {
        //
        _date = @"未知";
    }
    else
    {
        _date = [dic objectForKey:@"date"];
    }
    
    if ([[dic objectForKey:@"work_times"] isEqualToString:@""]) {
        //
        _work_times = @"";
    }
    else
    {
        _work_times = [dic objectForKey:@"work_times"];
    }
        
    if ([[dic objectForKey:@"order_status"] isEqual:[NSNull null]]) {
        //
        _order_status = 0;
    }
    else
    {
        _order_status = [[dic objectForKey:@"order_status"] intValue];
    }
    
    
    _pay_status = [[dic objectForKey:@"pay_status"] intValue];
    
    
    if ([[dic objectForKey:@"source"] isEqual:[NSNull null]]) {
        //
        _source = 0;
    }
    else
    {
        _source = [[dic objectForKey:@"source"] intValue];
    }
    
    
    
    if([_serverName isEqual:[NSNull null]])
    {
        _serverName = @"未知";
    }
    if([_serverMobile isEqual:[NSNull null]])
    {
        _serverMobile = @"未知";
    }
    if([_order_type isEqual:[NSNull null]])
    {
        _order_type = @"未知";
    }
    if([_product_id isEqual:[NSNull null]])
    {
        _product_id = @"未知";
    }
    if([_service_type isEqual:[NSNull null]])
    {
        _service_type = @"未知";
    }
    if([_c_time isEqual:[NSNull null]])
    {
        _c_time = @"";
    }
    if([_comment isEqual:[NSNull null]])
    {
        _comment = @"未知";
    }
    if([_evaluation isEqual:[NSNull null]])
    {
        _evaluation = @"未知";
    }
}


@end
