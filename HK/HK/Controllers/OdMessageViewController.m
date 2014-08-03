//
//  OdMessageViewController.m
//  HK
//
//  Created by panyulin－cyou on 14-7-17.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "OdMessageViewController.h"
#import "HKRoundCornerView.h"
#import "UMSocial.h"
@implementation OdMessageViewController
- (id)init
{
    self = [super init];
    if (self) {
        
        
        // Custom initialization
    }
    return self;
}
#pragma mark - 分享
- (void)rigthBar:(id)sender {
    
//    [UMSocialData defaultData].extConfig.tencentData.shareText = @"标题";
//    [UMSocialData defaultData].extConfig.sinaData.shareText = @"标题";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:kUMengAppKey
                                      shareText:@"牛家帮，国内首家B2C品质电商家庭保洁企业，安全、快速、标准，让您体验不一样的新时代家庭保洁服务。点此链接下载“牛家帮”APP,http://t.cn/RPUlgDZ"
                                     shareImage:nil
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,
                                                 UMShareToTencent,
                                                 nil]
                                       delegate:nil];
    
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
    
    UIButton * rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightBtn setTitle:@"分享" forState:UIControlStateNormal];
    [rightBtn setTitleColor:kColorFromRGB(0xb2ed1b) forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rigthBar:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem*rightButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
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
    bottomview.tag=10;
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
    
    UILabel *label3r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label3)+16,kFrameSetBottom(line3)+4, 70, 26)];
    label3r.textColor=kColorFromRGB(0x755833);
    label3r.font=[UIFont systemFontOfSize:13];
    label3r.text=[_data.order_type isEqualToString:@"2"] ? @"预约订单" : @"小时达订单";
    [bottomview addSubview:label3r];
    
    UILabel *label3r2=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label3r),kFrameSetBottom(line3)+4, 100, 26)];
    label3r2.textColor=kColorFromRGB(0x000000);
    label3r2.font=[UIFont systemFontOfSize:13];
    label3r2.text=[_data.service_type isEqualToString:@"2"] ? @"(双人组合)" : @"";
    [bottomview addSubview:label3r2];
    
    UIImageView *imageviewstatu=[[UIImageView alloc]initWithFrame:CGRectMake(60, kFrameSetBottom(label3)+4, 179, 58)];
    if ([_data.order_status isEqualToString:@"4"])
    {
        [imageviewstatu setImage:[UIImage imageNamed:@"status_finishm"]];
    }else
    {
        [imageviewstatu setImage:[UIImage imageNamed:@"status_sentm"]];
    }
    [bottomview addSubview:imageviewstatu];
    
    
    
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(imageviewstatu)+4, 62, 26)];
    label4.textColor=kColorFromRGB(0x755833);
    label4.font=[UIFont systemFontOfSize:13];
    label4.text=@"订单金额";
    [bottomview addSubview:label4];
    
    
    UILabel *label4r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label4)+16,kFrameSetBottom(imageviewstatu)+4, 160, 26)];
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
    
    bottomview.frame=CGRectMake(kFrameX(bottomview), kFrameY(bottomview), 300, kFrameSetBottom(label6)+10);
    
    if (_data.evaluation)
    {
        UILabel *line7 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(label6)+4, 300, 1)];
        line7.backgroundColor = BGColor;
        [bottomview addSubview:line7];
        
        UILabel *label8=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line7)+4, 62, 26)];
        label8.textColor=kColorFromRGB(0x755833);
        label8.font=[UIFont systemFontOfSize:13];
        label8.text=@"服务评价:";
        [bottomview addSubview:label8];
        
        UILabel *label8r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label8)+16,kFrameSetBottom(line7)+4, 160, 26)];
        label8r.textColor=kColorFromRGB(0x755833);
        label8r.font=[UIFont systemFontOfSize:13];
        label8r.text=_data.evaluation?@"满意":@"不满意";
        [bottomview addSubview:label8r];
        
        bottomview.frame=CGRectMake(kFrameX(bottomview), kFrameY(bottomview), 300, kFrameSetBottom(label8)+10);
        
        _bottomScorllView.contentSize=CGSizeMake(320, kFrameSetBottom(bottomview)+10);
        
    }else
    {
        _commentview=[[UIView alloc]init];
        [_bottomScorllView addSubview:_commentview];
        
        UILabel *label8=[[UILabel alloc]initWithFrame:CGRectMake(30,0, 62, 22)];
        label8.textColor=kColorFromRGB(0x755833);
        label8.font=[UIFont systemFontOfSize:13];
        label8.text=@"服务评价:";
        [_commentview addSubview:label8];
        
        UIButton *btn8r=[[UIButton alloc]initWithFrame:CGRectMake(kFrameSetRight(label8)+10,0, 50, 22)];
        [btn8r setTitle:@"满意" forState:UIControlStateNormal];
        btn8r.titleLabel.font=[UIFont systemFontOfSize:12];
        btn8r.tag=1;
        btn8r.selected=true;
        [btn8r addTarget:self action:@selector(contBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn8r setTitleColor:kColorFromRGB(0x000000) forState:UIControlStateNormal];
        [btn8r setTitleColor:kColorFromRGB(0x755833) forState:UIControlStateSelected];
        [_commentview addSubview:btn8r];
        
        UIButton *btn8r2=[[UIButton alloc]initWithFrame:CGRectMake(kFrameSetRight(btn8r)+10,0, 60, 22)];
        [btn8r2 setTitle:@"不满意" forState:UIControlStateNormal];
        btn8r2.titleLabel.font=[UIFont systemFontOfSize:12];
        btn8r2.tag=2;
        [btn8r2 addTarget:self action:@selector(contBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn8r2 setTitleColor:kColorFromRGB(0x000000) forState:UIControlStateNormal];
        [btn8r2 setTitleColor:kColorFromRGB(0x755833) forState:UIControlStateSelected];
        [_commentview addSubview:btn8r2];
        
        UITextView * tv=[[UITextView alloc]initWithFrame:CGRectMake(10,kFrameSetBottom(btn8r)+10, 300, 60)];
        tv.backgroundColor=[UIColor redColor];
        tv.tag=3;
        tv.backgroundColor = [UIColor whiteColor];
        tv.layer.borderColor = BORDERColor.CGColor;
        tv.layer.borderWidth = 1;
        
        tv.delegate=self;
        [_commentview addSubview:tv];
        
        UIButton *btnsumb=[[UIButton alloc]initWithFrame:CGRectMake(105,kFrameSetBottom(tv)+10, 110, 34)];
        [btnsumb setTitle:@"提交评论" forState:UIControlStateNormal];
        [btnsumb setImage:[UIImage imageNamed:@"tijiaobtn"] forState:UIControlStateNormal];
        btnsumb.titleLabel.font=[UIFont systemFontOfSize:12];
        [btnsumb addTarget:self action:@selector(btnsumbComment:) forControlEvents:UIControlEventTouchUpInside];
        [_commentview addSubview:btnsumb];
        
        _commentview.frame=CGRectMake(0, kFrameSetBottom(bottomview)+10, 320, kFrameSetBottom(btnsumb));
        _bottomScorllView.contentSize=CGSizeMake(320, kFrameSetBottom(_commentview)+10);
        
    }

    
}
-(void)btnsumbComment:(UIButton*)btn
{
    UITextView * tv=(UITextView*)[self.view viewWithTag:3];
    UIButton * commentbtn=(UIButton*)[self.view viewWithTag:1];
    _model = [[HKCommentModel alloc] initWithOrderId:[_data.order_id intValue] Status:commentbtn.selected?1:2 Comment:tv.text];
    _model.delegate = self;
    [_model postToServer];
    
}
-(void)commentFinish:(NSDictionary *)dic
{
    //    NSLog(@"comment %@",dic);
    
    if ([[dic objectForKey:@"code"] intValue] == 108) {
        //
        [SVProgressHUD dismissWithSuccess:@"评论成功"];
        [self changLayousts];
        
    }
    else
    {
        [SVProgressHUD dismissWithError:@"评论失败"];
    }
}
-(void)changLayousts
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"orderlist" object:self];
    
    _commentview.hidden=YES;
    
    
    HKRoundCornerView * bottomview=(HKRoundCornerView*)[self.view viewWithTag:10];
    UILabel *line7 = [[UILabel alloc] initWithFrame:CGRectMake(0, kFrameSetBottom(bottomview)-10, 300, 1)];
    line7.backgroundColor = BGColor;
    [bottomview addSubview:line7];
    
    UILabel *label8=[[UILabel alloc]initWithFrame:CGRectMake(20,kFrameSetBottom(line7)+4, 62, 26)];
    label8.textColor=kColorFromRGB(0x755833);
    label8.font=[UIFont systemFontOfSize:13];
    label8.text=@"服务评价:";
    [bottomview addSubview:label8];
    
    UILabel *label8r=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(label8)+16,kFrameSetBottom(line7)+4, 160, 26)];
    label8r.textColor=kColorFromRGB(0x755833);
    label8r.font=[UIFont systemFontOfSize:13];
    label8r.text=((UIButton*)[self.view viewWithTag:1]).selected?@"满意":@"不满意";
    [bottomview addSubview:label8r];
    
    bottomview.frame=CGRectMake(kFrameX(bottomview), kFrameY(bottomview), 300, kFrameSetBottom(label8)+10);
    
    _bottomScorllView.contentSize=CGSizeMake(320, kFrameSetBottom(bottomview)+10);
    
}
-(void)contBtn:(UIButton*)btn
{
    if (btn.selected)
    {
        return;
    }
    btn.selected=!btn.selected;
    
    UIButton * antherbtn=(UIButton*)[self.view viewWithTag:btn.tag==1?2:1];
    antherbtn.selected=!antherbtn.selected;
    
}
-(void)returnView
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)keyboardClick:(UIButton*)btn
{
    UITextView * textview=(UITextView*)[self.view viewWithTag:3];
    [textview resignFirstResponder];
    [btn removeFromSuperview];
    [UIView animateWithDuration:.3 animations:^{
        [_bottomScorllView setFrame:CGRectMake(kFrameX(_bottomScorllView), 0, kFrameW(_bottomScorllView), kFrameH(_bottomScorllView))];
    }];
    
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    UIButton * keyboard=[[UIButton alloc]initWithFrame:self.view.frame];
    [self.view addSubview:keyboard];
    [keyboard setBackgroundColor:[UIColor clearColor]];
    keyboard.tag=5;
    [keyboard addTarget:self action:@selector(keyboardClick:) forControlEvents:UIControlEventTouchUpInside];
    [UIView animateWithDuration:.3 animations:^{
        [_bottomScorllView setFrame:CGRectMake(0, -150, kFrameW(_bottomScorllView), kFrameH(_bottomScorllView))];
    }];
}
- (BOOL)textView: (UITextView *)textview shouldChangeTextInRange: (NSRange)range replacementText: (NSString *)text {
    if ([text isEqualToString:@"\n"])
    {
        [textview resignFirstResponder];
        UIButton * keyboard=(UIButton*)[self.view viewWithTag:5];
        [keyboard removeFromSuperview];
        [UIView animateWithDuration:.3 animations:^{
             [_bottomScorllView setFrame:CGRectMake(kFrameX(_bottomScorllView), 0, kFrameW(_bottomScorllView), kFrameH(_bottomScorllView))];
        }];
        return false;
    }
    return YES;
}

@end
