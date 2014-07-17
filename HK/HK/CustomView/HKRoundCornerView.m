//
//  HKRoundCornerView.m
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKRoundCornerView.h"

@implementation HKRoundCornerView

-(id)initWithFrame:(CGRect)frame cornerRadius:(int)cornerRadius
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.cornerRadius  = cornerRadius;
        
        self.layer.borderColor = BORDERColor.CGColor;
        self.layer.borderWidth = 0.4;
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.cornerRadius  = 6;
        
        self.layer.borderColor = BORDERColor.CGColor;
        self.layer.borderWidth = 1;
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame title:(NSString *)title viewtype:(int)type
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(28, 3, 300, 30)];
        [_titleLabel setText:title];
        
        [_titleLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:14]];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        _titleLabel.textColor=kColorFromRGB(0x755833);
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_titleLabel];
        
        
        UILabel* numlabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 3, 300, 30)];
        [numlabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:15]];
        [numlabel setBackgroundColor:[UIColor clearColor]];
        numlabel.textColor=kColorFromRGB(0x80aa0e);
        [numlabel setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:numlabel];
        switch (type) {
            case 0:
                numlabel.text=@"一";
                break;
            case 1:
                numlabel.text=@"二";
                break;
            case 2:
                numlabel.text=@"三";
                break;
            default:
                break;
        }

        
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.cornerRadius  = 6;
        
        self.layer.borderColor = BORDERColor.CGColor;
        self.layer.borderWidth = 1;
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 22, 300, 1)];
        line.backgroundColor = BGColor;
        //[self addSubview:line];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame title:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 300, 30)];
        [_titleLabel setText:title];
        
        [_titleLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:14]];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        _titleLabel.textColor=kColorFromRGB(0x755833);
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_titleLabel];
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.cornerRadius  = 6;
        
        self.layer.borderColor = BORDERColor.CGColor;
        self.layer.borderWidth = 1;
      
        
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame title:(NSString *)title titleimagename:(NSString*)imagename
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius  = 6;
        self.layer.borderColor = BORDERColor.CGColor;
        self.layer.borderWidth = 1;
        
        UIImageView * imageview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 8, 25, 25)];
        imageview.image=[UIImage imageNamed:imagename];
        [self addSubview:imageview];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFrameSetRight(imageview)+5, 4, 160, 30)];
        [_titleLabel setText:title];
        
        [_titleLabel setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:14]];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        _titleLabel.textColor=kColorFromRGB(0x755833);
        [_titleLabel setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_titleLabel];
        
        
    }
    return self;
    
}


//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//}


@end
