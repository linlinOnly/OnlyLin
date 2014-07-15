//
//  HKOrderModel.h
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "FrontHelper.h"
#import "SVProgressHUD.h"
@protocol HKOrderModelDelegate <NSObject>

@required

-(void)sendOrderFinish:(NSDictionary *)dic;
-(void)orderFailed;
@end

@interface HKOrderModel : NSObject<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString* serverDate;
@property (nonatomic,strong) NSString* serverLocal;
@property (nonatomic,strong) NSString* serverTimeLong;
@property (nonatomic,strong) NSString* serverTrueName;
@property (nonatomic,strong) NSString* serverTel;
@property (nonatomic,strong) NSString* serverType;
@property (nonatomic,strong) NSString* oderType;


@property (nonatomic,strong) id<HKOrderModelDelegate> delegate;

-(id)initWithDate:(NSString *)date local:(NSString *)local tel:(NSString *)tel production_id:(NSString *)production_id name:(NSString *)name serverType:(NSString*)serverType oderType:(NSString*)oderType;

-(void)sendPostToServer;

@end
