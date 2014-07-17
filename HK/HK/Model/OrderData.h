//
//  OrderData.h
//  HK
//
//  Created by QiMengJin on 14-7-17.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OrderData : NSObject
@property(nonatomic, copy) NSString * address;
@property(nonatomic, copy) NSString * create_time;
@property(nonatomic, copy) NSString * order_id;
@property(nonatomic, copy) NSString * order_sn;
@property(nonatomic, copy) NSString * order_type;
@property(nonatomic, copy) NSString * pay_status;
@property(nonatomic, copy) NSString * service_type;
@property(nonatomic, copy) NSString * total_fee;
@property(nonatomic, copy) NSString * order_status;
@property(nonatomic, copy) NSString * mobile;

+ (id )itemFormDic:(NSDictionary *)dic;

@end
