//
//  UserASI.m
//  HK
//
//  Created by QiMengJin on 14-7-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "UserASI.h"

@implementation UserASI

-(id)initWithUser
{
    self = [super init];
    if (self) {
    }
    return self;
}





-(void)postUserModel
{
    NSString *token = [[NSString alloc] init];
    token = [FrontHelper tokenController:@"user" action:@"index"];
    
    
//    NSLog(@"token %@",token);//order_sn  uid
    
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/user"];
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    [request addPostValue:[FrontHelper getLoginUid] forKey:@"uid"];

    
    [request addPostValue:token forKey:@"token"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    if ([FrontHelper getNetStatus] == 0) {
        [SVProgressHUD showErrorWithStatus_custom:@"无网络连接" duration:1.0];
        return;
    }
    
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
    if ([_delegate respondsToSelector:@selector(finishuser:)]) {
        //
        NSError *err;
        
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
        
        if (err == nil||jsonDic!= nil) {
            [_delegate finishuser:jsonDic];
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
