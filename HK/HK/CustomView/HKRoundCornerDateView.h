//
//  HKRoundCornerDateView.h
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerView.h"
#import "HKDateActionSheet.h"
#import "FrontHelper.h"

@interface HKRoundCornerDateView : HKRoundCornerView<HKDateActionSheetDelegate>

@property (nonatomic,strong) HKDateActionSheet *actionSheet;
@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) NSString *date;

@end
