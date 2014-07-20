//
//  HKCommentModel.m
//  HK
//
//  Created by 马涛 on 14-5-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKCommentModel.h"

@implementation HKCommentModel


-(id)initWithOrderId:(int)orderId Status:(int)status Comment:(NSString *)comment
{
    self = [super init];
    if (self) {
        
        _order_id = [[NSString alloc] init];
        _comment = [[NSString alloc] init];
        _status = [[NSString alloc] init];
        
        _order_id = [NSString stringWithFormat:@"%d",orderId];;
        _status = [NSString stringWithFormat:@"%d",status];
        _comment = comment;
    }
    return self;
}



-(void)postToServer
{
    //好评测试
    NSString *token = [[NSString alloc] init];
    token = [FrontHelper tokenController:@"order" action:@"comment"];
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/order/comment"];
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:_order_id forKey:@"order_id"];
    [request addPostValue:_status forKey:@"evaluation"];
    [request addPostValue:_comment forKey:@"comment"];
    [request addPostValue:token forKey:@"token"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request setTag:10011];
    
    
    if ([FrontHelper getNetStatus] == 0) {
        [SVProgressHUD showErrorWithStatus_custom:@"无网络连接" duration:1.0];
        return;
    }
    
    [request startAsynchronous];
    [SVProgressHUD showWithStatus:@"正在提交评论..." maskType:SVProgressHUDMaskTypeClear];
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
//    NSLog(@"%@",request.responseString);
    
    if ([_delegate respondsToSelector:@selector(commentFinish:)]) {
        
        NSError *err;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
        if (err == nil||jsonDic!= nil) {
            [_delegate commentFinish:jsonDic];
        }
        else
        {
            [SVProgressHUD dismissWithError:@"评论失败"];
            NSLog(@"error");
        }
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"failed");
    
    [SVProgressHUD dismissWithError:@"评论失败"];
    if ([_delegate respondsToSelector:@selector(commentFailed)]) {
        [_delegate commentFailed];
    }
}

- (void)requestRedirected:(ASIHTTPRequest *)request
{
    NSLog(@"redirected,%@",request.postBody);
}


@end
