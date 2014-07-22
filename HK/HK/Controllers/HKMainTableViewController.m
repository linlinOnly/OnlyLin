//
//  HKMainTableViewController.m
//  HK
//
//  Created by 马涛 on 14-4-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKMainTableViewController.h"
#import "HKNavigationController.h"
#import "OrderData.h"
#import "OdMessageViewController.h"
#import "OrderSuccessViewController.h"
@interface HKMainTableViewController ()

@end

@implementation HKMainTableViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"个人中心";
        UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        [customLab setTextColor:[UIColor whiteColor]];
        customLab.textAlignment= NSTextAlignmentCenter;
        customLab.backgroundColor = [UIColor clearColor];
        [customLab setText:self.title];
        customLab.font = [UIFont boldSystemFontOfSize:20];
        self.navigationItem.titleView = customLab;
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    if (![FrontHelper checkLogin]) {
        HKLoginViewController *loginCV = [[HKLoginViewController alloc] init];
        HKNavigationController *loginNavi = [[HKNavigationController alloc] initWithRootViewController:loginCV];
        [self presentViewController:loginNavi animated:YES completion:nil];
    }else
    {
        if (_rightButton == nil) {

            UIButton * rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
            [rightBtn setTitle:@"退出" forState:UIControlStateNormal];
            [rightBtn setTitleColor:kColorFromRGB(0xb2ed1b) forState:UIControlStateNormal];
            [rightBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];

            _rightButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
            self.navigationItem.rightBarButtonItem = _rightButton;
            [_listModel sendPostToServer];
            
        }
        [self.navigationItem setRightBarButtonItem:_rightButton];

    }
}
-(void)logout
{
    [FrontHelper logout];
    HKLoginViewController *loginCV = [[HKLoginViewController alloc] init];
    HKNavigationController * theNav = [[HKNavigationController alloc]initWithRootViewController:loginCV];
    [self presentViewController:theNav animated:YES completion:nil];
    
}
-(void)toLoginPage
{
    
    HKLoginViewController *loginCV = [[HKLoginViewController alloc] init];
    HKNavigationController *loginNavi = [[HKNavigationController alloc] initWithRootViewController:loginCV];
    
    [self presentViewController:loginNavi animated:YES completion:nil];
}
- (void)viewDidLoad
{
#warning 设置默认选中立即下单.
    //     
    

    
    _orderList = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    
    _listModel = [[HKOrderListModel alloc] init];
    _listModel.delegate = self;
    _itemModel = [[HKOrderItemModel alloc] init];
    
    //余额视图
    HKRoundCornerView * balanceview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, 10, 300, 40) title:@"账户余额" titleimagename:@"yuer"];
    [self.view addSubview:balanceview];
    UIImageView * balanceviewright=[[UIImageView alloc]initWithFrame:CGRectMake(270, 8, 25, 25)];
    balanceviewright.image=[UIImage imageNamed:@"arrow"];
    [balanceview addSubview:balanceviewright];
    
    
    
    _balancelabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 0, 160, 40)];
    _balancelabel.textColor=kColorFromRGB(0xff8533);
    _balancelabel.textAlignment=NSTextAlignmentRight;
    _balancelabel.text=@"0";
    [balanceview addSubview:_balancelabel];
    
    //家庭住址视图
    HKRoundCornerView * homeAddressview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(balanceview)+10, 300, 40) title:@"家庭住址" titleimagename:@"home"];
    [self.view addSubview:homeAddressview];
    UIButton * homeAddressright=[[UIButton alloc]initWithFrame:CGRectMake(270, 8, 25, 25)];
    [homeAddressright setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [homeAddressright addTarget:self action:@selector(homeAddressrightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [homeAddressview addSubview:homeAddressright];
    
    _addressTfd=[[UILabel alloc]initWithFrame:CGRectMake(100, 0, 160, 40)];
    _addressTfd.textColor=kColorFromRGB(0x666666);
    _addressTfd.font=[UIFont systemFontOfSize:13];
    _addressTfd.textAlignment=NSTextAlignmentRight;
    _addressTfd.text=@"0";
    [homeAddressview addSubview:_addressTfd];
    
   
    
    //我的订单视图
    HKRoundCornerView * oderview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(homeAddressview)+10, 300, 40) title:@"我的订单" titleimagename:@"orderimage"];
    [self.view addSubview:oderview];
    
    UIButton * oderviewright=[[UIButton alloc]initWithFrame:CGRectMake(270, 8, 25, 25)];
    [oderviewright setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [oderviewright addTarget:self action:@selector(oderviewrightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [oderview addSubview:oderviewright];
    
    _bottomheight_int=10;
    
    float p = 0;
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        p = 50;
    }

    
    _bottomScorllView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(oderview)+10, 320, self.view.frame.size.height-kFrameSetBottom(oderview)-10 -p)];
    _bottomScorllView.autoresizingMask =UIViewAutoresizingFlexibleBottomMargin| UIViewAutoresizingFlexibleHeight;
    
    [_bottomScorllView setBackgroundColor:[UIColor whiteColor]];
    [_bottomScorllView setContentSize:CGSizeMake(320, 540)];
    [self.view addSubview:_bottomScorllView];
    
    
    UserASI * user=[[UserASI alloc]init];
    user.delegate=self;
    [user postUserModel];
    
    
}
-(void)oderviewrightBtnClick:(UIButton*)Btn
{
    Btn.selected=!Btn.selected;
    [UIView animateWithDuration:.3 animations:^{
        _bottomScorllView.alpha=_bottomScorllView.alpha==1?0:1;
    }];
}
-(void)homeAddressrightBtnClick:(UIButton*)Btn
{
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)orderDetailRequestFinish:(NSDictionary *)dic
{
//    NSLog(@"orderList %@",dic);
}
-(void)addOrderListView:(OrderData*)orderdata index:(int)index
{
    HKRoundCornerView * oderview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, _bottomheight_int , 300, 170) cornerRadius:2];
    [_bottomScorllView addSubview:oderview];
    _bottomheight_int=kFrameSetBottom(oderview)+10;
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(13,10, 52, 12)];
    label1.textColor=kColorFromRGB(0x333333);
    label1.font=[UIFont systemFontOfSize:12];
    label1.text=@"订单日期:";
    [oderview addSubview:label1];
    
    UILabel *label1r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label1)+16,10, 160, 12)];
    label1r.textColor=kColorFromRGB(0x333333);
    label1r.font=[UIFont systemFontOfSize:10];
    label1r.text=orderdata.create_time;
    [oderview addSubview:label1r];
    
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(13,kFrameSetBottom(label1)+8, 52, 12)];
    label2.textColor=kColorFromRGB(0x666666);
    label2.font=[UIFont systemFontOfSize:11];
    label2.text=@"订单编号:";
    [oderview addSubview:label2];
    
    UILabel *label2r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label1)+16,kFrameSetBottom(label1)+8, 160, 12)];
    label2r.textColor=kColorFromRGB(0x666666);
    label2r.font=[UIFont systemFontOfSize:9];
    label2r.text=orderdata.order_sn;
    [oderview addSubview:label2r];
    
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(13,kFrameSetBottom(label2)+8, 52, 12)];
    label3.textColor=kColorFromRGB(0x666666);
    label3.font=[UIFont systemFontOfSize:11];
    label3.text=@"订单总价:";
    [oderview addSubview:label3];
    
    UILabel *label3r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label1)+16,kFrameSetBottom(label2)+8, 160, 12)];
    label3r.textColor=kColorFromRGB(0x666666);
    label3r.font=[UIFont systemFontOfSize:9];
    label3r.text=orderdata.total_fee;
    [oderview addSubview:label3r];
    
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(13,kFrameSetBottom(label3)+8, 52, 12)];
    label4.textColor=kColorFromRGB(0x666666);
    label4.font=[UIFont systemFontOfSize:11];
    label4.text=@"订单类型:";
    [oderview addSubview:label4];
    
    UILabel *label4r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label1)+16,kFrameSetBottom(label3)+8, 160, 12)];
    label4r.textColor=kColorFromRGB(0x666666);
    label4r.font=[UIFont systemFontOfSize:9];
    label4r.text=[NSString stringWithFormat:@"%@%@",[orderdata.order_type isEqualToString:@"2"] ? @"预约订单" : @"小时达订单",[orderdata.service_type isEqualToString:@"2"] ? @"(双人组合)" : @""];
    [oderview addSubview:label4r];
    
    UILabel *label5=[[UILabel alloc]initWithFrame:CGRectMake(13,kFrameSetBottom(label4)+8, 52, 12)];
    label5.textColor=kColorFromRGB(0x666666);
    label5.font=[UIFont systemFontOfSize:11];
    label5.text=@"订单状态:";
    [oderview addSubview:label5];
    
    UILabel *label5r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label1)+16,kFrameSetBottom(label4)+8, 160, 12)];
    label5r.textColor=kColorFromRGB(0x666666);
    label5r.font=[UIFont systemFontOfSize:9];
    label5r.text=orderdata.order_status;
    [oderview addSubview:label5r];

    UIImageView * imageview=[[UIImageView alloc]initWithFrame:CGRectMake(13,kFrameSetBottom(label5)+8, 12, 12)];
    imageview.image=[UIImage imageNamed:@"local"];
    [oderview addSubview:imageview];
    
    UILabel *label6=[[UILabel alloc]initWithFrame:CGRectMake(26,kFrameSetBottom(label5)+8, 300, 12)];
    label6.textColor=kColorFromRGB(0x666666);
    label6.font=[UIFont systemFontOfSize:11];
    label6.text=orderdata.address;
    [oderview addSubview:label6];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label6)+10, 300, 0.3)];
    line.backgroundColor = [UIColor lightGrayColor];
    line.alpha=0.2;
    [oderview addSubview:line];
    
    if ([orderdata.pay_status isEqualToString:@"1"])
    {
        UIButton * orderMessage = [[UIButton alloc] initWithFrame:CGRectMake(15, kFrameSetBottom(line)+4, 90, 30)];
        [orderMessage setTitle:@"订单详情" forState:UIControlStateNormal];
        [orderMessage.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [orderMessage setTitleColor:kColorFromRGB(0x755833) forState:UIControlStateNormal];
        [orderMessage addTarget:self action:@selector(orderMessageBtn:) forControlEvents:UIControlEventTouchUpInside];
        orderMessage.tag=index;
        [oderview addSubview:orderMessage];
        
        UIButton * tryagain = [[UIButton alloc] initWithFrame:CGRectMake(105, kFrameSetBottom(line)+4, 90, 30)];
        [tryagain setTitle:@"再来一次" forState:UIControlStateNormal];
        [tryagain.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [tryagain setTitleColor:kColorFromRGB(0x755833) forState:UIControlStateNormal];
        [tryagain addTarget:self action:@selector(tryagainBtn:) forControlEvents:UIControlEventTouchUpInside];
        tryagain.tag=index;
        [oderview addSubview:tryagain];
        
        UIButton * pingjia = [[UIButton alloc] initWithFrame:CGRectMake(195, kFrameSetBottom(line)+4, 90, 30)];
        [pingjia setTitle:@"服务评价" forState:UIControlStateNormal];
        [pingjia.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [pingjia setTitleColor:kColorFromRGB(0x755833) forState:UIControlStateNormal];
        [pingjia addTarget:self action:@selector(orderMessageBtn:) forControlEvents:UIControlEventTouchUpInside];
        pingjia.tag=index;
        [oderview addSubview:pingjia];
        
    }else
    {
        UIButton * payBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, kFrameSetBottom(line)+4, 100, 30)];
        [payBtn setImage:[UIImage imageNamed:@"paybtn"] forState:UIControlStateNormal];
        [payBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [payBtn setTitleColor:kColorFromRGB(0x755833) forState:UIControlStateNormal];
        [payBtn addTarget:self action:@selector(payBtn:) forControlEvents:UIControlEventTouchUpInside];
        payBtn.tag=index;
        [oderview addSubview:payBtn];
    }
    [_bottomScorllView setContentSize:CGSizeMake(kFrameW(_bottomScorllView), kFrameSetBottom(oderview)+10)];
}
-(void)payBtn:(UIButton*)btn
{
    OrderSuccessViewController * ordersuccessview=[OrderSuccessViewController alloc];
    ordersuccessview.data=[_orderList objectAtIndex:btn.tag];
    ordersuccessview = [ordersuccessview init];
    [self.navigationController pushViewController:ordersuccessview animated:YES];
}
-(void)orderMessageBtn:(UIButton*)btn
{
    //点击订单详情
    OdMessageViewController * messageview=[OdMessageViewController alloc];
    messageview.data=[_orderList objectAtIndex:btn.tag];
    messageview=[messageview init];
    [self.navigationController pushViewController:messageview animated:YES];
}
-(void)tryagainBtn:(UIButton*)btn
{
    //点击再来一次
    [[NSNotificationCenter defaultCenter] postNotificationName:@"selectXiaDan" object:self];
    
}
-(void)sendOrderListFinish:(NSDictionary *)dic
{
    
    if ([[dic objectForKey:@"code"] intValue] != 108)
    {
        [SVProgressHUD dismissWithError:@"获取订单列表出错"];
    }
    else
    {
        NSArray * list = [dic objectForKey:@"result"];
        for (UIView * pView in _bottomScorllView.subviews) {
            NSLog(@"%s%@",__func__,pView);
            if ([pView isKindOfClass:[HKRoundCornerView class]]) {
                [pView removeFromSuperview];
            }
            
        }
        _bottomheight_int=10;
        [_orderList removeAllObjects];
        
        for (int i=0; i<list.count; i++)
        {
//            [_bottomScorllView rem]
            
            OrderData * orderdata=[OrderData itemFormOrderListDic:[list objectAtIndex:i]];
            [_orderList addObject:orderdata];
            [self addOrderListView:orderdata index:i];
        }
        [SVProgressHUD dismiss];
    }
}
-(void)finishuser:(NSDictionary *)dic
{
    if ([[dic objectForKey:@"code"] intValue] != 108)
    {
        [SVProgressHUD dismissWithError:@"获取余额出错"];
    }
    else
    {
        NSArray * addresss=[[NSArray alloc] initWithArray:[dic objectForKey:@"address"]];
        _addressTfd.text=addresss.count>0? [[addresss objectAtIndex:0] valueForKey:@"address"]:@"";
        _balancelabel.text=[[dic objectForKey:@"user"] objectForKey:@"balance"];
    }

    
}
-(void)logFailed
{
    [SVProgressHUD dismissWithError:@"获取余额失败"];
}


@end
