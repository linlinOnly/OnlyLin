//
//  HKLoginViewController.m
//  HK
//
//  Created by 马涛 on 14-4-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKLoginViewController.h"
#import "HKRoundCornerTimeLongView.h"
@interface HKLoginViewController ()

@end

@implementation HKLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        
        self.title = @"登录牛家帮";
        
        UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        [customLab setTextColor:[UIColor whiteColor]];
        customLab.textAlignment= NSTextAlignmentCenter;
        customLab.backgroundColor = [UIColor clearColor];
        [customLab setText:self.title];
        customLab.font = [UIFont boldSystemFontOfSize:20];
        self.navigationItem.titleView = customLab;
        
        UIImage * backImage = [UIImage imageNamed:@"barback"];
        UIButton * backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,backImage.size.width, backImage.size.height)];
        [backBtn addTarget:self action:@selector(returnView) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setImage:backImage forState:UIControlStateNormal];
        UIBarButtonItem *backItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];

        self.navigationItem.leftBarButtonItem = backItem;
        self.view.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    
    _loginInfo = [[HKLoginModel alloc] init];
    _loginBtn = [[UIButton alloc] init];
    
    UIImageView * imageview=[[UIImageView alloc]initWithFrame:CGRectMake(43, 25, 205, 81)];
    [imageview setImage:[UIImage imageNamed:@"logo"]];
    [self.view addSubview:imageview];
    
    UIView *temptel = [[UIView alloc] initWithFrame:CGRectMake(18, kFrameSetBottom(imageview)+30, 284, 45)];
    temptel.layer.cornerRadius = 6;
    temptel.backgroundColor = VBGColor;
    temptel.layer.borderColor = BORDERColor.CGColor;
    temptel.layer.borderWidth = 1;
    [self.view addSubview:temptel];
    
    
    UIImageView *userImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 22, 22)];
     userImg.image = [UIImage imageNamed:@"user"];
    userImg.backgroundColor = VBGColor;
    [temptel addSubview:userImg];
    
    _teltf = [[UITextField alloc] initWithFrame:CGRectMake(50, 12, 200, 24)];
    [_teltf setPlaceholder:@"请输入手机号码"];
    _teltf.delegate=self;
    _teltf.keyboardType = UIKeyboardTypeNumberPad;
    [temptel addSubview:_teltf];
    
    
    
    UIView *tempass = [[UIView alloc] initWithFrame:CGRectMake(18, kFrameSetBottom(temptel)+18, 284, 45)];
    tempass.layer.cornerRadius = 6;
    tempass.backgroundColor = VBGColor;
    tempass.layer.borderColor = BORDERColor.CGColor;
    tempass.layer.borderWidth = 1;
    [self.view addSubview:tempass];
    
    UIImageView *pwdImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 22, 22)];
    pwdImg.image = [UIImage imageNamed:@"pass"];
    [tempass addSubview:pwdImg];
    
    _codetf = [[UITextField alloc] initWithFrame:CGRectMake(50, 12, 150, 24)];
    [_codetf setPlaceholder:@"输入验证码"];
    _codetf.delegate=self;
    _codetf.keyboardType = UIKeyboardTypeNumberPad;
    [tempass addSubview:_codetf];
    
    _codeBtn = [[UIButton alloc] initWithFrame:CGRectMake(190, 9, 80, 30)];
    [_codeBtn setImage:[UIImage imageNamed:@"yan"] forState:UIControlStateNormal];
    [_codeBtn addTarget:self action:@selector(getCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [tempass addSubview:_codeBtn];
    
    
    [_loginBtn setFrame:CGRectMake(18, kFrameSetBottom(tempass)+24, 282, 44)];
    [_loginBtn setImage:[UIImage imageNamed:@"login"] forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginBtn];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    float p = 70;
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        p = 0;
    }
    
    float height = [[UIScreen mainScreen] bounds].size.height - CGRectGetMaxY(_loginBtn.frame) - p;
    
    height = height>216? 0: height-216;
    
    self.view.frame=CGRectMake(0, height , kFrameW(self.view), kFrameH(self.view));
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getCodeBtnClick
{
    _loginInfo.telStr = _teltf.text;
    _loginInfo.delegate = self;
    
    [_loginInfo getCodeByRequest];
    
    [SVProgressHUD showWithStatus:@"验证码获取中..." maskType:SVProgressHUDMaskTypeClear];
    [_teltf setEnabled:false];
}


-(void)login
{
    _loginInfo.telStr = _teltf.text;
    _loginInfo.codeStr = _codetf.text;
    _loginInfo.delegate = self;
    
    [_loginInfo loginByRequest];
    
    [SVProgressHUD showWithStatus:@"登录中..." maskType:SVProgressHUDMaskTypeClear];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)returnView
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectXiaDan" object:self];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)finishLogin:(NSDictionary *)dic
{
//    NSLog(@"%@",dic);
//    [FrontHelper setLoginInfo:@"18105739639"];
    
    HKLoginInfoModel *lf = [[HKLoginInfoModel alloc] initWithDic:dic];
    
    switch (lf.status) {
        case 108://成功
        {
            [FrontHelper setLoginInfo:lf.mobile];
            [FrontHelper setLoginUid:lf.userId];
            [SVProgressHUD dismiss];
            //[_listModel sendPostToServer];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"orderlist" object:self];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case 112://验证码过期或者无效
        {
            [SVProgressHUD dismissWithError:@"验证码过期或者无效"];
        }
            break;
        default://反正是错了，爱咋地咋地
        {
            [SVProgressHUD dismissWithError:@"验证出错"];
        }
            break;
    }
    
}
-(void)finishGetCode:(NSDictionary *)dic
{
    if ([[dic objectForKey:@"code"] intValue] != 108) {
        [SVProgressHUD dismissWithError:@"验证码获取失败"];
        [_teltf setEnabled:true];
    }
    else
    {
        [SVProgressHUD dismissWithSuccess:@"验证码已发送，300秒内有效"];
    }
    
}

-(void)getCodeFailed
{
    [SVProgressHUD dismissWithError:@"获取验证码失败"];
    [_teltf setEnabled:true];
}

-(void)loginFailed
{
    [SVProgressHUD dismissWithError:@"登录失败"];
}


@end
