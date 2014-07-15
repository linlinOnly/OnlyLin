//
//  HKKeeperInfo2View.m
//  HK
//
//  Created by 马涛 on 14-5-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKKeeperInfo2View.h"

@implementation HKKeeperInfo2View

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
        
        _tempMobile = [[NSString alloc] init];
        
        _tempMobile = dic.employeeMobile;

        // Initialization code
        _photo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 52, 63)];
        
        _photo.image = [UIImage imageNamed:@"ur.png"];
//        _photo.backgroundColor = [UIColor purpleColor];
        
        _storeLabel = [[UILabel alloc] initWithFrame:CGRectMake(67, 30, 220, 20)];
        _nameTitle = [[UILabel alloc] initWithFrame:CGRectMake(67, 62, 54, 14)];
        _name = [[UILabel alloc] initWithFrame:CGRectMake(126, 62, 80, 14)];
        
        _telTitle = [[UILabel alloc] initWithFrame:CGRectMake(67, 80, 54, 14)];
        _tel = [[UILabel alloc] initWithFrame:CGRectMake(126, 80, 80, 14)];
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(230, 80, 65, 14)];
        
        
        
        _storeLabel.text = @"单位名称：牛家帮服务";
        _storeLabel.font = [UIFont systemFontOfSize:14];
        _storeLabel.backgroundColor = [UIColor clearColor];
        
        _nameTitle.text = @"阿姨姓名:";
        _name.backgroundColor = [UIColor clearColor];
        _nameTitle.font = [UIFont systemFontOfSize:12];
        _nameTitle.backgroundColor = [UIColor clearColor];
        _telTitle.text = @"联系方式:";
        _telTitle.backgroundColor = [UIColor clearColor];
        _telTitle.font = [UIFont systemFontOfSize:12];
        _tel.backgroundColor = [UIColor clearColor];
        _name.font = [UIFont systemFontOfSize:12];
        _tel.font = [UIFont systemFontOfSize:12];
        
        [_btn setTitle:@"拨打电话" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(callService) forControlEvents:UIControlEventTouchUpInside];
        
        [_btn setBackgroundColor:[UIColor clearColor]];
        [_btn setTitleColor:MYBLUEGColor forState:UIControlStateNormal];
        [_btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        
        _name.text = dic.employeeName;
        _tel.text = dic.employeeMobile;

        
        
        [self addSubview:_photo];
        [self addSubview:_storeLabel];
        [self addSubview:_nameTitle];
        [self addSubview:_name];
        [self addSubview:_telTitle];
        [self addSubview:_tel];
        [self addSubview:_btn];
        
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


-(void)callService
{
    [FrontHelper callService:@"4000018180"];
}

@end
