//
//  OrderSuccessViewController.m
//  HK
//
//  Created by QiMengJin on 14-7-15.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OrderSuccessViewController.h"
#import "HKRoundCornerView.h"
#import "PayViewController.h"
@interface OrderSuccessViewController ()

@end

@implementation OrderSuccessViewController

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
    
    
//    [UIImage imageNamed:@"townpeople_c"]
    UIImageView * imageview=[[UIImageView alloc]initWithFrame:CGRectMake(80, 12, 20, 20)];
    imageview.image=[UIImage imageNamed:@"townpeople_c"];
    [self.view addSubview:imageview];
    
    UILabel *labeltitle=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(imageview)+4,8, 200, 30)];
    labeltitle.textColor=kColorFromRGB(0x755833);
    labeltitle.font=[UIFont systemFontOfSize:20];
    labeltitle.text=@"提交订单成功";
    [self.view addSubview:labeltitle];
    
    UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(labeltitle)+4, 320, 1)];
    line1.backgroundColor = BGColor;
    [self.view addSubview:line1];
    
    
    HKRoundCornerView * bottomview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(line1)+8, 300, 300)];
    [self.view addSubview:bottomview];
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(20,8, 62, 26)];
    label1.textColor=kColorFromRGB(0x755833);
    label1.font=[UIFont systemFontOfSize:13];
    label1.text=@"订单类型:";
    [bottomview addSubview:label1];
    
    UILabel *label1r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label1)+16,8, 60, 26)];
    label1r.textColor=kColorFromRGB(0x755833);
    label1r.font=[UIFont systemFontOfSize:14];
    label1r.text=@"预约订单";
    [bottomview addSubview:label1r];
    
    UILabel *label1r2=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label1r)+10,8, 100, 26)];
    label1r2.textColor=kColorFromRGB(0x000000);
    label1r2.font=[UIFont systemFontOfSize:12];
    label1r2.text=[[NSString stringWithFormat:@"%@",[_data objectForKey:@"service_type"]] isEqualToString:@"1"]?@"(双人组合)":@"(单人)";
    [bottomview addSubview:label1r2];
    
    UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label1)+4, 300, 1)];
    line2.backgroundColor = BGColor;
    [bottomview addSubview:line2];
    
    
    
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line2)+4, 62, 26)];
    label2.textColor=kColorFromRGB(0x755833);
    label2.font=[UIFont systemFontOfSize:13];
    label2.text=@"预约时间:";
    [bottomview addSubview:label2];
    
    UILabel *label2r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label2)+16,kFrameSetBottom(line2)+4, 160, 26)];
    label2r.textColor=kColorFromRGB(0x000000);
    label2r.font=[UIFont systemFontOfSize:11];
    label2r.text=[[NSString stringWithFormat:@"%@",[_data objectForKey:@"order_type"]] isEqualToString:@"1"]?@"一小时后达到":[_data objectForKey:@"date"];
    [bottomview addSubview:label2r];
    
    UILabel *line3 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label2)+4, 300, 1)];
    line3.backgroundColor = BGColor;
    [bottomview addSubview:line3];
    
    
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line3)+4, 62, 26)];
    label3.textColor=kColorFromRGB(0x755833);
    label3.font=[UIFont systemFontOfSize:13];
    label3.text=@"订单编号:";
    [bottomview addSubview:label3];
    
    UILabel *label3r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label3)+16,kFrameSetBottom(line3)+4, 160, 26)];
    label3r.textColor=kColorFromRGB(0x000000);
    label3r.font=[UIFont systemFontOfSize:11];
    label3r.text=[_data objectForKey:@"order_sn"];
    [bottomview addSubview:label3r];
    
    UILabel *line4 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label3)+4, 300, 1)];
    line4.backgroundColor = BGColor;
    [bottomview addSubview:line4];
    
    
    
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line4)+4, 62, 26)];
    label4.textColor=kColorFromRGB(0x755833);
    label4.font=[UIFont systemFontOfSize:13];
    label4.text=@"服务地址:";
    [bottomview addSubview:label4];
    
    UILabel *label4r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label4)+16,kFrameSetBottom(line4)+4, 160, 26)];
    label4r.textColor=kColorFromRGB(0x000000);
    label4r.font=[UIFont systemFontOfSize:11];
    label4r.text=[_data objectForKey:@"address"];
    [bottomview addSubview:label4r];
    
    UILabel *line5 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label4)+4, 300, 1)];
    line5.backgroundColor = BGColor;
    [bottomview addSubview:line5];
    
    
    
    
    UILabel *label5=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line5)+4, 62, 26)];
    label5.textColor=kColorFromRGB(0x755833);
    label5.font=[UIFont systemFontOfSize:13];
    label5.text=@"联系姓名:";
    [bottomview addSubview:label5];
    
    UILabel *label5r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label5)+16,kFrameSetBottom(line5)+4, 160, 26)];
    label5r.textColor=kColorFromRGB(0x000000);
    label5r.font=[UIFont systemFontOfSize:11];
    label5r.text=[_data valueForKey:@"contacts"];
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
    label6r.text=[_data objectForKey:@"mobile"];
    [bottomview addSubview:label6r];
    
    UILabel *line7 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label6)+4, 300, 1)];
    line7.backgroundColor = BGColor;
    [bottomview addSubview:line7];
    
    
    
    UILabel *label7=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line7)+4, 62, 26)];
    label7.textColor=kColorFromRGB(0x755833);
    label7.font=[UIFont systemFontOfSize:13];
    label7.text=@"应付金额:";
    [bottomview addSubview:label7];
    
    UILabel *label7r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label7)+16,kFrameSetBottom(line7)+4, 160, 26)];
    label7r.textColor=[UIColor redColor];
    label7r.font=[UIFont systemFontOfSize:11];
    label7r.text=  [NSString stringWithFormat:@"¥%@",[_data valueForKey:@"total_fee"]];
    [bottomview addSubview:label7r];
    
    bottomview.frame=CGRectMake(10, kFrameSetBottom(line1)+8, 300, kFrameSetBottom(label7)+10);
    
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitBtn setFrame:CGRectMake(115, kFrameSetBottom(bottomview)+10, 110, 34)];
    [submitBtn addTarget:self action:@selector(submitDataToServer:) forControlEvents:UIControlEventTouchUpInside];
    
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"paybtn"] forState:UIControlStateNormal];
    [self.view addSubview:submitBtn];
    
    
}

-(void)submitDataToServer:(UIButton*)btn
{
    PayViewController * orderview=[[PayViewController alloc]init];
    [self.navigationController pushViewController:orderview animated:YES];
}
-(void)returnView
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
