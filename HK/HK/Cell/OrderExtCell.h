//
//  OrderExtCell.h
//  HK
//
//  Created by 马涛 on 14-4-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKKeeperInfoExtView.h"
#import "HKOrderItemModel.h"
#import "FrontHelper.h"
@interface OrderExtCell : UITableViewCell

@property (nonatomic,strong) HKKeeperInfoExtView *infoView;

-(void)fillWithItemModel:(HKOrderItemModel *)model;

@end
