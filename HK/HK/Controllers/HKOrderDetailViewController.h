//
//  HKOrderDetailViewController.h
//  HK
//
//  Created by 马涛 on 14-5-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKRoundCornerPriceView.h"
#import "HKCommentView.h"
@interface HKOrderDetailViewController : UIViewController

@property (nonatomic,strong) HKRoundCornerPriceView *priceView;
@property (nonatomic,strong) HKCommentView *commentView;

@property (nonatomic,strong) NSDictionary *dic;

-(id)initWithDic:(NSDictionary *)dic;

@end
