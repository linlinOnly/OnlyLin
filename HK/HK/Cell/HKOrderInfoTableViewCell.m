//
//  HKOrderInfoTableViewCell.m
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKOrderInfoTableViewCell.h"

@implementation HKOrderInfoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dic:(HKOrderDetailInfoModel *)dict
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        

        
        _infoView = [[HKOrderInfoRoundCornerView alloc] initWithFrame:CGRectMake(10, 20, 300, 140) title:@"订单详情" andData:dict];
        [self addSubview:_infoView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = BGColor;
        
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
