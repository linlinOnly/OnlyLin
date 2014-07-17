//
//  HKRoundCornerView.h
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "HKOrderModel.h"

@interface HKRoundCornerView : UIView

@property (nonatomic,strong) UILabel *titleLabel;


-(id)initWithFrame:(CGRect)frame cornerRadius:(int)cornerRadius;
-(id)initWithFrame:(CGRect)frame title:(NSString *)title;
-(id)initWithFrame:(CGRect)frame title:(NSString *)title viewtype:(int)type;
-(id)initWithFrame:(CGRect)frame title:(NSString *)title titleimagename:(NSString*)imagename;
@end
