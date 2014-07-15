//
//  HKOrderDetailInfoModel.h
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "SVProgressHUD.h"


@interface HKOrderDetailInfoModel : NSObject

@property (nonatomic,strong) NSString *c_time;
@property (nonatomic,strong) NSString *comment;
@property (nonatomic,strong) NSString *evaluation;
@property (nonatomic,assign) int isComment;

@property (nonatomic,strong) NSString *employeeName;
@property (nonatomic,strong) NSString *employeeMobile;

@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *contacts;
@property (nonatomic,strong) NSString *create_time;

@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *work_times;
@property (nonatomic,strong) NSString *serverDate;

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
@property (nonatomic,assign) int sex;
@property (nonatomic,strong) NSString *source;
@property (nonatomic,strong) NSString *uid;


-(id)initWithDic:(NSDictionary *)dic;

@end
