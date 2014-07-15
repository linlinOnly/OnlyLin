//
//  HKOrderInfoRoundCornerView.h
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerView.h"
#import "FrontHelper.h"
#import "HKOrderDetailInfoModel.h"

@interface HKOrderInfoRoundCornerView : HKRoundCornerView


@property (nonatomic,strong) UILabel *statusTitleLabel;
@property (nonatomic,strong) UILabel *statusLabel;
@property (nonatomic,strong) UILabel *orderNumTitle;
@property (nonatomic,strong) UILabel *orderNum;
@property (nonatomic,strong) UILabel *orderTimeTitle;
@property (nonatomic,strong) UILabel *orderTime;
@property (nonatomic,strong) UILabel *typeTitleLabel;
@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UILabel *serverTimeTitle;
@property (nonatomic,strong) UILabel *serverTime;
@property (nonatomic,strong) UILabel *serverContentTitle;
@property (nonatomic,strong) UILabel *serverContent;




- (id)initWithFrame:(CGRect)frame title:(NSString *)title andData:(HKOrderDetailInfoModel *)dic;

@end
