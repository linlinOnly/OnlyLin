//
//  HKRoundCornerLocalView.m
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerLocalView.h"

@implementation HKRoundCornerLocalView

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView * imageview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home"]];
        imageview.frame=CGRectMake(10, 10, 20, 20);
        [self addSubview:imageview];
        
        UILabel *labeltitle=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(imageview)+4, 10, 60, 20)];
        labeltitle.textColor=kColorFromRGB(0x755833);
        labeltitle.font=[UIFont systemFontOfSize:15];
        labeltitle.text=@"服务地址";
        [self addSubview:labeltitle];
        
        
        _tv = [[UITextField alloc] initWithFrame:CGRectMake(kFrameSetRight(labeltitle)+6, 4, 150, 32)];
        _tv.textAlignment = NSTextAlignmentLeft;
        _tv.returnKeyType = UIReturnKeyDone;
        _tv.delegate = self;
        _tv.font=[UIFont systemFontOfSize:13];
        _tv.adjustsFontSizeToFitWidth = YES;
        _tv.minimumFontSize = 5;
        _tv.textColor=[UIColor blackColor];
        _tv.placeholder = @"自动定位中...";
        [self addSubview:_tv];
        
        
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(kFrameSetRight(_tv)+10,0, 45, 42)];
        [_btn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [self addSubview:_btn];
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(_tv)+4, 300, 1)];
        line.tag = 100192;
        line.backgroundColor = BGColor;
        [self addSubview:line];
        
        UIImageView * imageview2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"clock2"]];
        imageview2.tag = 100191;
        imageview2.frame=CGRectMake(10, kFrameSetBottom(line)+10, 20, 20);
        [self addSubview:imageview2];
        
        
        UILabel *labeltitle2=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(imageview2)+4, kFrameSetBottom(line)+10, 60, 20)];
        labeltitle2.textColor=kColorFromRGB(0x755833);
        labeltitle2.tag = 100190;
        labeltitle2.font=[UIFont systemFontOfSize:15];
        labeltitle2.text=@"服务时间";
        [self addSubview:labeltitle2];
        
        
        _btn2 = [[UIButton alloc] initWithFrame:CGRectMake(kFrameSetRight(labeltitle)+5, kFrameSetBottom(line)+5, 150, 32)];
        [_btn2.titleLabel setFont:[UIFont systemFontOfSize:14]];
        _btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_btn2 setTitle:@"请选择服务时间" forState:UIControlStateNormal];
        [_btn2.titleLabel setTextColor:[UIColor lightGrayColor]];
        [_btn2 addTarget:self action:@selector(checkTime) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btn2];
        
        UIButton *mybtn = [[UIButton alloc] initWithFrame:CGRectMake(kFrameSetRight(_btn2)+10,kFrameSetBottom(line)-4, 45, 42)];
        [mybtn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [mybtn addTarget:self action:@selector(checkTime) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:mybtn];
        
        _actionSheet = [[HKDateActionSheet alloc] initWithTitle:@"请选择上门服务时间" delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];        
        _actionSheet.hkdelegate = self;
        [_actionSheet setActionSheetStyle:UIActionSheetStyleDefault];
        
        self.frame=CGRectMake(kFrameX(self), kFrameY(self), kFrameW(self), kFrameSetBottom(_btn2)+4);
        [self setmyframe:YES];
    }
    return self;
}
-(void)setmyframe:(BOOL)isHour
{
    //ishour yes:小时达 no:发起
    
    [UIView animateWithDuration:.3 animations:^{
        
        UILabel * fuwuTimeLable = (UILabel *)[self viewWithTag:100190];
        UIImageView * fuwuTimeimageview = (UIImageView *)[self viewWithTag:100191];
        UILabel * labelline = (UILabel *)[self viewWithTag:100192];
        if (isHour)
        {
            fuwuTimeLable.alpha = 0;
            fuwuTimeimageview.alpha = 0;
            labelline.alpha = 0;
            _btn2.alpha=0;
            self.frame=CGRectMake(kFrameX(self), kFrameY(self), kFrameW(self), kFrameSetBottom(labelline));
        }else
        {
            fuwuTimeLable.alpha = 1;
            fuwuTimeimageview.alpha = 1;
            labelline.alpha = 1;
            _btn2.alpha=1;
            self.frame=CGRectMake(kFrameX(self), kFrameY(self), kFrameW(self), kFrameSetBottom(_btn2)+4);
        }
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_tv resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _tv) {
        [textField resignFirstResponder];
    }
    return YES;
}

-(void)checkTime
{
//    [_btn2.titleLabel setTextColor:[UIColor blackColor]];
    [_actionSheet showInView:self];
}

-(void)sure:(NSString *)date
{
    _date = date;
    [_btn2 setTitle:[NSString stringWithFormat:@"%@",date] forState:UIControlStateNormal];
    [_btn2.titleLabel setTextColor:[UIColor blackColor]];
//    _serverDate=datel
}

-(void)cancle
{
    if ([_btn2.titleLabel.text isEqualToString:@"请选择服务时间"])
    {
        [_btn2.titleLabel setTextColor:[UIColor lightGrayColor]];
    }else
    {
        [_btn2.titleLabel setTextColor:[UIColor blackColor]];
    }
    
}


@end
