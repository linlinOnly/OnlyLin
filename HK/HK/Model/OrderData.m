//
//  OrderData.m
//  HK
//
//  Created by QiMengJin on 14-7-17.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OrderData.h"

@implementation OrderData

//order_status 0 未支付、 1是 已分配、  2是已确认、  3是开始打扫、  4是打扫完毕

+ (id )itemFormOrderSuccessDic:(NSDictionary *)dic
{
    NSArray * order_statuss=[[NSArray alloc]initWithObjects:@"未支付",@"已分配",@"已确认",@"开始打扫",@"打扫完毕", nil];
    OrderData * ordersuccess = [[OrderData alloc]init];
    ordersuccess.address = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"address"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSinceReferenceDate:(int)[[OrderData objectForDic:dic withNullKey:@"result"] objectForKey:@"create_time"]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    ordersuccess.create_time = confromTimespStr;
    
    NSString * pDate = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"date"];
    NSString * pWorkTime = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"work_times"];
    ordersuccess.reservetime=[NSString stringWithFormat:@"%@ %@",pDate?pDate:@"",pWorkTime?pWorkTime:@""];
    
    
    
    ordersuccess.order_id = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"order_id"];
    ordersuccess.order_sn = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"order_sn"];
    
    ordersuccess.order_status =[order_statuss objectAtIndex: [[OrderData objectForDic:dic withNullKey:@"order_status"] intValue]];
    
    ordersuccess.product_id=[NSString stringWithFormat:@"%@小时",[OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"product_id"]];
    
    ordersuccess.order_type = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"order_type"];
    ordersuccess.service_type = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"service_type"];
    
    
    ordersuccess.pay_status = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"pay_status"];
    ordersuccess.uid = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"uid"];
    ordersuccess.total_fee = [NSString stringWithFormat:@"￥%d",[[OrderData objectForDic:dic withNullKey:@"total_fee"] intValue]];
    ordersuccess.mobile = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"result"] withNullKey:@"mobile"];
    ordersuccess.balance=[OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"user"] withNullKey:@"balance"];
    return ordersuccess;
}
+ (id )itemFormOrderListDic:(NSDictionary *)dic
{
 
    OrderData * order = [[OrderData alloc]init];
    
    NSArray * order_statuss=[[NSArray alloc]initWithObjects:@"未支付",@"已分配",@"已确认",@"开始打扫",@"打扫完毕", nil];
    
    order.address = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"address"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:(int)[[dic valueForKey:@"order"] objectForKey:@"create_time"]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    order.create_time = confromTimespStr;
    
    NSString * pDate = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"date"];
    NSString * pWorkTime = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"work_times"];
    
    order.reservetime=[NSString stringWithFormat:@"%@ %@",pDate?pDate:@"",pWorkTime?pWorkTime:@""];
    
    order.order_id = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"order_id"];
    order.order_sn = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"order_sn"];
    order.order_status =[order_statuss objectAtIndex: [[OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"order_status"] intValue]];
    
    order.product_id=[NSString stringWithFormat:@"%@小时",[OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"product_id"]];
    
    order.order_type =[OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"order_type"];
    
    order.service_type = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"service_type"];
    order.pay_status = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"pay_status"];
    order.total_fee = [NSString stringWithFormat:@"￥%d",[[OrderData objectForDic:dic withNullKey:@"total_fee"] intValue]];
    order.mobile = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"mobile"];
    
    order.evaluation=[OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"comment"] withNullKey:@"evaluation"];
    order.uid = [OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"order"] withNullKey:@"uid"];
    order.e_time=[OrderData objectForDic:[OrderData objectForDic:dic withNullKey:@"comment"] withNullKey:@"e_time"];
    
    return order;
}

+(id)objectForDic:(id)dic withNullKey:(id)key{
    
    id object = [dic objectForKey:key];
    if(object == [NSNull null])
		return nil;
    
    return  object;
    
}


@end
