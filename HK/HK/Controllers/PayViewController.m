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
    [self.view setBackgroundColor:[UIColor whiteColor]];
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
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 300, 20)];
    [titleLabel setText:@"选择付款方式"];
    [titleLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:14]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    titleLabel.textColor=kColorFromRGB(0x755833);
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:titleLabel];
    
    
    //余额视图
    HKRoundCornerView * balanceview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(titleLabel)+10, 300, 40) title:@"账户余额"];
    [self.view addSubview:balanceview];

    //上门收费
    HKRoundCornerView * payview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10,kFrameSetBottom(balanceview)+10, 300, 40) title:@"上门收费"];
    [self.view addSubview:payview];
    
//    UIButton * btnshangmen=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
//    [btnshangmen setBackgroundColor:[UIColor clearColor]];
//    [btnshangmen addTarget:self action:@selector(btnshangmenClick:) forControlEvents:UIControlEventTouchUpInside];
//    [payview addSubview:btnshangmen];
    
    
    //上门收费
    HKRoundCornerView * netPayview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(payview)+10, 300, 80) title:@"网上支付"];
    [self.view addSubview:netPayview];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 300, 1)];
    line.backgroundColor = BGColor;
    [netPayview addSubview:line];
    
    UIButton * zhifubaoBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(line)+5, 92, 30)];
    [zhifubaoBtn setImage:[UIImage imageNamed:@"zhifubaobtn"] forState:UIControlStateNormal];
    [zhifubaoBtn addTarget:self action:@selector(zhifubaoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [netPayview addSubview:zhifubaoBtn];
    
    NSLog(@"%f",[[_dicdata valueForKey:@"total_fee"] floatValue]);
    UILabel * zhifubaoLab = [[UILabel alloc] initWithFrame:CGRectMake(kFrameSetRight(zhifubaoBtn)+5, kFrameSetBottom(line)+8, 120, 20)];
    [zhifubaoLab setText:@"支付宝收银台"];
    [zhifubaoLab setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
    [zhifubaoLab setBackgroundColor:[UIColor clearColor]];
    zhifubaoLab.textColor=kColorFromRGB(0x755833);
    [zhifubaoLab setTextAlignment:NSTextAlignmentLeft];
    [netPayview addSubview:zhifubaoLab];
    
    
    
}
-(void)zhifubaoBtnClick:(UIButton*)btn
{
    _log = [[HKLogModel alloc] initWithOrderSN:[_dicdata valueForKey:@"order_sn"] andUid:[_dicdata valueForKey:@"uid"]];
    
    _log.delegate = self;
    
    [SVProgressHUD showWithStatus:@"验证中..." maskType:SVProgressHUDMaskTypeClear];
    [_log postLogModel];
    
}
-(void)finishLog:(NSDictionary *)dic
{
    [SVProgressHUD dismiss];
    [self payForOrder];
    
    //    if ([[dic objectForKey:@"code"] intValue] == 108) {
    //        [SVProgressHUD dismiss];
    ////        NSLog(@"...dic %@",dic);
    //
    //    }
    //    else{
    //        [SVProgressHUD showErrorWithStatus_custom:@"验证失败，无法支付" duration:1.0];
    //    }
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
    
    order.tradeNO = [_dicdata valueForKey:@"order_sn"];
	order.productName = @"牛家帮家政服务"; //商品标题
	order.productDescription = [NSString stringWithFormat:@"%@",[_dicdata valueForKey:@"address"]]; //商品描述
    
    //	order.amount = [NSString stringWithFormat:@"%.2f",[model.duration intValue]*50.0]; //商品价格
    
    order.amount = [NSString stringWithFormat:@"%.2f",[[_dicdata valueForKey:@"total_fee"] floatValue]];
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
}
-(void)returnView
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
