//
//  HKKeeperInfo2View.h
//  HK
//
//  Created by 马涛 on 14-5-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerView.h"
#import "UIImageView+WebCache.h"
#import "FrontHelper.h"
#import "HKOrderDetailInfoModel.h"
@interface HKKeeperInfo2View : HKRoundCornerView

@property (nonatomic,strong) UIImageView *photo;

@property (nonatomic,strong) UILabel *storeLabel;
@property (nonatomic,strong) UILabel *nameTitle;
@property (nonatomic,strong) UILabel *telTitle;
@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *tel;
@property (nonatomic,strong) UIButton *btn;


@property (nonatomic,strong) NSString *tempMobile;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title andData:(HKOrderDetailInfoModel *)dic;
@end
