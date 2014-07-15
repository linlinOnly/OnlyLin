//
//  HKEOInfoView.h
//  HK
//
//  Created by 马涛 on 14-5-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerView.h"

#import "HKOrderDetailInfoModel.h"

@interface HKEOInfoView : HKRoundCornerView


@property (nonatomic,strong) UILabel *name;
@property (nonatomic,strong) UILabel *nameTitle;
@property (nonatomic,strong) UILabel *tel;
@property (nonatomic,strong) UILabel *telTitle;
@property (nonatomic,strong) UITextView *address;
@property (nonatomic,strong) UILabel *addressTitle;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title andData:(HKOrderDetailInfoModel *)dic;

@end
