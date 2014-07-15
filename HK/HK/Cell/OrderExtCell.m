//
//  OrderExtCell.m
//  HK
//
//  Created by 马涛 on 14-4-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OrderExtCell.h"

@implementation OrderExtCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _infoView = [[HKKeeperInfoExtView alloc] initWithFrame:CGRectMake(10, 15, 300, 120)];
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
    
//    [_infoView fillLayouts:model];
    
    _infoView.nameLabel.text = model.serverName;
    _infoView.orderStatusLabel.text = model.order_status == 1?@"已确认":@"未确认";
    [_infoView.photoView setImage:[UIImage imageNamed:@"default_photo.png"]];
    _infoView.orderTimeLabel.text = model.address;// [FrontHelper timeStampToDate:model.address];
    
    
    if ([model.order_type isEqualToString:@"1"]) {
        _infoView.serverTimeLabel.text = @"即时订单";
    }
    else
    {
        _infoView.serverTimeLabel.text = [model.date stringByAppendingFormat:@" %@",model.work_times];
    }
    
        
    if (![model.c_time isEqualToString:@""]) {
        
        [_infoView.feedBackBtn setText:@"已点评"];
    }
    else
    {
        [_infoView.feedBackBtn setText:@"点评"];
    }
    
    
    if (model.pay_status == 1) {
        [_infoView.payBtn setText:@"已付款"];

        if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
        {
            //7.0之后生效
            _infoView.payBtn.layer.backgroundColor = BGColor.CGColor;
        }
        else
        {
            //7.0 之前生效
            _infoView.payBtn.backgroundColor = BORDERColor;
        }
        [_infoView.payBtn setTextColor:[UIColor blackColor ]];
    }
    else
    {
        [_infoView.payBtn setText:@"立即付款"];
//        _infoView.payBtn.backgroundColor = MYREDColor;
        
        if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
        {
            //7.0之后生效
            _infoView.payBtn.layer.backgroundColor = [UIColor redColor].CGColor;
        }
        else
        {
            //7.0 之前生效
            _infoView.payBtn.backgroundColor = [UIColor redColor];
        }
        [_infoView.payBtn setTextColor:[UIColor whiteColor]];
    }
    
    
    _infoView.tel = model.serverMobile;
}

@end
