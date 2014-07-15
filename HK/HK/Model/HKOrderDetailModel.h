//
//  HKOrderDetailModel.h
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "FrontHelper.h"
#import "SVProgressHUD.h"
@protocol HKOrderDetailModelDelegate <NSObject>

@required

-(void)orderDetailRequestFinish:(NSDictionary *)dic;

@end

@interface HKOrderDetailModel : NSObject<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) NSString *orderId;

@property (nonatomic,assign) id<HKOrderDetailModelDelegate> delegate;

-(id)initWithMobile:(NSString *)mobile orderId:(NSString *)oid;
-(void)postToServer;

@end
