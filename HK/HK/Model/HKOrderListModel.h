//
//  HKOrderListModel.h
//  HK
//
//  Created by 马涛 on 14-5-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "FrontHelper.h"

#import "SVProgressHUD.h"

@protocol HKOrderListModelDelegate <NSObject>

@required
-(void)sendOrderListFinish:(NSDictionary *)dic;

@end

@interface HKOrderListModel : NSObject<ASIHTTPRequestDelegate>

@property (nonatomic,strong) id<HKOrderListModelDelegate> delegate;
@property (nonatomic,strong) NSString *user;

-(void)sendPostToServer;

@end
