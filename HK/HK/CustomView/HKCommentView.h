//
//  HKCommentView.h
//  HK
//
//  Created by 马涛 on 14-5-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKCommentModel.h"

#import "HKOrderDetailInfoModel.h"
#import "SVProgressHUD.h"

@interface HKCommentView : UIView<HKCommentModelDelegate,UITextViewDelegate>

@property (nonatomic,strong) UISegmentedControl *segBtn;
@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) UITextView *tv;
@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UILabel *commentFlag;

@property (nonatomic,strong) UILabel *placeHolder;

@property (nonatomic,strong) HKCommentModel *model;

-(id)initWithFrame:(CGRect)frame andDic:(HKOrderDetailInfoModel *)im;

@end
