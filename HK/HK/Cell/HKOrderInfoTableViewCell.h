//
//  HKOrderInfoTableViewCell.h
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKOrderInfoRoundCornerView.h"
#import "HKOrderDetailInfoModel.h"

@interface HKOrderInfoTableViewCell : UITableViewCell


@property (nonatomic,strong) HKOrderInfoRoundCornerView *infoView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dic:(HKOrderDetailInfoModel *)dict;
@end
