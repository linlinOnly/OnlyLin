//
//  OrderSuccessViewController.m
//  HK
//
//  Created by QiMengJin on 14-7-15.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OrderSuccessViewController.h"
#import "HKRoundCornerView.h"
#import "PayViewController.h"
#import "ShangMenZFViewController.h"
#import "HKNavigationController.h"
@interface OrderSuccessViewController ()

@end

@implementation OrderSuccessViewController

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
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"确认订单";
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
    
    
    _bottomScorllView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    _bottomScorllView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_bottomScorllView setBackgroundColor:[UIColor whiteColor]];
    [_bottomScorllView setContentSize:CGSizeMake(320, 540)];
    [self.view addSubview:_bottomScorllView];
//    [UIImage imageNamed:@"townpeople_c"]
    UIImageView * imageview=[[UIImageView alloc]initWithFrame:CGRectMake(80, 12, 20, 20)];
    imageview.image=[UIImage imageNamed:@"townpeople_c"];
    [_bottomScorllView addSubview:imageview];
    
    UILabel *labeltitle=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(imageview)+4,8, 200, 30)];
    labeltitle.textColor=kColorFromRGB(0x755833);
    labeltitle.font=[UIFont systemFontOfSize:20];
    labeltitle.text=@"提交订单成功";
    [_bottomScorllView addSubview:labeltitle];
    
    UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(labeltitle)+4, 320, 1)];
    line1.backgroundColor = BGColor;
    [_bottomScorllView addSubview:line1];
    
    
    HKRoundCornerView * bottomview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(line1)+8, 300, 300)];
    [_bottomScorllView addSubview:bottomview];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(20,8, 62, 26)];
    label1.textColor=kColorFromRGB(0x755833);
    label1.font=[UIFont systemFontOfSize:13];
    label1.text=@"订单类型:";
    [bottomview addSubview:label1];
    
    UILabel *label1r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label1)+16,8, 70, 26)];
    label1r.textColor=kColorFromRGB(0x755833);
    label1r.font=[UIFont systemFontOfSize:14];
    label1r.text=[_data.order_type isEqualToString:@"2"] ? @"预约订单" : @"小时达订单";
    [bottomview addSubview:label1r];
    
    UILabel *label1r2=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label1r),8, 100, 26)];
    label1r2.textColor=kColorFromRGB(0x000000);
    label1r2.font=[UIFont systemFontOfSize:12];
    label1r2.text=[_data.service_type isEqualToString:@"2"] ? @"(双人组合)" : @"";
    [bottomview addSubview:label1r2];
    
    UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label1)+4, 300, 1)];
    line2.backgroundColor = BGColor;
    [bottomview addSubview:line2];
    
    
    
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line2)+4, 62, 26)];
    label2.textColor=kColorFromRGB(0x755833);
    label2.font=[UIFont systemFontOfSize:13];
    label2.text=@"预约时间:";
    [bottomview addSubview:label2];
    
    UILabel *label2r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label2)+16,kFrameSetBottom(line2)+4, 160, 26)];
    label2r.textColor=kColorFromRGB(0x000000);
    label2r.font=[UIFont systemFontOfSize:11];
    label2r.text=_data.reservetime?_data.reservetime:@"";
    [bottomview addSubview:label2r];
    
    UILabel *line3 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label2)+4, 300, 1)];
    line3.backgroundColor = BGColor;
    [bottomview addSubview:line3];
    
    
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line3)+4, 62, 26)];
    label3.textColor=kColorFromRGB(0x755833);
    label3.font=[UIFont systemFontOfSize:13];
    label3.text=@"服务时长:";
    [bottomview addSubview:label3];
    
    UILabel *label3r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label3)+16,kFrameSetBottom(line3)+4, 160, 26)];
    label3r.textColor=kColorFromRGB(0x000000);
    label3r.font=[UIFont systemFontOfSize:11];
    label3r.text=_data.product_id;
    [bottomview addSubview:label3r];
    
    UILabel *line4 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label3)+4, 300, 1)];
    line4.backgroundColor = BGColor;
    [bottomview addSubview:line4];
    
    
    
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line4)+4, 62, 26)];
    label4.textColor=kColorFromRGB(0x755833);
    label4.font=[UIFont systemFontOfSize:13];
    label4.text=@"订单编号:";
    [bottomview addSubview:label4];
    
    UILabel *label4r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label4)+16,kFrameSetBottom(line4)+4, 160, 26)];
    label4r.textColor=kColorFromRGB(0x000000);
    label4r.font=[UIFont systemFontOfSize:11];
    label4r.text=_data.order_sn;
    [bottomview addSubview:label4r];
    
    UILabel *line5 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label4)+4, 300, 1)];
    line5.backgroundColor = BGColor;
    [bottomview addSubview:line5];
    
    
    
    
    UILabel *label5=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line5)+4, 62, 26)];
    label5.textColor=kColorFromRGB(0x755833);
    label5.font=[UIFont systemFontOfSize:13];
    label5.text=@"服务地址:";
    [bottomview addSubview:label5];
    
    UILabel *label5r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label5)+16,kFrameSetBottom(line5)+4, 160, 26)];
    label5r.textColor=kColorFromRGB(0x000000);
    label5r.font=[UIFont systemFontOfSize:11];
    label5r.text=_data.address;
    [bottomview addSubview:label5r];
    
    UILabel *line6 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label5)+4, 300, 1)];
    line6.backgroundColor = BGColor;
    [bottomview addSubview:line6];
    
    
    
    UILabel *label6=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line6)+4, 62, 26)];
    label6.textColor=kColorFromRGB(0x755833);
    label6.font=[UIFont systemFontOfSize:13];
    label6.text=@"手机号码:";
    [bottomview addSubview:label6];
    
    UILabel *label6r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label6)+16,kFrameSetBottom(line6)+4, 160, 26)];
    label6r.textColor=kColorFromRGB(0x000000);
    label6r.font=[UIFont systemFontOfSize:11];
    label6r.text=_data.mobile;
    [bottomview addSubview:label6r];
    
    UILabel *line7 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label6)+4, 300, 1)];
    line7.backgroundColor = BGColor;
    [bottomview addSubview:line7];
    
    
    
    UILabel *label7=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line7)+4, 62, 26)];
    label7.textColor=kColorFromRGB(0x755833);
    label7.font=[UIFont systemFontOfSize:13];
    label7.text=@"应付金额:";
    [bottomview addSubview:label7];
    
    UILabel *label7r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label7)+16,kFrameSetBottom(line7)+4, 160, 26)];
    label7r.textColor=[UIColor redColor];
    label7r.font=[UIFont systemFontOfSize:11];
    label7r.text=_data.total_fee;
    [bottomview addSubview:label7r];
    
    bottomview.frame=CGRectMake(10, kFrameSetBottom(line1)+8, 300, kFrameSetBottom(label7)+10);
    
    UILabel *label8=[[UILabel alloc]initWithFrame:CGRectMake(10,kFrameSetBottom(bottomview)+10, 300, 26)];
    label8.textColor=kColorFromRGB(0x755833);
    label8.font=[UIFont systemFontOfSize:15];
    label8.textAlignment=NSTextAlignmentCenter;
    label8.text=@"请选择付款方式";
    [_bottomScorllView addSubview:label8];

    
    //余额视图
    HKRoundCornerView * balanceview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(label8)+10, 300, 40) title:@"账户余额"];
    [_bottomScorllView addSubview:balanceview];
    
    UILabel *balanceviewlabelr=[[UILabel alloc]initWithFrame:CGRectMake(220,10, 80, 20)];
    balanceviewlabelr.textColor=[UIColor redColor];
    balanceviewlabelr.font=[UIFont systemFontOfSize:15];
    balanceviewlabelr.textAlignment=NSTextAlignmentCenter;
    balanceviewlabelr.text=_data.balance;
    [balanceview addSubview:balanceviewlabelr];
    
    
    //上门收费
    HKRoundCornerView * payview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10,kFrameSetBottom(balanceview)+10, 300, 40) title:@"上门收费"];
    [_bottomScorllView addSubview:payview];
    
    UIButton * btnshangmen=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    [btnshangmen setBackgroundColor:[UIColor clearColor]];
    [btnshangmen addTarget:self action:@selector(btnshangmenClick:) forControlEvents:UIControlEventTouchUpInside];
    [payview addSubview:btnshangmen];
    
    
    //上门收费
    HKRoundCornerView * netPayview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(payview)+10, 300, 80) title:@"网上支付"];
    [_bottomScorllView addSubview:netPayview];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 300, 1)];
    line.backgroundColor = BGColor;
    [netPayview addSubview:line];
    
    UIButton * zhifubaoBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(line)+5, 92, 30)];
    [zhifubaoBtn setImage:[UIImage imageNamed:@"zhifubaobtn"] forState:UIControlStateNormal];
    [zhifubaoBtn addTarget:self action:@selector(zhifubaoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [netPayview addSubview:zhifubaoBtn];
    
    UILabel * zhifubaoLab = [[UILabel alloc] initWithFrame:CGRectMake(kFrameSetRight(zhifubaoBtn)+5, kFrameSetBottom(line)+8, 120, 20)];
    [zhifubaoLab setText:@"支付宝收银台"];
    [zhifubaoLab setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
    [zhifubaoLab setBackgroundColor:[UIColor clearColor]];
    zhifubaoLab.textColor=kColorFromRGB(0x755833);
    [zhifubaoLab setTextAlignment:NSTextAlignmentLeft];
    [netPayview addSubview:zhifubaoLab];
    
    [_bottomScorllView setContentSize:CGSizeMake(kFrameW(_bottomScorllView), kFrameSetBottom(netPayview)+20)];

}
-(void)submitDataToServer:(UIButton*)btn
{
    PayViewController * orderview=[[PayViewController alloc]init];
    [self.navigationController pushViewController:orderview animated:YES];
}
-(void)returnView
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)zhifubaoBtnClick:(UIButton*)btn
{
    _log = [[HKLogModel alloc] initWithOrderSN:_data.order_sn andUid:_data.uid];
    
    _log.delegate = self;
    
    [SVProgressHUD showWithStatus:@"验证中..." maskType:SVProgressHUDMaskTypeClear];
    [_log postLogModel];
    
}
-(void)finishLog:(NSDictionary *)dic
{
    [SVProgressHUD dismiss];
    [self payForOrder];
}
-(void)logFailed
{
    [SVProgressHUD dismiss];
    [self payForOrder];
    //    [SVProgressHUD showErrorWithStatus_custom:@"验证失败，无法支付" duration:1.0];
}



-(void)payForOrder
{
    NSString *appScheme = @"niujiabang";
    NSString* orderInfo = [self getOrderInfo];
    NSString* signedStr = [self doRsa:orderInfo];
    
    NSString *orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                             orderInfo, signedStr, @"RSA"];
	
    [AlixLibService payOrder:orderString AndScheme:appScheme seletor:@selector(paymentResult:) target:self];
    
}


-(NSString*)getOrderInfo
{
    /*
	 *点击获取prodcut实例并初始化订单信息
	 */
    //	Product *product = [_products objectAtIndex:index];
    AlixPayOrder *order = [[AlixPayOrder alloc] init];
    order.partner = PartnerID;
    order.seller = SellerID;
    
    order.tradeNO = _data.order_sn;//[_data valueForKey:@"order_sn"];
	order.productName = @"牛家帮家政服务"; //商品标题
	order.productDescription = [NSString stringWithFormat:@"%@",_data.address]; //商品描述
    
    //	order.amount = [NSString stringWithFormat:@"%.2f",[model.duration intValue]*50.0]; //商品价格
    
    order.amount = [NSString stringWithFormat:@"%.2f",1*1.0];
	order.notifyURL =  @"http://www.niuhome.com/AppAlipayNotify"; //回调URL
    //    order.notifyURL = @"http://www.niuhome.com/AlipayReturn";
	
	return [order description];
}


-(NSString*)doRsa:(NSString*)orderInfo
{
    id<DataSigner> signer;
    signer = CreateRSADataSigner(PartnerPrivKey);
    
    NSString *signedString = [signer signString:orderInfo];
    
    return signedString;
}

-(void)paymentResultDelegate:(NSString *)result
{
    NSLog(@" payment result %@",result);
}


//wap回调函数
-(void)paymentResult:(NSString *)resultd
{
    
    AlixPayResult* result = [[AlixPayResult alloc] initWithString:resultd];
	if (result)
    {
		
		if (result.statusCode == 9000)
        {
			/*
			 *用公钥验证签名 严格验证请使用result.resultString与result.signString验签
			 */
            
            //交易成功
            NSString* key = AlipayPubKey;//签约帐户后获取到的支付宝公钥
			id<DataVerifier> verifier;
            verifier = CreateRSADataVerifier(key);
            
			if ([verifier verifyString:result.resultString withSign:result.signString])
            {
                //验证签名成功，交易结果无篡改
                
                NSLog(@"hehe success");
                ShangMenZFViewController * ctrl = [[ShangMenZFViewController alloc]init];
                HKNavigationController * theNav = [[HKNavigationController alloc]initWithRootViewController:ctrl];
                [self presentViewController:theNav animated:YES completion:nil];
			}
        }
        else
        {
            //交易失败
        }
    }
    else
    {
        //失败
    }
    
}
-(void)btnshangmenClick:(UIButton*)btn
{
    NSLog(@"点击上门付钱");
    PayASI * payasi=[PayASI alloc];
    payasi.order_id=_data.order_id;
    payasi.delegate=self;
    payasi=[payasi init];
    [payasi postPayshangmenModel];
}
-(void)finishpay:(NSDictionary *)dic
{
    if ([[dic objectForKey:@"code"] intValue] != 108)
    {
        [SVProgressHUD showErrorWithStatus:@"上门支付失败"];
    }else
    {
        [SVProgressHUD showSuccessWithStatus:@"上门支付成功"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"orderlist" object:self];
        
        ShangMenZFViewController * ctrl = [[ShangMenZFViewController alloc]init];
        HKNavigationController * theNav = [[HKNavigationController alloc]initWithRootViewController:ctrl];
        [self presentViewController:theNav animated:YES completion:nil];
    }
    
}

@end
