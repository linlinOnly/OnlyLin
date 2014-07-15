//
//  HKEOInfoTableViewCell.m
//  HK
//
//  Created by 马涛 on 14-5-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKEOInfoTableViewCell.h"

@implementation HKEOInfoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier dic:(HKOrderDetailInfoModel *)dic
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _eoInfo = [[HKEOInfoView alloc] initWithFrame:CGRectMake(10, 20, 300, 120) title:@"我的情况" andData:dic];
        
        self.backgroundColor = BGColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubview:_eoInfo];
        
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
