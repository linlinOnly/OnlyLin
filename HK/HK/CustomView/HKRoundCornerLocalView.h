//
//  HKRoundCornerLocalView.h
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerView.h"
#import "HKDateActionSheet.h"

@interface HKRoundCornerLocalView : HKRoundCornerView<UITextFieldDelegate,HKDateActionSheetDelegate>

@property (nonatomic,strong) UITextField *tv;
@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) HKDateActionSheet *actionSheet;
@property (nonatomic,strong) UIButton *btn2;
@property (nonatomic,strong) NSString *date;
-(void)setmyframe:(BOOL)isHour;
@end
