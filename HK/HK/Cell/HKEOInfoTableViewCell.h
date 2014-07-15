//
//  HKEOInfoTableViewCell.h
//  HK
//
//  Created by 马涛 on 14-5-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKEOInfoView.h"
#import "HKOrderDetailInfoModel.h"
@interface HKEOInfoTableViewCell : UITableViewCell

@property (nonatomic,strong) HKEOInfoView *eoInfo;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dic:(HKOrderDetailInfoModel *)dic;
@end
