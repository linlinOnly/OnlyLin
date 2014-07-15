//
//  OrderCell.h
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKKeeperInfoView.h"
#import "HKOrderItemModel.h"
#import "FrontHelper.h"
@interface OrderCell : UITableViewCell



@property (nonatomic,strong) HKKeeperInfoView *infoView;

-(void)fillWithItemModel:(HKOrderItemModel *)model;

@end
