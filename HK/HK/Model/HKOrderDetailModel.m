//
//  HKOrderDetailModel.m
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKOrderDetailModel.h"

@implementation HKOrderDetailModel

-(id)initWithMobile:(NSString *)mobile orderId:(NSString *)oid
{
    self = [super init];
    if (self) {
        //
        
        _mobile = [[NSString alloc] init];
        _orderId = [[NSString alloc] init];
        
        _mobile = mobile;
        _orderId = oid  ;
        
    }
    return self;
}

-(void)postToServer
{
    NSString *token = [[NSString alloc] init];
    //订单详情
    token = [FrontHelper tokenController:@"order" action:@"view"];
    
//    NSLog(@"%@",token);
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/order/view"];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    
//    NSLog(@"mobile %@,id %@",_mobile,_orderId);
    
    [request addPostValue:_mobile forKey:@"mobile"];
    [request addPostValue:_orderId forKey:@"order_id"];
    [request addPostValue:token forKey:@"token"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request setTag:100000];
    if ([FrontHelper getNetStatus] == 0) {
        [SVProgressHUD showErrorWithStatus_custom:@"无网络连接" duration:1.0];
        return;
    }
    [request startAsynchronous];
    
//    NSLog(@"start asy");
    
}

- (void)requestStarted:(ASIHTTPRequest *)request
{
    NSLog(@"start ");
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
//    NSLog(@"%@",request.responseString);
    
    if ([_delegate respondsToSelector:@selector(orderDetailRequestFinish:)]) {
        
        NSError *err;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
        if (err == nil||jsonDic!= nil) {
            [_delegate orderDetailRequestFinish:jsonDic];
        }
        else
        {
            NSLog(@"error");
        }
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"failed");
}

- (void)requestRedirected:(ASIHTTPRequest *)request
{
    NSLog(@"redirected,%@",request.postBody);
}



@end
