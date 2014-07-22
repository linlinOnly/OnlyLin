//
//  HKRoundCornerTimeLongView.m
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerTimeLongView.h"

@implementation HKRoundCornerTimeLongView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        _serverTimeLong = [[NSString alloc] init];
//        BORDERColor
        
        
        _hourlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 8, 200, 10)];
        _hourlabel.textColor=kColorFromRGB(0x666666);
        _hourlabel.font=[UIFont systemFontOfSize:10];
        _hourlabel.text=@"下单后1小时内到达的订单";
        [self addSubview:_hourlabel];
        
        
        _imageview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"clock1"]];
        
        [self addSubview:_imageview];
        
        _soverlabel=[[UILabel alloc]init];
        _soverlabel.textColor=kColorFromRGB(0x755833);
        _soverlabel.font=[UIFont systemFontOfSize:14];
        _soverlabel.text=@"服务时长";
        [self addSubview:_soverlabel];
        
        _hour2 = [[UIButton alloc] init];
        _hour3 = [[UIButton alloc] init];
        _hour4 = [[UIButton alloc] init];
        _hour2.tag = 2;
        _hour3.tag = 3;
        _hour4.tag = 4;
        _serverTimeLong = @"1";
        [_hour2 addTarget:self action:@selector(timeLong:) forControlEvents:UIControlEventTouchUpInside];
        [_hour3 addTarget:self action:@selector(timeLong:) forControlEvents:UIControlEventTouchUpInside];
        [_hour4 addTarget:self action:@selector(timeLong:) forControlEvents:UIControlEventTouchUpInside];
        [_hour2 setBackgroundImage:[UIImage imageNamed:@"2hour_b"] forState:UIControlStateNormal];
        [_hour3 setBackgroundImage:[UIImage imageNamed:@"3hour_g"] forState:UIControlStateNormal];
        [_hour4 setBackgroundImage:[UIImage imageNamed:@"4hour_g"] forState:UIControlStateNormal];
        [self addSubview:_hour2];
        [self addSubview:_hour3];
        [self addSubview:_hour4];
        
        _legendlabel=[[UILabel alloc]init];
        _legendlabel.text=@"建议面积为90平以下";
        _legendlabel.textColor=kColorFromRGB(0x999999);
        _legendlabel.font=[UIFont systemFontOfSize:10];
        [self addSubview:_legendlabel];
        
        _townpeopleBtn=[[UIButton alloc]initWithFrame:CGRectMake(20, kFrameSetBottom(_legendlabel)+6, 15, 15)];
        [_townpeopleBtn setImage:[UIImage imageNamed:@"townpeople"] forState:UIControlStateNormal];
        [_townpeopleBtn setImage:[UIImage imageNamed:@"townpeople_c"] forState:UIControlStateSelected];
        [_townpeopleBtn addTarget:self action:@selector(townpeopleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _service_type=@"1";
        [self addSubview:_townpeopleBtn];
        
        _townpeopleLab=[[UILabel alloc]init];
        _townpeopleLab.text=@"双人组合";
        _townpeopleLab.textColor=kColorFromRGB(0x755833);
        _townpeopleLab.font=[UIFont systemFontOfSize:14];
        _townpeopleLab.userInteractionEnabled = YES;
        [self addSubview:_townpeopleLab];
        UITapGestureRecognizer * tap  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(townpeopleBtnClick:)];
        [_townpeopleLab addGestureRecognizer:tap];
        
        _lastLab=[[UILabel alloc]init];
        _lastLab.textColor=kColorFromRGB(0x666666);
        _lastLab.font=[UIFont systemFontOfSize:10];
        _lastLab.text=@"神速扫，双倍效率，只加收20%的服务费哟";
        [self addSubview:_lastLab];
        [self setmyframe:YES];
        
        self.frame=CGRectMake(kFrameX(self), kFrameY(self), kFrameW(self), kFrameSetBottom(_lastLab)+10);

    }
    return self;
}
-(void)townpeopleBtnClick:(id)btn
{
    _townpeopleBtn.selected=!_townpeopleBtn.selected;
    _service_type=([_service_type isEqualToString:@"1"]?@"2":@"1");
    
}
-(void)setmyframe:(BOOL)isHour
{
    if (isHour)
    {
        _hourlabel.textColor=kColorFromRGB(0x666666);
        _imageview.frame=CGRectMake(20, kFrameSetBottom(_hourlabel)+5, 20, 20);
        _soverlabel.frame=CGRectMake(kFrameSetRight(_imageview),  kFrameSetBottom(_hourlabel)+6, 100, 16);
        
    }else
    {
        _hourlabel.textColor=[UIColor clearColor];
        _imageview.frame=CGRectMake(20, 9, 20, 20);
        _soverlabel.frame=CGRectMake(kFrameSetRight(_imageview), 10, 100, 16);
    }
    
    _hour2.frame=CGRectMake(20, kFrameSetBottom(_soverlabel)+6, 82, 48);
    _hour3.frame=CGRectMake(kFrameSetRight(_hour2)+8, kFrameSetBottom(_soverlabel)+6, 82, 48);
    _hour4.frame=CGRectMake(kFrameSetRight(_hour3)+8, kFrameSetBottom(_soverlabel)+6, 82, 48);
    _legendlabel.frame=CGRectMake(20, kFrameSetBottom(_hour2)+6, 150, 10);
    _townpeopleBtn.frame=CGRectMake(20, kFrameSetBottom(_legendlabel)+6, 15, 15);
    _townpeopleLab.frame=CGRectMake(kFrameSetRight(_townpeopleBtn)+4, kFrameSetBottom(_legendlabel)+6, 100, 15);
    _lastLab.frame=CGRectMake(kFrameX(_townpeopleLab), kFrameSetBottom(_townpeopleLab)+6, 250, 10);
    self.frame=CGRectMake(kFrameX(self), kFrameY(self), kFrameW(self), kFrameSetBottom(_lastLab)+10);
 
}
-(void)timeLong:(UIButton*)sender
{
    _serverTimeLong = [NSString stringWithFormat:@"%d",sender.tag-1];

    switch (sender.tag) {
        case 2:
        {
            [_hour2 setBackgroundImage:[UIImage imageNamed:@"2hour_b"] forState:UIControlStateNormal];
            [_hour3 setBackgroundImage:[UIImage imageNamed:@"3hour_g"] forState:UIControlStateNormal];
            [_hour4 setBackgroundImage:[UIImage imageNamed:@"4hour_g"] forState:UIControlStateNormal];
        }
            break;
        case 3:
        {
            [_hour2 setBackgroundImage:[UIImage imageNamed:@"2hour_g"] forState:UIControlStateNormal];
            [_hour3 setBackgroundImage:[UIImage imageNamed:@"3hour_b"] forState:UIControlStateNormal];
            [_hour4 setBackgroundImage:[UIImage imageNamed:@"4hour_g"] forState:UIControlStateNormal];
        }
            break;
        case 4:
        {
            [_hour2 setBackgroundImage:[UIImage imageNamed:@"2hour_g"] forState:UIControlStateNormal];
            [_hour3 setBackgroundImage:[UIImage imageNamed:@"3hour_g"] forState:UIControlStateNormal];
            [_hour4 setBackgroundImage:[UIImage imageNamed:@"4hour_b"] forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}







@end
