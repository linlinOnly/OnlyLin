//
//  FrontHelper.m
//  HK
//
//  Created by 马涛 on 14-4-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "FrontHelper.h"


@implementation FrontHelper

+(BOOL)checkLogin
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (![[ud objectForKey:@"loginUser"] isEqualToString:@""]&&[ud objectForKey:@"loginUser"]) {
        return true;
    }
//    return true;
    return false;
}

+(void)setLoginInfo:(NSString *)tel
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:tel forKey:@"loginUser"];
    [ud synchronize];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"kLoginStatusChangeNotification" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"loginStatus", nil ]];
}

+(NSString *)getLoginInfo
{
    if ([self checkLogin]) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        return [ud objectForKey:@"loginUser"];
    }
    return @"unknow";
}


+(void)setLoginUid:(NSString *)uid
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:uid forKey:@"loginUid"];
    [ud synchronize];
}

+(NSString *)getLoginUid
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud objectForKey:@"loginUid"];
}

+(NSString *)tokenController:(NSString *)controller action:(NSString *)action
{
    NSString *token = [[NSString alloc] initWithFormat:@"%@%@%@%@",@"83ED5F4E02F32EB3827521BCF9E0AA83",controller,action,[self getDate]];
    
    return [token md5HexDigest];
}



+(NSString *)getDate
{
    
    NSDate *  date=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMdd"];
    
    return [dateformatter stringFromDate:date];
}

+(NSMutableArray *)weekInStr
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    
    NSString *day = [[NSString alloc] init];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    
    NSTimeInterval dayCount = 24*60*60;
    

    int i;
    
    for (i = 1; i <= 7; i ++) {
        //
        
        NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:dayCount*i];
        day = [dateformatter stringFromDate:tomorrow];
        
        
        [arr addObject:day];
    }
    
    return arr;
}

+(void)callService:(NSString *)num
{
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",num]];
    if (!phoneCallWebView) {
        phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    }
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
}

+(void)logout
{
    if ([self checkLogin]) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:@"" forKey:@"loginUser"];
        [ud synchronize];
        
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center postNotificationName:@"kLoginStatusChangeNotification" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"0",@"loginStatus", nil ]];
    }
}

+(NSDate*) convertDateFromString:(NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy年MM月dd日 hh时mm分"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}


+(NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}


+(NSString *)timeStampToDate:(NSString *)timeStamp
{
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStamp intValue]];
    return [self stringFromDate:confromTimesp];
}

+(void)setNetStatus:(NSString *)status
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:status forKey:@"netStatus"];
    [ud synchronize];
}

+(int)getNetStatus
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [[ud objectForKey:@"netStatus"] intValue];
}

@end
