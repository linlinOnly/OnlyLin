//
//  HKInfoModel.h
//  HK
//
//  Created by 马涛 on 14-5-3.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HKInfoModel : NSObject

@property (nonatomic,assign) int status;


-(id)initWithDic:(NSDictionary *)dic;

@end
