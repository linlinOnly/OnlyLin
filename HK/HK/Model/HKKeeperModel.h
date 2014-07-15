//
//  HKKeeperModel.h
//  HK
//
//  Created by 马涛 on 14-4-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKKeeperModel : NSObject

@property (nonatomic,strong) NSString *photoUrl;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *serverStatus;
@property (nonatomic,strong) NSString *orderTime;
@property (nonatomic,strong) NSString *serverTime;
@property (nonatomic,strong) NSString *tel;
@property (nonatomic,strong) NSString *sureTime;


-(id)initWithPhoto:(NSString *)url name:(NSString *)name serverStatus:(NSString *)serverStatus orderTime:(NSString *)orderTime serverTime:(NSString *)serverTime tel:(NSString *)tel sureTime:(NSString *)sureTime;

-(id)initWithDic:(NSDictionary *)dic;

@end
