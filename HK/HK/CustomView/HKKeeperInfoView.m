//
//  HKKeeperInfoView.m
//  HK
//
//  Created by 马涛 on 14-4-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKKeeperInfoView.h"

@implementation HKKeeperInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        self.layer.cornerRadius  = 6.0;
        self.layer.borderWidth = 1;
        self.layer.borderColor = BORDERColor.CGColor;
        self.backgroundColor = VBGColor;
    
        _photoView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 52, 63)];
//        _photoView.backgroundColor = [UIColor purpleColor];
        
        _nameTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 68, 15)];
        _orderStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 25, 68, 15)];
        _orderTitleTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 42, 60, 15)];
        _serverTitleTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 60, 60, 15)];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(138, 10, 110, 15)];
        _dieTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(138, 23, 110, 15)];
        _orderTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 42, 160, 15)];
        _serverTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 60, 110, 15)];
        
        
        
        _nameTitleLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _orderStatusLabel.backgroundColor = [UIColor clearColor];
        _orderTitleTimeLabel.backgroundColor = [UIColor clearColor];
        _serverTimeLabel.backgroundColor = [UIColor clearColor];
        _dieTimeLabel.backgroundColor = [UIColor clearColor];
        _orderTimeLabel.backgroundColor = [UIColor clearColor];
        _serverTitleTimeLabel.backgroundColor = [UIColor clearColor];
        
        _telBtn = [[UIButton alloc] initWithFrame:CGRectMake(228, 60, 80, 15)];
        [_telBtn setTitle:@"拨打电话" forState:UIControlStateNormal];
        
        [_telBtn setTitleColor:MYBLUEGColor forState:UIControlStateNormal];
        [_telBtn.titleLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        [_telBtn addTarget:self action:@selector(callKP) forControlEvents:UIControlEventTouchUpInside];
        _tel = [[NSString alloc] init];
        
        
        [_nameTitleLabel setText:@"阿姨姓名:"];
        [_nameTitleLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:14]];
        [_orderTitleTimeLabel setText:@"服务地址:"];
        [_orderTitleTimeLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        [_serverTitleTimeLabel setText:@"服务时间:"];
        [_serverTitleTimeLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        [_orderStatusLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        [_orderStatusLabel setTextColor:[UIColor redColor]];
        
        [_nameLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:14]];
        [_dieTimeLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        [_orderTimeLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        [_serverTimeLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:12]];
        
        
        [self addSubview:_photoView];
        [self addSubview:_nameTitleLabel];
        [self addSubview:_orderStatusLabel];
        [self addSubview:_orderTitleTimeLabel];
        [self addSubview:_serverTitleTimeLabel];
        [self addSubview:_nameLabel];
        [self addSubview:_dieTimeLabel];
        [self addSubview:_orderTimeLabel];
        [self addSubview:_serverTimeLabel];
        [self addSubview:_telBtn];
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
-(id)initWithFrame:(CGRect)frame KeeperInfo:(HKKeeperModel *)keeper
{
    self = [self initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setItemsValues:keeper];
        
    }
    return self;
}


-(void)setItemsValues:(HKKeeperModel *)ki
{
    [_photoView setImageWithURL:[NSURL URLWithString:ki.photoUrl] placeholderImage:[UIImage imageNamed:@"ur.png"]];
//    [_photoView setImage:[UIImage imageNamed:@"ur.png"]];
    [_orderStatusLabel setText:[self getOrderStatus:ki.serverStatus]];
    [_nameLabel setText:ki.name];
    [_dieTimeLabel setText:ki.sureTime];  // 下单时间 减去 当前时间...  2h 倒计时   ||   确认时间
    [_orderTimeLabel setText:ki.orderTime];
    [_serverTimeLabel setText:ki.serverTime];
    
    
}


-(NSString *)getOrderStatus:(NSString *)status
{
    
    if ([status isEqual:@"1"]) {
        return @"已确认";
    }
    return @"未确认";
}

-(void)callKP
{
//    NSLog(@"_tel %@",_tel)  ;
    [FrontHelper callService:@"4000018180"];
}
@end
