//
//  HKKeeperInfoView.h
//  HK
//
//  Created by 马涛 on 14-4-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "HKKeeperModel.h"
#import "UIImageView+WebCache.h"
#import "FrontHelper.h"

@interface HKKeeperInfoView : UIView

//@property (nonatomic,strong) HKKeeperModel *keeperInfo;

@property (nonatomic,strong) UIImageView *photoView;
@property (nonatomic,strong) UILabel *nameTitleLabel;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *orderStatusLabel;
@property (nonatomic,strong) UILabel *dieTimeLabel;
@property (nonatomic,strong) UILabel *orderTitleTimeLabel;
@property (nonatomic,strong) UILabel *orderTimeLabel;
@property (nonatomic,strong) UILabel *serverTitleTimeLabel;
@property (nonatomic,strong) UILabel *serverTimeLabel;
@property (nonatomic,strong) UIButton *telBtn;

@property (nonatomic,strong) NSString *tel;

-(id)initWithFrame:(CGRect)frame KeeperInfo:(HKKeeperModel *)keeper;
-(void)setItemsValues:(HKKeeperModel *)ki;

@end
