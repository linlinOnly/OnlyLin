//
//  ShangMenZFViewController.m
//  HK
//
//  Created by QiMengJin on 14-7-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "ShangMenZFViewController.h"

@interface ShangMenZFViewController ()

@end

@implementation ShangMenZFViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    [customLab setTextColor:[UIColor whiteColor]];
    customLab.backgroundColor = [UIColor clearColor];
    customLab.textAlignment= NSTextAlignmentCenter;
    [customLab setText:@"支付方式"];
    customLab.backgroundColor = [UIColor clearColor];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    UIImage * backImage = [UIImage imageNamed:@"barback"];
    UIButton * backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,backImage.size.width, backImage.size.height)];
    [backBtn addTarget:self action:@selector(returnView) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:backImage forState:UIControlStateNormal];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    [self initUI];
    
}

-(void)returnView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)initUI {
    
    UIImage * loginImg =[UIImage imageNamed:@"xiaoniu"];
    
    UIImageView * loginView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, loginImg.size.height)];
    loginView.image = loginImg;
    loginView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:loginView];
    
    UIButton * zhifuBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(loginView.frame)+20, self.view.frame.size.width, 30)];
    zhifuBtn.backgroundColor = [UIColor clearColor];
    
    [zhifuBtn setTitleColor:kColorFromRGB(0x755833) forState:UIControlStateNormal];
    [zhifuBtn setTitle:@" 支付成功" forState:UIControlStateNormal];
    [zhifuBtn setImage:[UIImage imageNamed:@"townpeople_c"] forState:UIControlStateNormal];
    zhifuBtn.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:zhifuBtn];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
