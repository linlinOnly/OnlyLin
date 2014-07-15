//
//  HKRoundCornerPriceView.m
//  HK
//
//  Created by 马涛 on 14-5-3.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerPriceView.h"

@implementation HKRoundCornerPriceView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame title:(NSString *)title andData:(HKOrderDetailInfoModel *)dic
{
    self = [super initWithFrame:frame title:title];
    if (self) {
        //
        
        
        
        
        
        
        _model = [[HKOrderDetailInfoModel alloc] init];
        _model = dic;
        
        NSLog(@"order info %d,%@ ,%d  heh",dic.order_status,dic.duration,dic.pay_status);
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 280, 20)];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        

        _priceLabel.backgroundColor = [UIColor clearColor];
        
        
        
        int price = [dic.duration intValue] * 50;
        
        
        
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 65, 280, 20)];
        _btn.layer.cornerRadius = 3.0;
        
        
        
        if(dic.pay_status == 1)
        {
            _priceLabel.text = [NSString stringWithFormat:@"￥ %d 已支付",price];
            [_btn setTitle:@"立即付款" forState:UIControlStateDisabled];
            [_btn setBackgroundColor:[UIColor lightGrayColor]];
            [_btn setEnabled:false];
        }
        else
        {
            _priceLabel.text = [NSString stringWithFormat:@"￥ %d 可以在线支付",price];
            [_btn setTitle:@"立即付款" forState:UIControlStateNormal];
            [_btn setBackgroundColor:MYREDColor];
            [_btn setEnabled:true];
            [_btn addTarget:self action:@selector(addPayLog) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
        
        [self addSubview:_priceLabel];
        [self addSubview:_btn];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(void)addPayLog
{
    _log = [[HKLogModel alloc] initWithOrderSN:_model.order_sn andUid:_model.uid];
    
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
    NSString* orderInfo = [self getOrderInfo:_model];
    NSString* signedStr = [self doRsa:orderInfo];
    
    NSString *orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                             orderInfo, signedStr, @"RSA"];
	
    [AlixLibService payOrder:orderString AndScheme:appScheme seletor:@selector(paymentResult:) target:self];

}


-(NSString*)getOrderInfo:(HKOrderDetailInfoModel *)model
{
    /*
	 *点击获取prodcut实例并初始化订单信息
	 */
//	Product *product = [_products objectAtIndex:index];
    AlixPayOrder *order = [[AlixPayOrder alloc] init];
    order.partner = PartnerID;
    order.seller = SellerID;
    
    order.tradeNO = model.order_sn;
	order.productName = @"牛家帮家政服务"; //商品标题
	order.productDescription = [NSString stringWithFormat:@"%@",model.address]; //商品描述
    
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

@end
