//
//  HKEOInfoView.m
//  HK
//
//  Created by 马涛 on 14-5-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKEOInfoView.h"

@implementation HKEOInfoView

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
        
        
        _nameTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 25, 60, 20)];
        _name = [[UILabel alloc] initWithFrame: CGRectMake(75, 25, 80, 20)];
        _telTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 60, 20)];
        _tel = [[UILabel alloc] initWithFrame:CGRectMake(75, 50, 80, 20)];
        _addressTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 75, 60, 20)];
        _address = [[UITextView alloc] initWithFrame:CGRectMake(70, 70 , 210, 40)];
        
        _nameTitle.backgroundColor = [UIColor clearColor];
        _name.backgroundColor = [UIColor clearColor];
        _telTitle.backgroundColor = [UIColor clearColor];
        _tel.backgroundColor = [UIColor clearColor];
        _address.backgroundColor = [UIColor clearColor];
        _addressTitle.backgroundColor = [UIColor clearColor];
        
        
        UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 48, 280, 1)];
        UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 73, 280, 1)];
        
        
        line1.backgroundColor  =  BORDERColor;
        line2.backgroundColor = BORDERColor;
        
        
        _address.editable = false;
        _address.scrollEnabled = false;
        _address.backgroundColor = [UIColor clearColor];
        
        
        
        
        _nameTitle.font = [UIFont systemFontOfSize:12];
        _name.font = [UIFont systemFontOfSize:12];
        _telTitle.font = [UIFont systemFontOfSize:12];
        _tel.font = [UIFont systemFontOfSize:12];
        _address.font = [UIFont systemFontOfSize:12];
        _addressTitle.font = [UIFont systemFontOfSize:12];
        
        
        
        
        _nameTitle.text = @"联系人:";
        _telTitle.text = @"联系电话:";
        _addressTitle.text = @"联系地址:";
        
        _name.text = dic.contacts;
        _tel.text = dic.mobile;
        _address.text = dic.address;
        
        
        [self addSubview:line1];
        [self addSubview:line2];
        [self addSubview:_nameTitle];
        [self addSubview:_name];
        [self addSubview:_telTitle];
        [self addSubview:_tel];
        [self addSubview:_addressTitle];
        [self addSubview:_address];
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
