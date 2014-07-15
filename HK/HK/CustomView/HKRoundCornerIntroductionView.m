//
//  HKRoundCornerIntroductionView.m
//  HK
//
//  Created by 马涛 on 14-5-2.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerIntroductionView.h"

@implementation HKRoundCornerIntroductionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame title:title];
    if (self) {
        // Initialization code
        
        self.backgroundColor = VBGColor;
        
        
        _tv = [[UITextView alloc] initWithFrame:CGRectMake(15, 20, 270, 260)];
        [_tv setText:@"客厅\n1.储物柜除尘 2.地面除尘&拖洗 3.其余接触表面除尘 4.家电表面除尘 5.更换垃圾袋\n卫生间\n1.花洒/浴缸擦洗 2.洗手台擦洗 3.马桶清洗 4.水槽、水龙头、镜面擦洗 5.其余接触面除尘6.地面除尘&拖洗7.更换垃圾袋\n厨房\n1.餐具&厨具擦洗 2.油烟机外表面清洗 3.微波炉去污 4.冰箱外接触面擦洗 5.地面除尘&拖洗 6.水槽、水龙头擦洗 7.置物架擦洗 8..其他厨房电器外表面清洗\n卧室\n1.整理床铺 2.整理衣物 3.储物柜除尘 4.地面除尘&拖洗 5.其余接触表面除尘 6.更换垃圾袋\n阳台\n1.围栏擦洗 2.洗衣台擦洗 3.地面除尘&拖洗"];
        
        _tv.font = [UIFont systemFontOfSize:12];
        _tv.textColor = [UIColor blackColor];
        _tv.backgroundColor = [UIColor clearColor];
        _tv.scrollEnabled = false;
        //        _tv.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
        _tv.editable = false;
        
        [self addSubview:_tv];
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
