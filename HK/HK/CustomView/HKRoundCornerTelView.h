//
//  HKRoundCornerTelView.h
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerView.h"

@interface HKRoundCornerTelView : HKRoundCornerView<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *nametf;
@property (nonatomic,strong) UITextField *teltf;

@end
