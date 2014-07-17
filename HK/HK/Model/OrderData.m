//
//  OrderData.m
//  HK
//
//  Created by QiMengJin on 14-7-17.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OrderData.h"

@implementation OrderData

+ (id)itemFormDic:(NSDictionary *)dic{
 
    OrderData * order = [[OrderData alloc]init];
    
    order.address = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"0"] withNullKey:@"address"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSinceReferenceDate:(int)[[dic valueForKey:@"0"] objectForKey:@"create_time"]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    order.create_time = confromTimespStr;
    order.order_id = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"0"] withNullKey:@"order_id"];
    order.order_sn = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"0"] withNullKey:@"order_sn"];
    order.order_status = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"0"] withNullKey:@"order_status"];
    order.order_type = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"0"] withNullKey:@"order_type"];
    order.pay_status = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"0"] withNullKey:@"pay_status"];
    order.service_type = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"0"] withNullKey:@"service_type"];
    order.total_fee = [NSString stringWithFormat:@"￥%d",[[OrderData objectForDic:dic withNullKey:@"total_fee"] intValue]];
    order.mobile = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"0"] withNullKey:@"mobile"];
    
    
    return order;
}

+(id)objectForDic:(id)dic withNullKey:(id)key{
    
    if ([dic objectForKey:key]) {
        return [dic objectForKey:key];
    }else {
        return @"";
    }
}


@end
