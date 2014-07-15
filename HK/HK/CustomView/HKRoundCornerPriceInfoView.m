//
//  HKRoundCornerPriceInfoView.m
//  HK
//
//  Created by 马涛 on 14-5-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerPriceInfoView.h"

@implementation HKRoundCornerPriceInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame title:(NSString *)title viewtype:(int)type
{
    self = [super initWithFrame:frame title:title viewtype:type];
    if (self) {
        //
        viewheight=30;
        switch (type) {
            case 0:
                {
                    UITextView *tv = [[UITextView alloc] initWithFrame:CGRectMake(15, 25, 270, 60)];
                    tv.backgroundColor = [UIColor clearColor];
                    
                    tv.font = [UIFont systemFontOfSize:10];
                    
                    [tv setText:@"上海腾牛电子商务有限公司为新理念家庭保洁，国内唯一非中介电商家庭服务－－NIUHOME.COM牛家帮！"];
                    tv.textColor=kColorFromRGB(0x666666);
                    tv.editable = false;
                    tv.scrollEnabled = false;
                    [self addSubview:tv];
                }
                break;
            case 1:
                {
                    UIImageView *priceInfo = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 260, 82)];
                    //        priceInfo.backgroundColor = [UIColor lightGrayColor];
                    [priceInfo setImage:[UIImage imageNamed:@"price_intro.png"]];
                    self.backgroundColor = [UIColor whiteColor];
                    [self addSubview:priceInfo];
                    
                    UITextView* tv = [[UITextView alloc] initWithFrame:CGRectMake(20, kFrameSetBottom(priceInfo), 260, 60)];
                    tv.text=@"每天18点后的服务订单／法定节假日订单／双人组合服务订单，加收20%服务费。加收的费用不会叠加。";
                    tv.textColor=kColorFromRGB(0x666666);
                    tv.font = [UIFont systemFontOfSize:12];
                    tv.backgroundColor=[UIColor clearColor];
                    tv.scrollEnabled = false;
                    tv.editable = false;
                    [self addSubview:tv];
                    
                    UITextView * label=[[UITextView alloc]initWithFrame:CGRectMake(20, kFrameSetBottom(tv)-32, 260, 100)];
                    label.text=@"                   (注，您的单子符合了以上任一个条件或满足了所有条件费用都只增收20%服务费)";
                    label.font = [UIFont systemFontOfSize:12];
                    label.backgroundColor=[UIColor clearColor];
                    label.textColor=kColorFromRGB(0x999999);
                    label.scrollEnabled = false;
                    label.editable = false;
                    [self addSubview:label];
                    
                }
                break;
            case 2:
                {
                    NSArray * names=[NSArray arrayWithObjects:@"客厅",@"卫生间",@"厨房",@"卧室",@"阳台",nil];
                    NSArray * elengistnames=[NSArray arrayWithObjects:@"/LIVENG",@"/BATH",@"/KITCHEN",@"/BEDROOM",@"/OUTDOOR",nil];
                    NSArray * massages=[NSArray arrayWithObjects:@"1.储物柜除尘 \n2.地面除尘&拖洗 \n3.其余接触表面除尘 \n4.家电表面除尘 \n5.更换垃圾袋",@"1.花洒/浴缸擦洗 \n2.洗手台擦洗 \n3.马桶清洗 \n4.水槽、水龙头、镜面擦洗 \n5.其余接触面除尘\n6.地面除尘&拖洗\n7.更换垃圾袋",@"1.餐具&厨具擦洗 \n2.油烟机外表面清洗 \n3.微波炉去污 \n4.冰箱外接触面擦洗 \n5.地面除尘&拖洗 \n6.水槽、水龙头擦洗 \n7.置物架擦洗 \n8.其他厨房电器外表面清洗",@"1.整理床铺 \n2.整理衣物 \n3.储物柜除尘 \n4.地面除尘&拖洗 \n5.其余接触表面除尘 \n6.更换垃圾袋",@"1.围栏擦洗 \n2.洗衣机擦洗 \n3.地面除尘&拖洗",nil];
                    NSArray * images=[NSArray arrayWithObjects:@"pic01",@"pic03",@"pic04",@"pic02",@"pic05", nil];
                    //[self cellforsover:@"sds" imagename:@"default_photo@2x.png"];
                    for (int i=0; i<names.count; i++)
                    {
                        [self cellforsover:[names objectAtIndex:i] imagename:[images objectAtIndex:i] text:[massages objectAtIndex:i] englishname:[elengistnames objectAtIndex:i]];
                    }
                    self.frame=CGRectMake(kFrameX(self), kFrameY(self),kFrameW(self) , viewheight+20);
                    
                }
                break;
                
            default:
                break;
        }
 
    }
    return self;
}
-(void)cellforsover:(NSString*)title imagename:(NSString*)imagename text:(NSString*)text englishname:(NSString*)englishname
{
    
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(10,viewheight,self.frame.size.width-20,300)];
    
    UIImage * image=[UIImage imageNamed:imagename];
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, image.size.width, image.size.height)];
    imageview.image = image;
    imageview.contentMode = UIViewContentModeScaleAspectFill;
    [view addSubview:imageview];
    
    CGSize constrainttitle = CGSizeMake(view.frame.size.width-imageview.frame.size.width, CGFLOAT_MAX);
    CGSize sizetitle = [title sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:constrainttitle lineBreakMode:UILineBreakModeWordWrap];
    CGRect lebleframe = CGRectMake(kFrameSetRight(imageview)+12, 6, sizetitle.width, 16);
    
    UILabel * labeltitle=[[UILabel alloc]initWithFrame:lebleframe];
    labeltitle.text=title;
    labeltitle.font=[UIFont systemFontOfSize:14];
    labeltitle.textColor=kColorFromRGB(0x80aa0e);
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [view addSubview:labeltitle];
    
    UILabel * labeletitle=[[UILabel alloc]initWithFrame:CGRectMake(kFrameSetRight(labeltitle), 8, 80, 16)];
    labeletitle.text=englishname;
    labeletitle.font=[UIFont systemFontOfSize:12];
    labeletitle.textColor=kColorFromRGB(0x755833);
    [labeletitle setBackgroundColor:[UIColor clearColor]];
    [view addSubview:labeletitle];
    
    CGSize constraint = CGSizeMake(view.frame.size.width-imageview.frame.size.width, CGFLOAT_MAX);
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGRect frame = CGRectMake(kFrameSetRight(imageview)+10, kFrameSetBottom(labeltitle)-4, kFrameW(view)-kFrameW(imageview)-20, size.height);
    UITextView* tv = [[UITextView alloc] initWithFrame:frame];
    [tv setText:text];
    tv.font = [UIFont systemFontOfSize:11];
    tv.backgroundColor=[UIColor clearColor];
    tv.textColor = kColorFromRGB(0x333333);
    tv.scrollEnabled = false;
    tv.editable = false;
   // tv.frame = CGRectMake(tv.frame.origin.x, tv.frame.origin.y, tv.frame.size.width, tv.contentSize.height+20);
    
    [view addSubview:tv];
    [self addSubview:view];
    
//    if (kFrameSetBottom(imageview)>kFrameSetBottom(tv))
//    {
        view.frame=CGRectMake(kFrameX(view),kFrameY(view),kFrameW(view),kFrameSetBottom(imageview)+10);
//    }else
//    {
//        view.frame=CGRectMake(kFrameX(view),kFrameY(view),kFrameW(view),kFrameSetBottom(tv)+10);
//    }
    
    viewheight=kFrameSetBottom(view);
}


@end
