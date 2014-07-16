//
//  PayViewController.h
//  HK
//
//  Created by panyulin－cyou on 14-7-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PartnerConfig.h"
#import "DataSigner.h"
#import "AlixPayResult.h"
#import "DataVerifier.h"
#import "AlixPayOrder.h"
#import "AlixLibService.h"


#import "HKLogModel.h"

@interface PayViewController : UIViewController<HKLogModelDelegate>
//@property (nonatomic,strong) HKOrderDetailInfoModel *model;

@property (nonatomic,strong) HKLogModel *log;
@property (nonatomic,strong) NSMutableDictionary * dicdata;

@end
