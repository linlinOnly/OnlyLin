//
//  HKOrderListModel.m
//  HK
//
//  Created by 马涛 on 14-5-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKOrderListModel.h"

@implementation HKOrderListModel

-(id)init
{
    self = [super init];
    if (self) {
        //
        
//        _user = [FrontHelper getLoginInfo];
        
    }
    return self;
}


-(void)sendPostToServer
{
    _user = [FrontHelper getLoginInfo];
    
    NSString *token = [[NSString alloc] init];
    
    token = [FrontHelper tokenController:@"order" action:@"list"];
    
//    NSLog(@"%@",token);
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/order/list"];
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request setStringEncoding:NSUTF8StringEncoding];
//    
    NSLog(@"useris = %@",_user);
    
    [request addPostValue:_user forKey:@"mobile"];
    [request addPostValue:token forKey:@"token"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request setTag:10011];
    
    if ([FrontHelper getNetStatus] == 0) {
        [SVProgressHUD showErrorWithStatus_custom:@"无网络连接" duration:1.0];
        return;
    }
    
    [SVProgressHUD showWithStatus:@"获取订单中..." maskType:SVProgressHUDMaskTypeClear];
    
    [request startAsynchronous];
}

- (void)requestStarted:(ASIHTTPRequest *)request
{
//    NSLog(@"start ");
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
    if ([_delegate respondsToSelector:@selector(sendOrderListFinish:)]) {
        
//        NSLog(@"finish %@",request.responseString);
        
        NSError *err;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
        if (err == nil||jsonDic!= nil) {
            [_delegate sendOrderListFinish:jsonDic];
        }
        else
        {
//            NSLog(@"error %@, json %@",err,jsonDic);
            [SVProgressHUD dismissWithError:@"Error"];
        }
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
//    NSLog(@"failed  %@",request.responseString);
}

- (void)requestRedirected:(ASIHTTPRequest *)request
{
//    NSLog(@"redirected,%@",request.postBody);
}


@end
