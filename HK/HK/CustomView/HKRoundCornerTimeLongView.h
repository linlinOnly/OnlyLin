//
//  HKRoundCornerTimeLongView.h
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerView.h"

@interface HKRoundCornerTimeLongView : HKRoundCornerView

@property (nonatomic,strong) NSString *serverTimeLong;
@property (nonatomic,strong) UIButton *hour2;
@property (nonatomic,strong) UIButton *hour3;
@property (nonatomic,strong) UIButton *hour4;
@property (nonatomic,strong) UILabel *hourlabel;
@property (nonatomic,strong) UILabel *soverlabel;
@property (nonatomic,strong) UILabel *legendlabel;
@property (nonatomic,strong) UILabel *townpeopleLab;
@property (nonatomic,strong) UIImageView *imageview;
@property (nonatomic,strong) UIButton *townpeopleBtn;
@property (nonatomic,strong) UILabel *lastLab;
@property (nonatomic,strong) NSString * service_type;
-(void)setmyframe:(BOOL)isHour;
@end
