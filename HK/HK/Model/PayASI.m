//
//  PayASI.m
//  HK
//
//  Created by QiMengJin on 14-7-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "PayASI.h"
@implementation PayASI

-(id)initWithUser
{
    self = [super init];
    if (self) {
    }
    return self;
}





-(void)postPayshangmenModel:(NSString*)type//@"shangmen"
{
    NSString *token = [[NSString alloc] init];
    token = [FrontHelper tokenController:@"user" action:@"otherPay"];
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/user/otherPay"];
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
    [request addPostValue:[FrontHelper getLoginUid] forKey:@"uid"];
    [request addPostValue:type forKey:@"type"];
    [request addPostValue:_order_id forKey:@"order_id"];
    [request addPostValue:token forKey:@"token"];
    [request setRequestMethod:@"POST"];
    
    [request setDelegate:self];
    if ([FrontHelper getNetStatus] == 0) {
        [SVProgressHUD showErrorWithStatus_custom:@"无网络连接" duration:1.0];
        return;
    }
//     [SVProgressHUD showWithStatus:@"正在支付..." maskType:SVProgressHUDMaskTypeClear];
    [request startSynchronous];
}

- (void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"start log");
}

- (void)request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders
{
    
    //    NSLog(@"heads %@",responseHeaders);
    
}

- (void)request:(ASIHTTPRequest *)request willRedirectToURL:(NSURL *)newURL
{
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    if ([_delegate respondsToSelector:@selector(finishpay:)]) {
        //
        NSError *err;
        
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
        
        if (err == nil||jsonDic!= nil) {
            [_delegate finishpay:jsonDic];
        }
        else
        {
            [_delegate payFailed];
        }
        
    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [SVProgressHUD dismissWithError:@"上门支付失败"];
    NSLog(@"failed");[_delegate payFailed];
}

- (void)requestRedirected:(ASIHTTPRequest *)request
{
    NSLog(@"redirected,%@",request.postBody);
}


@end
