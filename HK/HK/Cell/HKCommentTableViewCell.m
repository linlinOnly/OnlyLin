//
//  HKCommentTableViewCell.m
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKCommentTableViewCell.h"

@implementation HKCommentTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andDic:(HKOrderDetailInfoModel *)model
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _commentView = [[HKCommentView alloc] initWithFrame:CGRectMake(10, 20, 300, 90) andDic:model];
        
        
        _commentView.layer.cornerRadius = 6.0;
        _commentView.backgroundColor = VBGColor;
        _commentView.layer.borderColor = BORDERColor.CGColor;
        _commentView.layer.borderWidth = 1;
        
        _commentView.btn.tag = [model.order_id intValue];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = BGColor;
        [self addSubview:_commentView ];
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

@end
