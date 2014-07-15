//
//  HKPayTableViewCell.m
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKPayTableViewCell.h"

@implementation HKPayTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andDic:(HKOrderDetailInfoModel *)model
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _payView = [[HKRoundCornerPriceView alloc] initWithFrame:CGRectMake(10, 20, 300, 100) title:@"支付情况" andData:model];
        [self addSubview:_payView];
        
        self.backgroundColor = BGColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
