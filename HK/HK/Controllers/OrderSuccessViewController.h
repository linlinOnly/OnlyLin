//
//  OrderSuccessViewController.h
//  HK
//
//  Created by QiMengJin on 14-7-15.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartnerConfig.h"
#import "DataSigner.h"
#import "AlixPayResult.h"
#import "DataVerifier.h"
#import "AlixPayOrder.h"
#import "AlixLibService.h"
#import "OrderData.h"

#import "HKLogModel.h"
#import "PayASI.h"
@interface OrderSuccessViewController : UIViewController<HKLogModelDelegate,PayASIDelegate>

@property (nonatomic, strong) OrderData * data;
@property (nonatomic,strong) UIScrollView *bottomScorllView;
@property (nonatomic,strong) HKLogModel *log;
//@property (nonatomic, copy) NSString * servertype;
//@property (nonatomic, copy) NSString * balancedate;
//@property (nonatomic, copy) NSString * orderId;
//@property (nonatomic, copy) NSString * address;
//@property (nonatomic, copy) NSString * name;
//@property (nonatomic, copy) NSString * telphone;

@end
