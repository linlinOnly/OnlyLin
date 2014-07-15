//
//  InfoCell.m
//  HK
//
//  Created by 马涛 on 14-5-2.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "InfoCell.h"

@implementation InfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        _title = [[UILabel alloc] initWithFrame:CGRectMake(20, 7, 80, 30)];
        _secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 7, 160, 30)];
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(260, 7, 40, 30)];
        
        _title.backgroundColor = [UIColor clearColor];
        _secondLabel.backgroundColor = [UIColor clearColor];
        _btn.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_btn];
        [self addSubview:_title];
        [self addSubview:_secondLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//-(void)setButtonSelector:(SEL)selector andName:(NSString *)nameStr
//{
//    [_btn setTitle:nameStr forState:UIControlStateNormal];
//    [_btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
//}


@end
