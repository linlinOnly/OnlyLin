//
//  HKLoginModel.m
//  HK
//
//  Created by 马涛 on 14-4-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKLoginModel.h"

@implementation HKLoginModel


-(id)init
{
    self = [super init];
    if (self) {
        //
        _telStr = [[NSString alloc] init];
        _codeStr = [[NSString alloc] init];
    }
    return self;
}


-(void)getCodeByRequest
{
    NSString *token = [[NSString alloc] init];
    token = [FrontHelper tokenController:@"getsms" action:@"index"];
    
//    NSLog(@"token %@",token);
    
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/getsms"];
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:_telStr forKey:@"mobile"];
    [request addPostValue:@"2" forKey:@"type"];
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

-(void)loginByRequest
{
    NSString *token = [[NSString alloc] init];
    token = [FrontHelper tokenController:@"login" action:@"index"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/login"];
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:_telStr forKey:@"mobile"];
    [request addPostValue:_codeStr forKey:@"code"];
    [request addPostValue:token forKey:@"token"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request setTag:10012];
    if ([FrontHelper getNetStatus] == 0) {
        [SVProgressHUD showErrorWithStatus_custom:@"无网络连接" duration:1.0];
        return;
    }
    [request startAsynchronous];
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
    switch (request.tag) {
        case 10012:
        {
            if ([_delegate respondsToSelector:@selector(finishLogin:)]) {
                
                NSError *err;
                
                NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
                
                if (err == nil||jsonDic!= nil) {
                    [_delegate finishLogin:jsonDic];
                }
                else
                {
                    [_delegate loginFailed];
                }
                
            }
        }
            break;
        case 10011:
        {
            if ([_delegate respondsToSelector:@selector(finishGetCode:)]) {
                //
                NSError *err;
                
                NSLog(@"str %@",request.responseString);
                
                NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
                
                if (err == nil||jsonDic!= nil) {
                    [_delegate finishGetCode:jsonDic];
                }
                else
                {
                    [_delegate getCodeFailed];
                }
                
            }
        }
            break;
        default:
            break;
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
