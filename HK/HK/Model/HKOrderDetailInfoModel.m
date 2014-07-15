//
//  HKOrderDetailInfoModel.m
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKOrderDetailInfoModel.h"

@implementation HKOrderDetailInfoModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        //
        
        NSLog(@"dic %@",dic);
        
        _c_time = [[NSString alloc] init];
        _comment = [[NSString alloc] init];
        _evaluation = [[NSString alloc] init];
        
        _isComment = 0;
        
        _employeeName = [[NSString alloc] init];
        _employeeMobile = [[NSString alloc] init];
        
        _address = [[NSString alloc] init];
        _contacts = [[NSString alloc] init];
        _create_time = [[NSString alloc] init];
        _date = [[NSString alloc] init];
        _work_times = [[NSString alloc] init];
        _serverDate = [[NSString alloc] init];
        
        _duration = [[NSString alloc] init];
        _mobile = [[NSString alloc] init];
        _order_id = [[NSString alloc] init];
        _order_sn = [[NSString alloc] init];
        _order_type = [[NSString alloc] init];
        _product_id = [[NSString alloc] init];
        _remarks = [[NSString alloc] init];
        _service_type = [[NSString alloc] init];
//        _sex
        _source = [[NSString alloc] init];
        _uid = [[NSString alloc] init];
        
        
               
        
        if ([[[dic objectForKey:@"OrderComment"] objectForKey:@"c_time"] isEqual:[NSNull null]]) {
            _c_time = @"未知";
        }
        else
        {
            _c_time = [[dic objectForKey:@"OrderComment"] objectForKey:@"c_time"];
            _isComment = 1;
        }
        
        if ([[[dic objectForKey:@"OrderComment"] objectForKey:@"comment"] isEqual:[NSNull null]]) {
            _comment = @"未知";
        }
        else
        {
            _comment = [[dic objectForKey:@"OrderComment"] objectForKey:@"comment"];
//            _isComment = 1;
        }
        
        if ([[[dic objectForKey:@"OrderComment"] objectForKey:@"evaluation"] isEqual:[NSNull null]]) {
            _evaluation = @"未知";
        }
        else
        {
            _evaluation = [[dic objectForKey:@"OrderComment"] objectForKey:@"evaluation"];
            
        }
        
    
        if ([[[[dic objectForKey:@"result"] objectForKey:@"AllotEmployee"] objectForKey:@"username"] isEqual:[NSNull null]]) {
            _employeeName = @"未知";
        }
        else
        {
            _employeeName = [[[dic objectForKey:@"result"] objectForKey:@"AllotEmployee"] objectForKey:@"username"];
            
        }
        
        if ([[[[dic objectForKey:@"result"] objectForKey:@"AllotEmployee"] objectForKey:@"mobile"] isEqual:[NSNull null]]) {
            _mobile = @"未知";
        }
        else
        {
            _mobile = [[[dic objectForKey:@"result"] objectForKey:@"AllotEmployee"] objectForKey:@"mobile"];
            
        }
        
        
        _address = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"address"];
        _contacts = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"contacts"];
        _create_time = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"create_time"];
        _date  = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"date"];
        
        
        if ([[[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"date"] isEqual:[NSNull null]]) {
            _date = @"未知";
        }
        else
        {
            _date = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"date"];
            
        }
        
        
        _work_times = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"work_times"];
        
        
        
        
        
        

        _duration = [[[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"duration"] isEqual:[NSNull null]]?@"4":[[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"duration"];
        _mobile = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"mobile"];
        _order_id = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"order_id"];
        _order_sn = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"order_sn"];
        _order_status  = [[[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"order_status"] intValue];
        _pay_status  = [[[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"pay_status"] intValue];
        _remarks = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"remarks"];
        _sex = [[[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"sex"] intValue];
        _source = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"source"];
        _uid = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"uid"];
        
        
        if ([[[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"order_type"] isEqual:[NSNull null]]) {
            _order_type = @"未知";
        }
        else
        {
            _order_type = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"order_type"];

        }
        
        if ([_order_type isEqualToString:@"1"]) {
            _serverDate = @"即时订单";
        }
        else
        {
            _serverDate = [_date stringByAppendingFormat:@" %@",_work_times];
        }
        
        
        
        
        if ([[[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"product_id"] isEqual:[NSNull null]]) {
            _product_id = @"未知";
        }
        else
        {
            _product_id = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"product_id"];
            
        }
        if ([[[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"service_type"] isEqual:[NSNull null]]) {
            _service_type = @"未知";
        }
        else
        {
            _service_type = [[[dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"service_type"];
        }
    }
    return self;
}


-(void)orderPayVer
{
    
}

@end
