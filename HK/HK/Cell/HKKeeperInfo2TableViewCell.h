//
//  HKKeeperInfo2TableViewCell.h
//  HK
//
//  Created by 马涛 on 14-5-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKKeeperInfo2View.h"
#import "HKOrderDetailInfoModel.h"

@interface HKKeeperInfo2TableViewCell : UITableViewCell
@property (nonatomic,strong) HKKeeperInfo2View *keeperInfoView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dic:(HKOrderDetailInfoModel *)dic;

@end
