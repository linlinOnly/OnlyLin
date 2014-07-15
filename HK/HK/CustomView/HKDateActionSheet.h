//
//  HKDateActionSheet.h
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrontHelper.h"
@protocol HKDateActionSheetDelegate <NSObject>

@optional

-(void)cancle;
-(void)sure:(NSString *)date;

@end



@interface HKDateActionSheet : UIActionSheet<UIPickerViewDelegate,UIPickerViewDataSource>



@property (nonatomic,strong) UIDatePicker *picker;

@property (nonatomic,strong) NSString *pickDay;
@property (nonatomic,strong) NSString *pickHour;
@property (nonatomic,strong) NSString *pickMinute;

@property (nonatomic,strong) UIPickerView *pv;

@property (nonatomic,strong) UIButton *btnSure;
@property (nonatomic,strong) UIButton *btnCancel;

@property (nonatomic,strong) NSArray *minutes;
@property (nonatomic,strong) NSArray *hours;
@property (nonatomic,strong) NSMutableArray *days;


@property (nonatomic,assign) id<HKDateActionSheetDelegate> hkdelegate;


@end
