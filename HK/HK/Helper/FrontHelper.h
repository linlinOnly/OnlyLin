//
//  FrontHelper.h
//  HK
//
//  Created by 马涛 on 14-4-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+MD5HexDigest.h"

static UIWebView *phoneCallWebView;

@interface FrontHelper : NSObject

+(BOOL)checkLogin;

+(void)setLoginInfo:(NSString *)tel;

+(NSString *)getLoginInfo;


+(NSString *)tokenController:(NSString *)controller action:(NSString *)action;

+(NSString *)getDate;

+(void)callService:(NSString *)num;

+(void)logout;

+(NSDate*) convertDateFromString:(NSString*)uiDate;

+(NSString *)stringFromDate:(NSDate *)date;

+(NSString *)timeStampToDate:(NSString *)timeStamp;

+(NSMutableArray *)weekInStr;

+(int)getNetStatus;

+(void)setNetStatus:(NSString *)status;

+(NSString *)getLoginUid;

+(void)setLoginUid:(NSString *)uid;

@end
