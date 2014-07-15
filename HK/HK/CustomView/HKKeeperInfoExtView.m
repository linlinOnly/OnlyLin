//
//  HKKeeperInfoExtView.m
//  HK
//
//  Created by 马涛 on 14-4-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKKeeperInfoExtView.h"

@implementation HKKeeperInfoExtView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
                
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 85, 300, 1)];
    
        [line setBackgroundColor:BORDERColor];
        
        
        _againBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 92, 80, 20)];
        _payBtn = [[UILabel alloc] initWithFrame:CGRectMake(110, 92, 80, 20)];
        _feedBackBtn = [[UILabel alloc] initWithFrame:CGRectMake(210, 92, 80, 20)];
        
        _againBtn.layer.cornerRadius = 3.0;
        _payBtn.layer.cornerRadius = 3.0;
        _feedBackBtn.layer.cornerRadius = 3.0;
        

        
        if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
        {
            //7.0之后生效
            _payBtn.layer.backgroundColor = BGColor.CGColor;
            _feedBackBtn.layer.backgroundColor = BGColor.CGColor;
        }
        else
        {
            //7.0 之前生效
            _payBtn.backgroundColor = BGColor;
            _feedBackBtn.backgroundColor = BGColor;
        }
        
        
        
        [_againBtn setBackgroundColor:BGColor];
        [_againBtn setTitle:@"再次服务" forState:UIControlStateNormal];
        [_againBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_againBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_againBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        _payBtn.text = @"立即付款";
        [_payBtn  setFont:[UIFont systemFontOfSize:12]];
        [_payBtn setTextAlignment:NSTextAlignmentCenter];
        [_payBtn setTextColor:[UIColor blackColor]];
        
        
        _feedBackBtn.text = @"点评";
        [_feedBackBtn  setFont:[UIFont systemFontOfSize:12]];
        [_feedBackBtn setTextAlignment:NSTextAlignmentCenter];
        
        
        
        [self addSubview:line];
        [self addSubview:_againBtn];
        [self addSubview:_payBtn];
        [self addSubview:_feedBackBtn];
        
        
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

-(void)fillLayouts:(HKOrderItemModel *)model
{
    
}

@end
