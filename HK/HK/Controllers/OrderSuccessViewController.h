//
//  OrderSuccessViewController.h
//  HK
//
//  Created by QiMengJin on 14-7-15.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderSuccessViewController : UIViewController

//@property (nonatomic, strong) id data;
@property (nonatomic, copy) NSString * servertype;
@property (nonatomic, copy) NSString * balancedate;
@property (nonatomic, copy) NSString * orderId;
@property (nonatomic, copy) NSString * address;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * telphone;

@end
