//
//  HKLogModel.h
//  HK
//
//  Created by 马涛 on 14-6-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "FrontHelper.h"
#import "SVProgressHUD.h"


@protocol HKLogModelDelegate <NSObject>

@required

-(void)finishLog:(NSDictionary *)dic;
-(void)logFailed;
@end

@interface HKLogModel : NSObject<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *orderSN;
@property (nonatomic,strong) NSString *uid;

@property (nonatomic,assign) id<HKLogModelDelegate> delegate;
-(id)initWithOrderSN:(NSString *)orderSn andUid:(NSString *)uid;
-(void)postLogModel;
@end
