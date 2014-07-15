//
//  HKOrderItemModel.h
//  HK
//
//  Created by 马涛 on 14-5-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKOrderItemModel : NSObject

@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSDictionary *allot;

@property (nonatomic,strong) NSString *serverName;
@property (nonatomic,strong) NSString *serverMobile;

@property (nonatomic,strong) NSString *contacts;

@property (nonatomic,strong) NSString *create_time;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *duration;
@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) NSString *order_id;
@property (nonatomic,strong) NSString *order_sn;
@property (nonatomic,assign) int order_status;
@property (nonatomic,assign) int pay_status;
@property (nonatomic,strong) NSString *order_type;
@property (nonatomic,strong) NSString *product_id;
@property (nonatomic,strong) NSString *remarks;
@property (nonatomic,strong) NSString *service_type;
@property (nonatomic,strong) NSString *sex;
@property (nonatomic,assign) int source;
@property (nonatomic,strong) NSDictionary *tool;
@property (nonatomic,strong) NSString *c_time;
@property (nonatomic,strong) NSString *comment;
@property (nonatomic,strong) NSString *evaluation;

@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *work_times;

-(id)initWithDic:(NSDictionary *)dic;
-(void)fillItembyDic:(NSDictionary *)dic;
@end
