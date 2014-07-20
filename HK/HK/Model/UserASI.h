//
//  UserASI.h
//  HK
//
//  Created by QiMengJin on 14-7-19.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "FrontHelper.h"
#import "SVProgressHUD.h"


@protocol UserASIDelegate <NSObject>


@required

-(void)finishuser:(NSDictionary *)dic;
-(void)logFailed;
@end

@interface UserASI : NSObject<ASIHTTPRequestDelegate>
@property (nonatomic,strong) NSString *uid;

@property (nonatomic,assign) id<UserASIDelegate> delegate;
-(void)postUserModel;
@end
