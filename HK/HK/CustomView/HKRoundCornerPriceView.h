//
//  HKRoundCornerPriceView.h
//  HK
//
//  Created by 马涛 on 14-5-3.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "HKRoundCornerView.h"
#import "HKOrderDetailInfoModel.h"


#import "SVProgressHUD.h"


#import "PartnerConfig.h"
#import "DataSigner.h"
#import "AlixPayResult.h"
#import "DataVerifier.h"
#import "AlixPayOrder.h"
#import "AlixLibService.h"


#import "HKLogModel.h"

@interface HKRoundCornerPriceView : HKRoundCornerView<HKLogModelDelegate>


@property (nonatomic,strong) NSString *priceStr;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) HKOrderDetailInfoModel *model;

@property (nonatomic,strong) HKLogModel *log;


//@property (nonatomic,assign) SEL result;

//-(void)paymentResult:(NSString *)result;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title andData:(HKOrderDetailInfoModel *)dic;



@end
