//
//  IntroductionViewController.m
//  HK
//
//  Created by 马涛 on 14-5-2.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "IntroductionViewController.h"

@interface IntroductionViewController ()


@property (nonatomic,strong) HKRoundCornerIntroductionView *itdView;
@property (nonatomic,strong) HKRoundCornerPriceInfoView *priceView;

@end

@implementation IntroductionViewController

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
    
    
    
    UIScrollView *bottomView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 530)];
    [bottomView setContentSize:CGSizeMake(320, 540)];
    
    
    _itdView = [[HKRoundCornerIntroductionView alloc] initWithFrame:CGRectMake(10, 10, 300, 285) title:@"家庭基础保洁说明"];
    _priceView = [[HKRoundCornerPriceInfoView alloc] initWithFrame:CGRectMake(10, 310, 300, 175) title:@"价格标准"];
    [bottomView addSubview:_itdView];
    [bottomView addSubview:_priceView];
    
    
    [self.view addSubview:bottomView];
    
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
