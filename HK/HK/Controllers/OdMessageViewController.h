//
//  OdMessageViewController.h
//  HK
//
//  Created by panyulin－cyou on 14-7-17.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKCommentModel.h"

#import "HKLogModel.h"
#import "OrderData.h"
@interface OdMessageViewController : UIViewController<HKCommentModelDelegate,UITextViewDelegate>
@property (nonatomic,strong) UIScrollView *bottomScorllView;
@property (nonatomic,strong) HKCommentModel *model;
@property (nonatomic,strong) OrderData * data;
@end
