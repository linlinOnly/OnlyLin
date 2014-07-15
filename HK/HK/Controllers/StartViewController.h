//
//  StartViewController.h
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKRoundCornerDateView.h"
#import "HKRoundCornerLocalView.h"
#import "HKRoundCornerTimeLongView.h"
#import "HKRoundCornerTelView.h"

#import "HKOrderModel.h"

#import "FrontHelper.h"

#import "HKOrderModel.h"

#import "HKLoginViewController.h"
#import "HKNavigationController.h"

#import "HKBaiduMapViewController.h"

#import "BMapKit.h"

#import "ASIFormDataRequest.h"

#import "SVProgressHUD.h"


@interface StartViewController : UIViewController<HKOrderModelDelegate,BMKMapViewDelegate,BMKSearchDelegate,ASIHTTPRequestDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIScrollView *bottomScorllView;

@property (nonatomic,strong) HKRoundCornerLocalView *localView;
@property (nonatomic,strong) HKRoundCornerDateView *dateView;
@property (nonatomic,strong) HKRoundCornerTimeLongView *timeLongView;
@property (nonatomic,strong) HKRoundCornerTelView *telView;

@property (nonatomic,strong) UIButton *submitBtn;


@property (nonatomic,strong) HKOrderModel *order;
@property (nonatomic,strong) BMKMapView *mapView;
@property (nonatomic,strong) BMKSearch* search;
@property (nonatomic,strong) NSString * order_type;

-(void)setmyframe:(BOOL)isHour;
@end
