//
//  HKorderDetailTableController.h
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HKPayTableViewCell.h"
#import "HKCommentTableViewCell.h"
#import "HKOrderInfoTableViewCell.h"
#import "HKKeeperInfo2TableViewCell.h"
#import "HKEOInfoTableViewCell.h"

#import "HKOrderDetailInfoModel.h"

@interface HKorderDetailTableController : UITableViewController

//@property (nonatomic,strong) NSDictionary *dic;

@property (nonatomic,strong) HKOrderDetailInfoModel *model;

- (id)initWithStyle:(UITableViewStyle)style andDic:(NSDictionary *)dic;

@end
