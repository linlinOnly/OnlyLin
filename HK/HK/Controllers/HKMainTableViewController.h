//
//  HKMainTableViewController.h
//  HK
//
//  Created by 马涛 on 14-4-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrontHelper.h"

#import "HKLoginViewController.h"
#import "HKOrderDetailViewController.h"
#import "HKorderDetailTableController.h"
#import "HKOrderDetail2TableViewController.h"
#import "OrderCell.h"
#import "OrderExtCell.h"

#import "HKOrderListModel.h"
#import "HKOrderItemModel.h"
#import "HKOrderDetailModel.h"
#import "HKOrderDetailInfoModel.h"

#import "ASIFormDataRequest.h"
#import "SVProgressHUD.h"
#import "UserASI.h"

@interface HKMainTableViewController : UIViewController<HKOrderListModelDelegate,HKOrderDetailModelDelegate,UserASIDelegate> {
    
    BOOL isReload;
    
}
@property (nonatomic,strong) UIBarButtonItem *rightButton;
@property (nonatomic,strong) NSMutableArray*orderList;
@property (nonatomic,strong) HKOrderListModel *listModel;
@property (nonatomic,strong) HKOrderItemModel *itemModel;
@property (nonatomic,strong) HKorderDetailTableController  *detailVC;
@property (nonatomic,strong) HKOrderDetail2TableViewController  *detail2VC;
@property (nonatomic,strong) UILabel * balancelabel;
@property (nonatomic,strong) UILabel * addressTfd;
@property (nonatomic,strong) UIScrollView *bottomScorllView;
@property (nonatomic, assign) int bottomheight_int;

@end
