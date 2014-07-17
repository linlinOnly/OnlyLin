//
//  OdMessageViewController.m
//  HK
//
//  Created by panyulin－cyou on 14-7-17.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OdMessageViewController.h"
#import "HKRoundCornerView.h"
@implementation OdMessageViewController
- (id)init
{
    self = [super init];
    if (self) {
        
        
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"订单详情";
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    [customLab setTextColor:[UIColor whiteColor]];
    customLab.backgroundColor = [UIColor clearColor];
    customLab.textAlignment= NSTextAlignmentCenter;
    [customLab setText:self.title];
    customLab.backgroundColor = [UIColor clearColor];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    UIImage * backImage = [UIImage imageNamed:@"barback"];
    UIButton * backBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,backImage.size.width, backImage.size.height)];
    [backBtn addTarget:self action:@selector(returnView) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:backImage forState:UIControlStateNormal];
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    _bottomScorllView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    _bottomScorllView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_bottomScorllView setBackgroundColor:[UIColor whiteColor]];
    [_bottomScorllView setContentSize:CGSizeMake(320, 540)];
    [self.view addSubview:_bottomScorllView];
    
    HKRoundCornerView * bottomview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, 10, 300, 300)];
    [_bottomScorllView addSubview:bottomview];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(20,8, 62, 26)];
    label1.textColor=kColorFromRGB(0x755833);
    label1.font=[UIFont systemFontOfSize:13];
    label1.text=@"预约时间:";
    [bottomview addSubview:label1];
    
    UILabel *label1r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label1)+16,8, 160, 26)];
    label1r.textColor=kColorFromRGB(0x000000);
    label1r.font=[UIFont systemFontOfSize:12];
    label1r.text=_data.create_time;
    [bottomview addSubview:label1r];
    
    
    UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label1)+4, 300, 1)];
    line2.backgroundColor = BGColor;
    [bottomview addSubview:line2];
    
    
    
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line2)+4, 62, 26)];
    label2.textColor=kColorFromRGB(0x755833);
    label2.font=[UIFont systemFontOfSize:13];
    label2.text=@"订单编号:";
    [bottomview addSubview:label2];
    
    UILabel *label2r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label2)+16,kFrameSetBottom(line2)+4, 160, 26)];
    label2r.textColor=kColorFromRGB(0x000000);
    label2r.font=[UIFont systemFontOfSize:11];
    label2r.text=_data.order_sn;
    [bottomview addSubview:label2r];
    
    UILabel *line3 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label2)+4, 300, 1)];
    line3.backgroundColor = BGColor;
    [bottomview addSubview:line3];
    
    
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line3)+4, 62, 26)];
    label3.textColor=kColorFromRGB(0x755833);
    label3.font=[UIFont systemFontOfSize:13];
    label3.text=@"订单类型:";
    [bottomview addSubview:label3];
    
    UILabel *label3r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label3)+16,kFrameSetBottom(line3)+4, 160, 26)];
    label3r.textColor=kColorFromRGB(0x000000);
    label3r.font=[UIFont systemFontOfSize:11];
    label3r.text=_data.service_type;
    [bottomview addSubview:label3r];
    
    UILabel *line4 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label3)+4, 300, 1)];
    line4.backgroundColor = BGColor;
    [bottomview addSubview:line4];
    
    
    
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line4)+4, 62, 26)];
    label4.textColor=kColorFromRGB(0x755833);
    label4.font=[UIFont systemFontOfSize:13];
    label4.text=@"订单金额";
    [bottomview addSubview:label4];
    
    UILabel *label4r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label4)+16,kFrameSetBottom(line4)+4, 160, 26)];
    label4r.textColor=kColorFromRGB(0x000000);
    label4r.font=[UIFont systemFontOfSize:11];
    label4r.text=_data.total_fee;
    [bottomview addSubview:label4r];
    
    UILabel *line5 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label4)+4, 300, 1)];
    line5.backgroundColor = BGColor;
    [bottomview addSubview:line5];
    
    
    
    
    UILabel *label5=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line5)+4, 62, 26)];
    label5.textColor=kColorFromRGB(0x755833);
    label5.font=[UIFont systemFontOfSize:13];
    label5.text=@"服务地址";
    [bottomview addSubview:label5];
    
    UILabel *label5r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label5)+16,kFrameSetBottom(line5)+4, 160, 26)];
    label5r.textColor=kColorFromRGB(0x000000);
    label5r.font=[UIFont systemFontOfSize:11];
    label5r.text=_data.address;
    [bottomview addSubview:label5r];
    
    UILabel *line6 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label5)+4, 300, 1)];
    line6.backgroundColor = BGColor;
    [bottomview addSubview:line6];
    
    
    
    UILabel *label6=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line6)+4, 62, 26)];
    label6.textColor=kColorFromRGB(0x755833);
    label6.font=[UIFont systemFontOfSize:13];
    label6.text=@"手机号码:";
    [bottomview addSubview:label6];
    
    UILabel *label6r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label6)+16,kFrameSetBottom(line6)+4, 160, 26)];
    label6r.textColor=kColorFromRGB(0x000000);
    label6r.font=[UIFont systemFontOfSize:11];
    label6r.text=_data.mobile;
    [bottomview addSubview:label6r];
    

    
}

-(void)returnView
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
