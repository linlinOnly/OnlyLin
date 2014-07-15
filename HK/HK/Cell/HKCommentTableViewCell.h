//
//  HKCommentTableViewCell.h
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HKCommentView.h"

#import "HKOrderDetailInfoModel.h"
#import <QuartzCore/QuartzCore.h>



@interface HKCommentTableViewCell : UITableViewCell

@property (nonatomic,strong) HKCommentView *commentView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andDic:(HKOrderDetailInfoModel *)model;

@end
