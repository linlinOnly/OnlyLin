//
//  AboutViewController.m
//  HK
//
//  Created by 马涛 on 14-5-2.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@property (nonatomic,strong) UITextView *tv;
@property (nonatomic,strong) UIView *backView;

@end

@implementation AboutViewController

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
    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    
    self.view.backgroundColor = BGColor;
    
    
    _backView = [[UIView alloc] initWithFrame:CGRectMake(10, 30, 300, 310)];
    _backView.layer.cornerRadius = 6;
    _backView.layer.borderColor = BORDERColor.CGColor;
    _backView.layer.borderWidth = 1;
    _backView.backgroundColor = [UIColor whiteColor];
    
    _tv = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, 280, 300)];
    _tv.text = @"企业宗旨：我用心，您放心。让所有的家庭干净舒适牛家帮于2014年4月在上海成立，公司创始团队由原有尚网，牛窝网创始团队创办，平均年龄30岁，是国内最早一批电商创业团队。在独立电商行业一直坚持创业7年多，根据多年的经验累积，最终创办牛家帮O2O项目牛家帮致力服务中国中高端家庭用户，通过电子商务移动端，PC端，线下门店，给用户带来安全、快速、标准的家庭生活服务，牛家帮上线1期以安全的小时达标准服务给用户带来高品质的家政保洁产品，不同于传统的家政中介，牛家帮通过自己的家政运营专员做到让你用的放心，随叫随到，1小时内到达您的家庭，为用户提供统一培训的标准家政保洁服务牛家帮目标成为中国第一家真正的电商O2O家庭服务领导者，预计在3年内陆续提供用户家庭生活所需的各类产品，成为中国家庭用户得以信赖的家庭生活帮手。";
    _tv.backgroundColor  = [UIColor clearColor];
    _tv.textColor = [UIColor blackColor];
    _tv.editable = false;
    _tv.font = [UIFont systemFontOfSize:13];
    _tv.scrollEnabled = false;
    
    [_backView addSubview:_tv];
    [self.view addSubview:_backView];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    [self.navigationItem setLeftBarButtonItem:backButton];
    
    // Do any additional setup after loading the view.
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
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
