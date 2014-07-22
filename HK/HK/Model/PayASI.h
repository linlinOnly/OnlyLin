//
//  PayASI.h
//  HK
//
//  Created by QiMengJin on 14-7-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "FrontHelper.h"
#import "SVProgressHUD.h"


@protocol PayASIDelegate <NSObject>


@required

-(void)finishpay:(NSDictionary *)dic;
-(void)payFailed;
@end

@interface PayASI : NSObject<ASIHTTPRequestDelegate>
@property (nonatomic,strong) NSString *order_id;

@property (nonatomic,assign) id<PayASIDelegate> delegate;
-(void)postPayshangmenModel:(NSString*)type;
@end
