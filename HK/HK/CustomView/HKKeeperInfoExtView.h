//
//  HKKeeperInfoExtView.h
//  HK
//
//  Created by 马涛 on 14-4-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKKeeperInfoView.h"
#import "HKOrderItemModel.h"
#import <QuartzCore/QuartzCore.h>

@interface HKKeeperInfoExtView : HKKeeperInfoView

@property (nonatomic,strong) UIButton *againBtn;
@property (nonatomic,strong) UILabel *payBtn;
@property (nonatomic,strong) UILabel *feedBackBtn;


-(void)fillLayouts:(HKOrderItemModel *)model;

@end
