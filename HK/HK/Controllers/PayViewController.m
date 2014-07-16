//
//  PayViewController.m
//  HK
//
//  Created by panyulin－cyou on 14-7-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "PayViewController.h"
#import "HKRoundCornerView.h"
@implementation PayViewController
- (id)init
{
    self = [super init];
    if (self) {
        
        
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"支付方式";
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    [customLab setTextColor:[UIColor whiteColor]];
    customLab.backgroundColor = [UIColor clearColor];
    customLab.textAlignment= NSTextAlignmentCenter;
    [customLab setText:self.title];
    customLab.backgroundColor = [UIColor clearColor];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    UIImage * backImage = [UIImage imageNamed:@"barback"];
    UIButton * backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,backImage.size.width, backImage.size.height)];
    [backBtn addTarget:self action:@selector(returnView) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:backImage forState:UIControlStateNormal];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    //余额视图
    HKRoundCornerView * balanceview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, 10, 300, 40) title:@"账户余额"];
    [self.view addSubview:balanceview];

    
    //上门收费
    HKRoundCornerView * payview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10,kFrameSetBottom(balanceview)+10, 300, 40) title:@"上门收费"];
    [self.view addSubview:payview];
    
    //上门收费
    HKRoundCornerView * netPayview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(payview)+10, 300, 40) title:@"网上支付"];
    [self.view addSubview:netPayview];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 300, 1)];
    line.backgroundColor = BGColor;
    [netPayview addSubview:line];

    
    
    
}

-(void)returnView
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
