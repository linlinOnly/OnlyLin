//
//  HKCommentModel.h
//  HK
//
//  Created by 马涛 on 14-5-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "FrontHelper.h"
#import "SVProgressHUD.h"

@protocol HKCommentModelDelegate <NSObject>

@required

-(void)commentFinish:(NSDictionary *)dic;

-(void)commentFailed;

@end

@interface HKCommentModel : NSObject

@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *comment;
@property (nonatomic,strong) NSString *order_id;

@property (nonatomic,assign) id<HKCommentModelDelegate> delegate;

-(void)postToServer;
-(id)initWithOrderId:(int)orderId Status:(int)status Comment:(NSString *)comment;

@end
