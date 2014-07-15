//
//  HKOrderDetailViewController.m
//  HK
//
//  Created by 马涛 on 14-5-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKOrderDetailViewController.h"

@interface HKOrderDetailViewController ()

@end

@implementation HKOrderDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
    }
    return self;
}

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        //
        
        _dic = [[NSDictionary alloc] init];
        
        _dic = dic;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //支付
    _priceView = [[HKRoundCornerPriceView alloc] initWithFrame:CGRectMake(10, 70, 300, 120) title:@"支付情况" andData:nil];
    
    //评论
    _commentView = [[HKCommentView alloc] initWithFrame:CGRectMake(10, 210, 300, 120) andDic:[_dic objectForKey:@"OrderComment"]];
    _commentView.btn.tag = [[[[_dic objectForKey:@"result"] objectForKey:@"order"] objectForKey:@"order_id"] intValue];
    
    
    

    [self.view addSubview:_priceView];
    [self.view addSubview:_commentView];
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
