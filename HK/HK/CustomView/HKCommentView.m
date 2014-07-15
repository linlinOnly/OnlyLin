//
//  HKCommentView.m
//  HK
//
//  Created by 马涛 on 14-5-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKCommentView.h"

@implementation HKCommentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
        
        _segBtn = [[UISegmentedControl alloc] initWithFrame:CGRectMake(5, 5, 60, 20)];
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(240, 5, 70, 20)];
        
        _tv = [[UITextView alloc] initWithFrame:CGRectMake(5, 30, 300, 60)];
        
        
        [_btn setTitle:@"提交" forState:UIControlStateNormal];
        [_tv setBackgroundColor:[UIColor orangeColor]];
        
        [_btn addTarget:self action:@selector(submitComment) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_segBtn];
        [self addSubview:_btn];
        [self addSubview:_tv];
        
        
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame andDic:(HKOrderDetailInfoModel *)im
{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        int status = im.isComment;
        NSString *comment = [[NSString alloc] init];
        comment = im.comment;
        int flag = [im.evaluation intValue];
        
        
        if (!status)
        {
            
            NSArray *source = [[NSArray alloc] initWithObjects:@"好评",@"差评", nil];
            
            
            _segBtn = [[UISegmentedControl alloc] initWithItems:source];
            [_segBtn setFrame:CGRectMake(15, 0, 70, 25)];
            
            _segBtn.selectedSegmentIndex = 0;
            [_segBtn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor],NSForegroundColorAttributeName,VBGColor,NSBackgroundColorAttributeName,[UIFont systemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateNormal];
            [_segBtn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName,VBGColor,NSBackgroundColorAttributeName,[UIFont systemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateSelected];
            _segBtn.tintColor = [UIColor clearColor];

            _btn = [[UIButton alloc] initWithFrame:CGRectMake(230, 3, 70, 20)];
            [_btn setTitleColor:MYBLUEGColor forState:UIControlStateNormal];
            
            UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 300, 1)];
            [line setBackgroundColor:BORDERColor];
            
            _tv = [[UITextView alloc] initWithFrame:CGRectMake(15, 30, 270, 60)];
            _tv.delegate = self;
            _tv.backgroundColor = [UIColor clearColor];
            
            _placeHolder = [[UILabel alloc] initWithFrame:CGRectMake(18, 33, 270,20)];
            _placeHolder.enabled = NO;
            _placeHolder.backgroundColor = [UIColor clearColor];
            _placeHolder.text = @"请输入评价内容";
            _placeHolder.font = [UIFont systemFontOfSize:14];
            
            [_btn setTitle:@"提交" forState:UIControlStateNormal];
            [_btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
            
            [_btn addTarget:self action:@selector(submitComment) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:line];
            [self addSubview:_segBtn];
            [self addSubview:_btn];
            [self addSubview:_tv];
            [self addSubview:_placeHolder];
        }
        else
        {
            _title = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 290, 16)];
            _title.backgroundColor = [UIColor clearColor];
            _title.textAlignment = NSTextAlignmentCenter;
            _title.text = @"我的评价";
            _title.font = [UIFont systemFontOfSize:14];
            
            UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 300, 1)];
            [line setBackgroundColor:BORDERColor];
            
            _commentFlag = [[UILabel alloc] initWithFrame:CGRectMake(5, 40, 60, 32 )];
            _commentFlag.textColor = [UIColor redColor];
            _commentFlag.textAlignment = NSTextAlignmentCenter;
            _commentFlag.text = flag==2?@"差评":@"好评";
            
            _tv = [[UITextView alloc] initWithFrame:CGRectMake(70, 40, 215, 40)];
            _tv.editable = false;
            _tv.text = comment;
            _tv.backgroundColor = [UIColor clearColor];
            
            [self addSubview:line];
            [self addSubview:_title];
            [self addSubview:_commentFlag];
            [self addSubview:_tv];
            
        }
        
        
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


-(void)submitComment
{
    _model = [[HKCommentModel alloc] initWithOrderId:_btn.tag Status:_segBtn.selectedSegmentIndex + 1 Comment:_tv.text];
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
    _title = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 290, 16)];
    _title.backgroundColor = [UIColor clearColor];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.text = @"我的评价";
    _title.font = [UIFont systemFontOfSize:14];

    
    _commentFlag = [[UILabel alloc] initWithFrame:CGRectMake(5, 40, 60, 32 )];
    _commentFlag.textColor = [UIColor redColor];
    _commentFlag.backgroundColor = [UIColor clearColor];
    _commentFlag.textAlignment = NSTextAlignmentCenter;
    _commentFlag.text = _segBtn.selectedSegmentIndex?@"差评":@"好评";
    
    [_tv setFrame:CGRectMake(70, 40, 215, 40)];
    _tv.editable = false;
    _tv.backgroundColor = [UIColor clearColor];
    
    
    
    [_segBtn removeFromSuperview];
    [_btn removeFromSuperview];
    [_placeHolder removeFromSuperview];
    [self addSubview:_title];
    [self addSubview:_commentFlag];
}


-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length <= 0) {
        _placeHolder.hidden = false;
    }
    else
    {
        _placeHolder.hidden = true;
    }
    
}

@end
