//
//  HKOrderModel.m
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKOrderModel.h"
#import "SBJsonParser.h"
@implementation HKOrderModel

-(id)init
{
    self = [super init];
    if (self) {
        //
        _serverDate = [[NSString alloc] init];
        _serverLocal = [[NSString alloc] init];
        _serverTel = [[NSString alloc] init];
        _serverTimeLong = [[NSString alloc] init];
        _serverTrueName = [[NSString alloc] init];
        _serverType=[[NSString alloc]init];
        _oderType=[[NSString alloc]init];
    }
    return self;
}

-(id)initWithDate:(NSString *)date local:(NSString *)local tel:(NSString *)tel production_id:(NSString *)production_id name:(NSString *)name serverType:(NSString*)serverType oderType:(NSString*)oderType
{
    self = [super init];
    if (self) {
        //
        _serverDate = [[NSString alloc] init];
        _serverLocal = [[NSString alloc] init];
        _serverTel = [[NSString alloc] init];
        _serverTimeLong = [[NSString alloc] init];
        _serverTrueName = [[NSString alloc] init];
        _serverType=[[NSString alloc]init];
        _oderType=[[NSString alloc]init];
        
        _serverDate = date;
        _serverLocal = local;
        _serverTel = tel;
        _serverTimeLong = production_id;
        _serverTrueName = name;
        _serverType=serverType;
        _oderType=oderType;
    }
    return self;
}


-(BOOL)checkData
{
    if ([_serverLocal length] <= 0) {
        //
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"地址不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
        return false;
    }
    
    if ([_serverDate length]<= 0 && [_oderType isEqualToString:@"2"]) {
         //
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"日期不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
        return false;
    }
    
    if ([_serverTel length]<= 0) {
        //
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"电话号码不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
        return false;
    }
    
    if ([_serverTimeLong length]<= 0) {
        //
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"服务时长不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
        return false;
    }
    
    if ([_serverTrueName length]<= 0) {
        //
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"姓名不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        
        return false;
    }
    
    return true;
    
}

- (NSDateFormatter *)setForMatter:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return formatter;
}
#pragma mark - 默认格式 - 当前时间 - @"yyyy-MM-dd HH:mm"
- (NSString *)currentDefaultTime {
    return [self forMatter:@"yyyy-MM-dd HH" date:[[NSDate date]dateByAddingTimeInterval:3600]];
}
#pragma mark - 自定义格式 将 时间 转换 字符串
- (NSString *)forMatter:(NSString *)matter date:(NSDate *)date {
    return [[self setForMatter:matter] stringFromDate:date];
}


-(void)sendPostToServer
{
    if (![self checkData]) {
        return;
    }
    if ([FrontHelper getNetStatus] == 0) {
        [SVProgressHUD showErrorWithStatus_custom:@"无网络连接" duration:1.0];
        return;
    }
    
    [SVProgressHUD showWithStatus:@"下单中..." maskType:SVProgressHUDMaskTypeClear];
    
    NSString *token = [[NSString alloc] init];
    
    token = [FrontHelper tokenController:@"order" action:@"index"];
    
    //www.niuhome.com/appapi
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/order"];
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:_serverTrueName forKey:@"contacts"];
    [request addPostValue:_serverTimeLong forKey:@"duration"];
    [request addPostValue:_serverTimeLong forKey:@"product_id"];
    [request addPostValue:_serverTel forKey:@"mobile"];
    [request addPostValue:_serverLocal forKey:@"address"];
    [request addPostValue:_serverType forKey:@"service_type"];
    [request addPostValue:_oderType forKey:@"order_type"];
    //_oderType==1的时候是小时达，要发送当前时间的后一个小时
    if([_oderType isEqualToString:@"1"])
    {
        NSString *date = [[NSString alloc] initWithString:[[self currentDefaultTime] substringToIndex:10]];
        NSString *work_times = [NSString stringWithFormat:@"%@:00",[[self currentDefaultTime] substringFromIndex:11]];
        [request addPostValue:date forKey:@"date"];
        [request addPostValue:work_times forKey:@"work_times"];
    }else
    {

        NSString *date = [[NSString alloc] initWithString:[_serverDate substringToIndex:10]];
        NSString *work_times =  [[NSString alloc] initWithString:[_serverDate substringFromIndex:11]];
        [request addPostValue:date forKey:@"date"];
        [request addPostValue:work_times forKey:@"work_times"];
    }
    [request addPostValue:@"1" forKey:@"sex"];
    [request addPostValue:token forKey:@"token"];
    [request addPostValue:[FrontHelper getLoginUid] forKey:@"uid"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request setTag:10011];


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

- (void)requestFinished:(ASIFormDataRequest *)request
{
    NSLog(@"%@",request.responseString);
    if ([_delegate respondsToSelector:@selector(sendOrderFinish:)])
    {
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSMutableDictionary *dict = [jsonParser objectWithString:request.responseString];

        NSError *err;
        if (err == nil||dict!= nil)
        {
            
            [_delegate sendOrderFinish:dict];
        }
        else
        {
            [_delegate orderFailed];
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
