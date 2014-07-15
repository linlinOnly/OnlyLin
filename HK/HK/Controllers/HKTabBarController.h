//
//  HKTabBarController.h
//  HK
//
//  Created by 马涛 on 14-4-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HKNavigationController.h"
#import "HKMainTableViewController.h"
#import "HKInfoTableViewController.h"
//#import "HKStartTableViewController.h"

#import "StartViewController.h"


@interface HKTabBarController : UITabBarController {

    
}

@property (nonatomic,assign) int currentSelectedIndex;
@property (nonatomic,retain) NSMutableArray *buttons;

- (void)hideRealTabBar;
- (void)customTabBar;
- (void)selectedTab:(UIButton *)button;

@end
