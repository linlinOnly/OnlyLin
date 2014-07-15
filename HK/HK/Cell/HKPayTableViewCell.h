//
//  HKPayTableViewCell.h
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKRoundCornerPriceView.h"
@interface HKPayTableViewCell : UITableViewCell

@property (nonatomic,strong) HKRoundCornerPriceView *payView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andDic:(HKOrderDetailInfoModel *)model;

@end
