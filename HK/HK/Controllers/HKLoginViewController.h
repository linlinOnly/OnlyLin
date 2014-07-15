//
//  HKLoginViewController.h
//  HK
//
//  Created by 马涛 on 14-4-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "HKLoginModel.h"
#import "HKLoginInfoModel.h"
#import "FrontHelper.h"

#import "SVProgressHUD.h"

@interface HKLoginViewController : UIViewController<UIAlertViewDelegate,HKLoginModelDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UITextField *teltf;
@property (nonatomic,strong) UITextField *codetf;

@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *codeBtn;

@property (nonatomic,strong) HKLoginModel *loginInfo;


@end
