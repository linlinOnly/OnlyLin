//
//  HKDateActionSheet.m
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKDateActionSheet.h"


@implementation HKDateActionSheet



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
//        _picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 20, 320, 160)];
//        _picker.datePickerMode = UIDatePickerModeDateAndTime;
//        _picker.maximumDate = [FrontHelper weekLater];
//        _picker.minimumDate = [FrontHelper getTorromow];
//        _picker.minuteInterval = 30;
//        [self addSubview:_picker];
        
        
        _pv = [[UIPickerView alloc] init];
        _pv.showsSelectionIndicator = YES;
        _btnCancel = [[UIButton alloc] init];
        _btnSure = [[UIButton alloc] init];

//        _pv = [[UIPickerView alloc] initWithFrame:CGRectMake(30, 20, 260, 200)];
//        _btnCancel = [[UIButton alloc] initWithFrame:CGRectMake(10, 16, 48, 24)];
//        _btnSure = [[UIButton alloc] initWithFrame:CGRectMake(262, 16, 48, 24)];
        
        if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
        {

            [_pv setFrame:CGRectMake(30, 20, 260, 200)];
            [_btnCancel setFrame:CGRectMake(10, 16, 48, 24)];
            [_btnSure setFrame:CGRectMake(262, 16, 48, 24)];
            [_btnCancel setTitleColor:MYBLUEGColor forState:UIControlStateNormal];
            [_btnSure setTitleColor:MYBLUEGColor forState:UIControlStateNormal];
        }
        else
        {
            [_pv setFrame:CGRectMake(30, 40, 260, 120)];
            [_btnCancel setFrame:CGRectMake(10, 16, 48, 24)];
            [_btnSure setFrame:CGRectMake(262, 16, 48, 24)];
//            [_btnSure set]
        }
        
        
        _pv.delegate = self;
        [self addSubview:_pv];
        

        
        _btnCancel.titleLabel.font = [UIFont systemFontOfSize:14];
        _btnSure.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [_btnCancel setTitle:@"取消" forState:UIControlStateNormal];
        [_btnSure setTitle:@"确定" forState:UIControlStateNormal];
        
        [_btnSure.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_btnCancel.titleLabel setTextAlignment:NSTextAlignmentCenter];
        
        [_btnCancel addTarget:self action:@selector(btnCancleClick) forControlEvents:UIControlEventTouchUpInside];
        [_btnSure addTarget:self action:@selector(btnSureClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        _minutes = [[NSArray alloc] initWithObjects:@"00",@"30", nil];
        _hours = [[NSArray alloc] initWithObjects:@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18", nil];
        _days = [[NSMutableArray alloc] initWithArray:[FrontHelper weekInStr] copyItems:YES];
        
        _pickDay = [[NSString alloc] initWithFormat:@"%@",[_days objectAtIndex:0]];
        _pickHour = [[NSString alloc] initWithFormat:@"%@",[_hours objectAtIndex:0]];
        _pickMinute = [[NSString alloc] initWithFormat:@"%@",[_minutes objectAtIndex:0]];

        
        
        [self addSubview:_btnSure];
        [self addSubview:_btnCancel];
    }
    return self;
}


-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    CGRect frame = [self frame];
    
//    frame.origin.y -= _picker.frame.size.height -20.0;
//    frame.size.height += _picker.frame.size.height -20.0;
    
    frame.origin.y -= _pv.frame.size.height -20.0;
    frame.size.height += _pv.frame.size.height -20.0;
    
    [self setFrame:frame];
}


-(void)btnSureClick
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
    
    if ([_hkdelegate respondsToSelector:@selector(sure:)])
    {

        NSString *pickStr = [[NSString alloc] init];
        pickStr = [pickStr stringByAppendingFormat:@"%@ %@:%@",_pickDay,_pickHour,_pickMinute];
        
        [_hkdelegate sure:pickStr];
    }
}

-(void)btnCancleClick
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
    if ([_hkdelegate respondsToSelector:@selector(cancle)]) {
        [_hkdelegate cancle];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
//    return 7;
    
    switch (component) {
        case 0:
            return 7;
            break;
        case 1:
            return 10;
        case 2:
            return 2;
        default:
            return 0;
            break;
    }
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return 140;
            break;
        case 1:
            return 55;
        case 2:
            return 55;
        default:
            return 0;
            break;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            //
            return [_days objectAtIndex:row];
            break;
        case 1:
            return [_hours objectAtIndex:row];
            break;
        case 2:
            //
            return [_minutes objectAtIndex:row];
            break;
        default:
            return nil;
            break;
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    switch (component) {
        case 0:
            //
            
            _pickDay = [_days objectAtIndex:row];
            
            break;
        case 1:
            _pickHour = [_hours objectAtIndex:row];
            break;
        case 2:
            //
            _pickMinute  = [_minutes objectAtIndex:row];
            break;
        default:
            break;
    }
    
    
    
    
    
}

@end
