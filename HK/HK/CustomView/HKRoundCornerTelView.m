//
//  HKRoundCornerTelView.m
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerTelView.h"

@implementation HKRoundCornerTelView

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        UIImageView * imageview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"people"]];
        imageview.frame=CGRectMake(10, 10, 20, 20);
        [self addSubview:imageview];
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(kFrameSetRight(imageview)+4, 10, 80, 20)];
        [name setText:@"联系姓名"];
        name.backgroundColor = [UIColor clearColor];
        name.font = [UIFont systemFontOfSize:14];
        name.textColor=kColorFromRGB(0x755833);
        [self addSubview:name];
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(name)+10, 300, 1)];
        [line setBackgroundColor:BGColor];
        [self addSubview:line];
        
        
        UIImageView * imageview2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"telphone"]];
        imageview2.frame=CGRectMake(10, kFrameSetBottom(line)+10, 20, 20);
        [self addSubview:imageview2];
        UILabel *tel = [[UILabel alloc] initWithFrame:CGRectMake(kFrameSetRight(imageview2)+4, kFrameSetBottom(line)+10, 80, 20)];
        tel.font = [UIFont systemFontOfSize:14];
        [tel setText:@"联系电话"];
        tel.backgroundColor = [UIColor clearColor];
        tel.textColor=kColorFromRGB(0x755833);
        [self addSubview:tel];
        
        
        _nametf = [[UITextField alloc] initWithFrame:CGRectMake(100, 10, 190, 20)];
        _nametf.font = [UIFont systemFontOfSize:14];
        _nametf.keyboardType = UIKeyboardTypeDefault;
        _nametf.returnKeyType = UIReturnKeyDone;
        _nametf.backgroundColor = [UIColor clearColor];
        [_nametf setPlaceholder:@"请填写真实姓名"];
        [self addSubview:_nametf];
        
        _teltf = [[UITextField alloc] initWithFrame:CGRectMake(100, kFrameSetBottom(line)+10, 190, 20)];
        _teltf.keyboardType  = UIKeyboardTypeNamePhonePad;
        _teltf.backgroundColor = [UIColor clearColor];
        _teltf.returnKeyType = UIReturnKeyDone;
        _teltf.font = [UIFont systemFontOfSize:14];
        [self addSubview:_teltf];
        
        
        
    }
    return self;
}



@end
