//
//  HKLoginModel.h
//  HK
//
//  Created by 马涛 on 14-4-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "FrontHelper.h"
#import "SVProgressHUD.h"
@protocol HKLoginModelDelegate <NSObject>

@required

-(void)finishLogin:(NSDictionary *)dic;
-(void)loginFailed;

-(void)finishGetCode:(NSDictionary *)dic;
-(void)getCodeFailed;
@end

@interface HKLoginModel : NSObject<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *telStr;
@property (nonatomic,strong) NSString *codeStr;

@property (nonatomic,assign) id<HKLoginModelDelegate> delegate;


-(void)getCodeByRequest;
-(void)loginByRequest;

@end
