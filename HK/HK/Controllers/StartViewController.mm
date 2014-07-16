//
//  StartViewController.m
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "StartViewController.h"
#import "OrderSuccessViewController.h"
@interface StartViewController ()

@property (nonatomic,strong) UIBarButtonItem *rightButton;
@property (nonatomic,strong) UIButton  *hourBtn;
@property (nonatomic,strong) UIButton  *reservationBtn;

@property (nonatomic,assign) bool isUserSetLocal;
@property (nonatomic,assign) BOOL hkEditFlag;           //键盘操作反转标记      切勿乱动
@property (nonatomic,assign) BOOL editContinueFlag;     //键盘操作反转标记

@end

@implementation StartViewController


- (id)init
{
    self = [super init];
    if (self) {
        //
        
        self.title = @"立即下单";
        
        UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        [customLab setTextColor:[UIColor whiteColor]];
        customLab.backgroundColor = [UIColor clearColor];
        customLab.textAlignment= NSTextAlignmentCenter;
        [customLab setText:self.title];
        customLab.backgroundColor = [UIColor clearColor];
        customLab.font = [UIFont boldSystemFontOfSize:20];
        self.navigationItem.titleView = customLab;
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
    
    _isUserSetLocal = false;
    _hkEditFlag = false;
    _editContinueFlag = false;
    _order_type=[[NSString alloc]init];
    _order_type=@"1";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginStatusChange:) name:@"kLoginStatusChangeNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localChange:) name:@"kGetLocalByUserSet" object:nil];
    
    
    _mapView = [[BMKMapView alloc] init];
    _search = [[BMKSearch alloc]init];
    
    _bottomScorllView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    _bottomScorllView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [_bottomScorllView setBackgroundColor:[UIColor whiteColor]];
    [_bottomScorllView setContentSize:CGSizeMake(320, 540)];
    
    _hourBtn=[[UIButton alloc]initWithFrame:CGRectMake(20, 10, 135, 39)];
//    [_hourBtn setTitle:@"小时达" forState:UIControlStateNormal];
    [_hourBtn setImage:[UIImage imageNamed:@"hour"] forState:UIControlStateNormal];
    [_hourBtn setImage:[UIImage imageNamed:@"hour_c"] forState:UIControlStateSelected];
    [_hourBtn addTarget:self action:@selector(hourBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_hourBtn setSelected:YES];
    
    _reservationBtn=[[UIButton alloc]initWithFrame:CGRectMake(kFrameSetRight(_hourBtn)+10, 10, 135, 39)];
    [_reservationBtn setSelected:NO];
    [_reservationBtn addTarget:self action:@selector(reservationBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_reservationBtn setImage:[UIImage imageNamed:@"reservation"] forState:UIControlStateNormal];
    [_reservationBtn setImage:[UIImage imageNamed:@"reservation_c"] forState:UIControlStateSelected];
    [_reservationBtn setTitleColor:kColorFromRGB(0x3d8902) forState:UIControlStateNormal];
    
    
    _timeLongView = [[HKRoundCornerTimeLongView alloc] initWithFrame:CGRectMake(10, kFrameSetBottom(_hourBtn), 300, 100)];
    
    [_bottomScorllView addSubview:_reservationBtn];
    [_bottomScorllView addSubview:_hourBtn];
    [_bottomScorllView addSubview:_timeLongView];
    
    //服务地址
    _localView = [[HKRoundCornerLocalView alloc] initWithFrame:CGRectMake(10, kFrameSetBottom(_timeLongView)+10, 300, 72)];
    [_bottomScorllView addSubview:_localView];
    [_localView.btn addTarget:self action:@selector(toMapController) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    _telView = [[HKRoundCornerTelView alloc] initWithFrame:CGRectMake(10, kFrameSetBottom(_localView)+10, 300, 80)];
    _telView.teltf.tag = 1003;
    _telView.nametf.tag = 1002;
    _telView.nametf.delegate = self;
    _telView.teltf.delegate = self;
   [_bottomScorllView addSubview:_telView];
    
    
    
    _submitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_submitBtn setFrame:CGRectMake(10, kFrameSetBottom(_telView)+10, 300, 40)];
    [_submitBtn addTarget:self action:@selector(submitDataToServer) forControlEvents:UIControlEventTouchUpInside];
    
    [_submitBtn setBackgroundImage:[UIImage imageNamed:@"order"] forState:UIControlStateNormal];
    [_bottomScorllView addSubview:_submitBtn];
    
    

    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    _bottomScorllView.contentSize=CGSizeMake(kFrameW(_bottomScorllView), kFrameSetBottom(_submitBtn)+10);

    [self.view addSubview:_bottomScorllView];
    
}
-(void)setmyframe:(BOOL)isHour
{
    _localView.frame=CGRectMake(10, kFrameSetBottom(_timeLongView)+10, kFrameW(_localView), kFrameH(_localView));
    _telView.frame=CGRectMake(10, kFrameSetBottom(_localView)+10, kFrameW(_telView), kFrameH(_telView));
    [_submitBtn setFrame:CGRectMake(10, kFrameSetBottom(_telView)+10, kFrameW(_submitBtn), kFrameH(_submitBtn))];
    _bottomScorllView.contentSize=CGSizeMake(kFrameW(_bottomScorllView), kFrameSetBottom(_submitBtn)+10);
}
//点击小时达按钮
-(void)hourBtnClick
{
    [_timeLongView setmyframe:YES];
    [_localView setmyframe:YES];
    [self setmyframe:YES];
    [_hourBtn setSelected:YES];
    [_reservationBtn setSelected:NO];
    _order_type=@"1";
}
//点击发起预约按钮
-(void)reservationBtnClick
{
    [_timeLongView setmyframe:NO];
    [_localView setmyframe:NO];
    [self setmyframe:NO];
    [_hourBtn setSelected:NO];
    [_reservationBtn setSelected:YES];
    _order_type=@"2";
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_mapView viewWillAppear];
    
    if (!_isUserSetLocal) {
        _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
        _search.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
        
        NSLog(@"search delegate set");
    }
    
    
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = BMKUserTrackingModeNone;
    
    
    if (![FrontHelper checkLogin]) {
        if (_rightButton == nil) {
            
            UIButton * rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
            [rightBtn setTitle:@"登录" forState:UIControlStateNormal];
            [rightBtn setTitleColor:kColorFromRGB(0xb2ed1b) forState:UIControlStateNormal];
            [rightBtn addTarget:self action:@selector(toLoginPage) forControlEvents:UIControlEventTouchUpInside];
            
            _rightButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
            self.navigationItem.rightBarButtonItem = _rightButton;
        }
        [self.navigationItem setRightBarButtonItem:_rightButton];
        
    }
    else
    {
        _telView.teltf.text = [FrontHelper getLoginInfo];
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _search.delegate = nil; // 不用时，置nil
    NSLog(@"search delegate nil");
    
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

-(void)toMapController
{
    
    //26.102411 119.313652   //initWithX  121.480438,31.236216
    HKBaiduMapViewController *mapVC = [[HKBaiduMapViewController alloc] initWithX:31.236216 Y:121.480438];
        
    [self.navigationController pushViewController:mapVC animated:YES];
}


-(void)toLoginPage
{
    
    HKLoginViewController *loginCV = [[HKLoginViewController alloc] init];
    HKNavigationController *loginNavi = [[HKNavigationController alloc] initWithRootViewController:loginCV];
    
    [self presentViewController:loginNavi animated:YES completion:nil];
}


-(void)submitDataToServer
{
    [self sendOrderFinish:nil];
    return;
    if (![FrontHelper checkLogin]) {
        [self toLoginPage];
        return;
    }
    
    _order = [[HKOrderModel alloc] initWithDate:_localView.date local:_localView.tv.text tel:_telView.teltf.text production_id:_timeLongView.serverTimeLong name:_telView.nametf.text serverType:_timeLongView.service_type oderType:_order_type];
    
    
    _order.delegate = self;
    
    [_order sendPostToServer];
    
}



-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_localView.tv resignFirstResponder];
    [_telView.teltf resignFirstResponder];
    [_telView.nametf resignFirstResponder];
}

-(void)sendOrderFinish:(NSDictionary *)dic
{
//    if ([[dic objectForKey:@"code"] intValue] == 108)
    {
        [SVProgressHUD dismissWithSuccess:@"下单成功"];
        _order = [[HKOrderModel alloc] initWithDate:_localView.date local:_localView.tv.text tel:_telView.teltf.text production_id:_timeLongView.serverTimeLong name:_telView.nametf.text serverType:_timeLongView.service_type oderType:_order_type];
        
        OrderSuccessViewController * ordersuccessview=[OrderSuccessViewController alloc];
        ordersuccessview.data=[dic objectForKey:@"order"];
        ordersuccessview = [ordersuccessview init];
        [self.navigationController pushViewController:ordersuccessview animated:YES];
        
    }
    
//    else
//    {
//        [SVProgressHUD dismissWithError:@"下单失败"];
//    }

    
}


-(void)orderFailed
{
    [SVProgressHUD dismissWithError:@"下单失败"];
}

-(void)loginStatusChange:(NSNotification *)noti
{
    
    switch ([[[noti userInfo] objectForKey:@"loginStatus"] intValue]) {
        case 1:
        {
            [self.navigationItem setRightBarButtonItem:nil];
        }
            break;
            
        default:
        {
            if (_rightButton == nil) {
                UIButton * rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
                [rightBtn setTitle:@"登录" forState:UIControlStateNormal];
                [rightBtn setTitleColor:kColorFromRGB(0xb2ed1b) forState:UIControlStateNormal];
                [rightBtn addTarget:self action:@selector(toLoginPage) forControlEvents:UIControlEventTouchUpInside];
                
                _rightButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
                self.navigationItem.rightBarButtonItem = _rightButton;
//                _rightButton = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStyleDone target:self action:@selector(toLoginPage)];
            }
            
            [self.navigationItem setRightBarButtonItem:_rightButton];
        }
            break;
    }
    
}

-(void)localChange:(NSNotification *)noti
{
    [_localView.tv setText:[[noti userInfo] objectForKey:@"local"]];
 
    
    _isUserSetLocal = true;
    
}

/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)mapViewWillStartLocatingUser:(BMKMapView *)mapView
{
	NSLog(@"start locate");
}

/**
 *用户位置更新后，会调用此函数
 *@param mapView 地图View
 *@param userLocation 新的用户位置
 */

- (void)mapView:(BMKMapView *)mapView didUpdateUserLocation:(BMKUserLocation *)userLocation
{
	if (userLocation != nil) {
		NSLog(@"%f %f", userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
        
        [self reverseGeocodeX:userLocation.location.coordinate.longitude Y:userLocation.location.coordinate.latitude];
        
        //成功后停用
        mapView.showsUserLocation = NO;
	}
    
    
    // 纬度(Y):26.102411; 经度(X):119.313652
	
}
/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)mapViewDidStopLocatingUser:(BMKMapView *)mapView
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(BMKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error %@",error.description);
    
    
    _localView.tv.placeholder = @"定位失败";
}


- (void)onGetAddrResult:(BMKSearch*)searcher result:(BMKAddrInfo*)result errorCode:(int)error
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
	[_mapView removeAnnotations:array];
	array = [NSArray arrayWithArray:_mapView.overlays];
	[_mapView removeOverlays:array];
    
	if (error == 0) {
		BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
		item.coordinate = result.geoPt;
		item.title = result.strAddr;
        
        NSLog(@"here is %@",item.title);
        
        _localView.tv.text = item.title;
        
        _search.delegate = nil; //定位成功后停用，避免覆盖用户输入地址和地图控制器回传地址信息
        _mapView.delegate = nil;
	}

}


-(void)reverseGeocodeX:(float)x Y:(float)y
{
//    NSLog(@"checking。。。 %@",_search.delegeate);
    
	CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0, 0};
		pt = (CLLocationCoordinate2D){y, x};
    
	BOOL flag = [_search reverseGeocode:pt];
	if (flag) {
		NSLog(@"ReverseGeocode search success.");
        
	}
    else{
        NSLog(@"ReverseGeocode search failed!");
    }
}


//-(void)keyboardWillShow:(NSNotificationCenter *)nc
//{
//    
//}
//
//-(void)keyboardWillHide:(NSNotificationCenter *)nc
//{
//    
//}




- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 1002 || textField.tag == 1003) {
        //
        if (_hkEditFlag) {
            return;
        }
        else
        {
            _hkEditFlag = true;
        }
        
        [UIView animateWithDuration:0.5 animations:^{
            [_bottomScorllView setFrame:CGRectMake(0, 0, 320, self.view.frame.size.height - 108)];
            [_bottomScorllView setContentOffset:CGPointMake(0, 108)];
        }];
        
        _editContinueFlag = false;
        
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 1002 || textField.tag == 1003) {
        //
        
        if (_editContinueFlag) {
            _editContinueFlag = false;
            return;
        }
        else
        {
            _hkEditFlag = false;
        
            [UIView animateWithDuration:0.5 animations:^{
                [_bottomScorllView setFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
                [_bottomScorllView setContentOffset:CGPointMake(0, 0)];
            }];
        }
        
    }
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _editContinueFlag = true;
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == 1002 || textField.tag == 1003) {
        [textField resignFirstResponder];
    }
    return YES;
}


@end
