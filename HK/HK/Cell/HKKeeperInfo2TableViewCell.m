//
//  HKKeeperInfo2TableViewCell.m
//  HK
//
//  Created by 马涛 on 14-5-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKKeeperInfo2TableViewCell.h"

@implementation HKKeeperInfo2TableViewCell

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
        _keeperInfoView = [[HKKeeperInfo2View alloc] initWithFrame:CGRectMake(10, 20, 300, 110) title:@"阿姨与门店" andData:dic];
        
        [self addSubview:_keeperInfoView];
        
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
