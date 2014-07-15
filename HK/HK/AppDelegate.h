//
//  AppDelegate.h
//  HK
//
//  Created by 马涛 on 14-4-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "HKTabBarController.h"
#import "FrontHelper.h"
#import "BMapKit.h"
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate,BMKGeneralDelegate>
{
}


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HKTabBarController *tab;
@property (nonatomic,strong) Reachability *hostReach;

@end
