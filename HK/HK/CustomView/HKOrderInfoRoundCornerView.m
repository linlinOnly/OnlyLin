//
//  HKOrderInfoRoundCornerView.m
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKOrderInfoRoundCornerView.h"

@implementation HKOrderInfoRoundCornerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame title:(NSString *)title andData:(HKOrderDetailInfoModel *)dic
{
    self = [super initWithFrame:frame title:title];
    if (self) {
        //
        
        _statusTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 66, 18)];
        _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(77, 25, 160, 18)];
        
        
        _orderNumTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 48, 60, 14)];
        _orderNum = [[UILabel alloc] initWithFrame:CGRectMake(73, 48, 200, 14)];
        _orderTimeTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 64, 60, 14)];
        _orderTime = [[UILabel alloc] initWithFrame:CGRectMake(73, 64, 160, 14)];
        
        _typeTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 60, 14)];
        _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(73, 80, 160, 14)];
        _serverTimeTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 96, 60, 14)];
        _serverTime = [[UILabel alloc] initWithFrame:CGRectMake(73, 96, 160, 14)];
        _serverContentTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 112, 60, 14)];
        _serverContent = [[UILabel alloc] initWithFrame:CGRectMake(73, 112, 160, 14)];
        
        
        
        _statusTitleLabel.textColor = MYREDColor;
        _statusLabel.textColor = MYREDColor;
        
        _statusTitleLabel.text = @"订单状态:";
        _orderNumTitle.text = @"订单编号:";
        _orderTimeTitle.text = @"预约时间:";
        _typeTitleLabel.text = @"预约工种:";
        _serverTimeTitle.text = @"服务时间:";
        _serverContentTitle.text = @"服务内容:";
        
        _statusLabel.text = dic.order_status?@"已确认":@"未确认";
        _orderNum.text = dic.order_sn;
        _orderTime.text = [FrontHelper timeStampToDate:dic.create_time] ;
        _typeLabel.text = dic.order_type;
        _serverTime.text = dic.serverDate;
        _serverContent.text = dic.remarks;
        
        _statusTitleLabel.font = [UIFont systemFontOfSize:14];
        _statusLabel.font = [UIFont systemFontOfSize:14];
        _orderTimeTitle.font = [UIFont systemFontOfSize:12];
        _orderTime.font = [UIFont systemFontOfSize:12];
        _orderNumTitle.font = [UIFont systemFontOfSize:12];
        _orderNum.font = [UIFont systemFontOfSize:12];
        _typeTitleLabel.font = [UIFont systemFontOfSize:12];
        _typeLabel.font = [UIFont systemFontOfSize:12];
        _serverTime.font = [UIFont systemFontOfSize:12];
        _serverTimeTitle.font = [UIFont systemFontOfSize:12];
        _serverContentTitle.font = [UIFont systemFontOfSize:12];
        _serverContent.font = [UIFont systemFontOfSize:12];
        
        _statusTitleLabel.backgroundColor = [UIColor clearColor];
        _statusLabel.backgroundColor = [UIColor clearColor];
        _orderTimeTitle.backgroundColor = [UIColor clearColor];
        _orderTime.backgroundColor = [UIColor clearColor];
        _orderNum.backgroundColor = [UIColor clearColor];
        _orderNumTitle.backgroundColor = [UIColor clearColor];
        _typeTitleLabel.backgroundColor = [UIColor clearColor];
        _typeLabel.backgroundColor = [UIColor clearColor];
        _serverTime.backgroundColor = [UIColor clearColor];
        _serverTimeTitle.backgroundColor = [UIColor clearColor];
        _serverContent.backgroundColor = [UIColor clearColor];
        _serverContentTitle.backgroundColor = [UIColor clearColor];
                
        [self addSubview:_statusTitleLabel];
        [self addSubview:_statusLabel];
        [self addSubview:_orderTimeTitle];
        [self addSubview:_orderTime];
        [self addSubview:_orderNumTitle];
        [self addSubview:_orderNum];
        [self addSubview:_typeTitleLabel];
        [self addSubview:_typeLabel];
        [self addSubview:_serverTime];
        [self addSubview:_serverTimeTitle];
        [self addSubview:_serverContentTitle];
        [self addSubview:_serverContent];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
