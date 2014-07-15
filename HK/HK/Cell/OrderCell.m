//
//  OrderCell.m
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _infoView = [[HKKeeperInfoView alloc] initWithFrame:CGRectMake(10, 15, 300, 85)];
        
        [self addSubview:_infoView];
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [self setBackgroundColor:BGColor];
        
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


-(void)fillWithItemModel:(HKOrderItemModel *)model
{    
    _infoView.nameLabel.text = model.serverName;
    _infoView.orderStatusLabel.text = model.order_status == 1?@"已确认":@"未确认";
    [_infoView.photoView setImage:[UIImage imageNamed:@"ur.png"]];
    
//    NSLog(@"Myaddress =  %@",model.address);
    
    _infoView.orderTimeLabel.text = model.address;// [FrontHelper timeStampToDate:model.create_time];
    
    
    if ([model.order_type isEqualToString:@"1"]) {
        _infoView.serverTimeLabel.text = @"即时订单";
    }
    else
    {
    
        _infoView.serverTimeLabel.text = [model.date stringByAppendingFormat:@" %@",model.work_times];  //[model.work_times isEqual:[NSNull null]]?@" ":model.work_times];
    }
//    NSLog(@"model %@",model);
    
    _infoView.tel = @"10000";
}


@end
