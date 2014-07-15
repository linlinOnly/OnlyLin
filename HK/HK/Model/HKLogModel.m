//
//  HKLogModel.m
//  HK
//
//  Created by 马涛 on 14-6-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKLogModel.h"

@implementation HKLogModel

-(id)initWithOrderSN:(NSString *)orderSn andUid:(NSString *)uid
{
    self = [super init];
    if (self) {
        //
        _orderSN = [[NSString alloc] init];
        _uid = [[NSString alloc] init];
        
        _orderSN = orderSn;
        _uid = uid;
    }
    return self;
}





-(void)postLogModel
{
    NSString *token = [[NSString alloc] init];
    token = [FrontHelper tokenController:@"payLog" action:@"index"];
    
    NSLog(@"token %@",token);//order_sn  uid
    
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/payLog"];
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:_orderSN forKey:@"order_sn"];
    [request addPostValue:_uid forKey:@"uid"];
    
    
    NSLog(@"%@,%@",_orderSN,_uid);
    
    [request addPostValue:token forKey:@"token"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request setTag:10011];
    
    if ([FrontHelper getNetStatus] == 0) {
        [SVProgressHUD showErrorWithStatus_custom:@"无网络连接" duration:1.0];
        return;
    }
    [request startAsynchronous];
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
    if ([_delegate respondsToSelector:@selector(finishLog:)]) {
        //
        NSError *err;
                
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
                
        if (err == nil||jsonDic!= nil) {
            [_delegate finishLog:jsonDic];
        }
        else
        {
            [_delegate logFailed];
        }
                
    }

}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"failed");[_delegate logFailed];
}

- (void)requestRedirected:(ASIHTTPRequest *)request
{
    NSLog(@"redirected,%@",request.postBody);
}


@end
