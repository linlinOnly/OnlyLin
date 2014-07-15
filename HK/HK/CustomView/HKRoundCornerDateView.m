//
//  HKRoundCornerDateView.m
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerDateView.h"

@implementation HKRoundCornerDateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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


- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame title:title];
    if (self) {
        //
        
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 30, 300, 32)];
        [_btn setBackgroundColor:VBGColor];
        [_btn setTitle:@"请选择服务时间" forState:UIControlStateNormal];        
        
        [_btn.titleLabel setTextColor:[UIColor blackColor]];
        
        [_btn addTarget:self action:@selector(checkTime) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn];
        
        _actionSheet = [[HKDateActionSheet alloc] initWithTitle:@"请选择上门服务时间" delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        
        _actionSheet.hkdelegate = self;
        [_actionSheet setActionSheetStyle:UIActionSheetStyleDefault];
        
        
    }
    return self;
}

-(void)checkTime
{
    [_btn.titleLabel setTextColor:[UIColor blackColor]];
    [_actionSheet showInView:self];
}

-(void)sure:(NSString *)date
{
    _date = date;
    [_btn setTitle:[NSString stringWithFormat:@"%@",date] forState:UIControlStateNormal];
    [_btn.titleLabel setTextColor:[UIColor blackColor]];
}

-(void)cancle
{
    [_btn.titleLabel setTextColor:[UIColor blackColor]];
}




@end
