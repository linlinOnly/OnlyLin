//
//  HKMainTableViewController.m
//  HK
//
//  Created by 马涛 on 14-4-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKMainTableViewController.h"
#import "HKNavigationController.h"
@interface HKMainTableViewController ()

@end

@implementation HKMainTableViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"个人中心";
        UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        [customLab setTextColor:[UIColor whiteColor]];
        customLab.textAlignment= NSTextAlignmentCenter;
        customLab.backgroundColor = [UIColor clearColor];
        [customLab setText:self.title];
        customLab.font = [UIFont boldSystemFontOfSize:20];
        self.navigationItem.titleView = customLab;
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    if (![FrontHelper checkLogin]) {
        HKLoginViewController *loginCV = [[HKLoginViewController alloc] init];
        HKNavigationController *loginNavi = [[HKNavigationController alloc] initWithRootViewController:loginCV];
        [self presentViewController:loginNavi animated:YES completion:nil];
    }else
    {
        if (_rightButton == nil) {

            UIButton * rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
            [rightBtn setTitle:@"退出" forState:UIControlStateNormal];
            [rightBtn setTitleColor:kColorFromRGB(0xb2ed1b) forState:UIControlStateNormal];
            [rightBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];

            _rightButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
            self.navigationItem.rightBarButtonItem = _rightButton;
        }
        [self.navigationItem setRightBarButtonItem:_rightButton];

    }
}
-(void)logout
{
    [FrontHelper logout];
    HKLoginViewController *loginCV = [[HKLoginViewController alloc] init];
//    HKNavigationController *loginNavi = [[HKNavigationController alloc] initWithRootViewController:loginCV];
//    [self.navigationController pushViewController:loginCV animated:YES];
//    [self presentViewController:loginNavi animated:YES completion:nil];
    [self presentViewController:loginCV animated:YES completion:nil];
    
}
-(void)toLoginPage
{
    
    HKLoginViewController *loginCV = [[HKLoginViewController alloc] init];
    HKNavigationController *loginNavi = [[HKNavigationController alloc] initWithRootViewController:loginCV];
    
    [self presentViewController:loginNavi animated:YES completion:nil];
}
- (void)viewDidLoad
{
//    if (![FrontHelper checkLogin]) {
//        HKLoginViewController *loginController = [[HKLoginViewController alloc] init];
//        [self.navigationController pushViewController:loginController animated:YES];
//    }
    
    _orderList = [[NSArray alloc] init];
    [super viewDidLoad];
    
    _listModel = [[HKOrderListModel alloc] init];
    _listModel.delegate = self;
    _itemModel = [[HKOrderItemModel alloc] init];
    
    //余额视图
    HKRoundCornerView * balanceview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, 10, 300, 40) title:@"账户余额" titleimagename:@"arrow"];
    [self.view addSubview:balanceview];
    UIImageView * balanceviewright=[[UIImageView alloc]initWithFrame:CGRectMake(270, 8, 25, 25)];
    balanceviewright.image=[UIImage imageNamed:@"arrow"];
    [balanceview addSubview:balanceviewright];
    
    _balancelabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 0, 160, 40)];
    _balancelabel.textColor=kColorFromRGB(0xff8533);
//    [_balancelabel setBackgroundColor:[UIColor redColor]];
    _balancelabel.textAlignment=NSTextAlignmentRight;
    _balancelabel.text=@"0";
    [balanceview addSubview:_balancelabel];
    
    //家庭住址视图
    HKRoundCornerView * homeAddressview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(balanceview)+10, 300, 40) title:@"家庭住址" titleimagename:@"arrow"];
    [self.view addSubview:homeAddressview];
    UIButton * homeAddressright=[[UIButton alloc]initWithFrame:CGRectMake(270, 8, 25, 25)];
    [homeAddressright setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [homeAddressright addTarget:self action:@selector(homeAddressrightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [homeAddressview addSubview:homeAddressright];
   
    
    //我的订单视图
    HKRoundCornerView * oderview=[[HKRoundCornerView alloc]initWithFrame:CGRectMake(10, kFrameSetBottom(homeAddressview)+10, 300, 40) title:@"我的订单" titleimagename:@"arrow"];
    [self.view addSubview:oderview];
    
    UIButton * oderviewright=[[UIButton alloc]initWithFrame:CGRectMake(270, 8, 25, 25)];
    [oderviewright setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [oderviewright addTarget:self action:@selector(oderviewrightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [oderview addSubview:oderviewright];
    
    
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.backgroundColor =[UIColor whiteColor];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}
-(void)oderviewrightBtnClick:(UIButton*)Btn
{
    
}
-(void)homeAddressrightBtnClick:(UIButton*)Btn
{
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_listModel sendPostToServer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return [_orderList count];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
//{
//    
//    switch ([[[_orderList objectAtIndex:indexPath.row] objectForKey:@"order_status"] intValue])
//    {
//        case 0:
//            return 105.0;
//            break;
//            
//        default:
//            break;
//    }
//    
//    
//    return 140.0;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"OrderCell";
//    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    static NSString *ExtCellIdentifier = @"OrderCellExt";
//    OrderExtCell *extCell = [tableView dequeueReusableCellWithIdentifier:ExtCellIdentifier];
//    
//    
//    [_itemModel fillItembyDic:[_orderList objectAtIndex:indexPath.row]];
//    
////    NSLog(@"item Model  %@",[_orderList objectAtIndex:indexPath.row]);
//    
//    switch (_itemModel.order_status)
//    {
//        case 0:
//        {
//            if (cell == nil) {
//                cell = [[OrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//            }
//            [cell fillWithItemModel:_itemModel];
//            return cell;
//        }
//            break;
//            
//        default:
//        {            
//            if (extCell == nil) {
//                extCell =[[OrderExtCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ExtCellIdentifier];
//            }
//            [extCell fillWithItemModel:_itemModel];
//            [extCell.infoView.againBtn addTarget:self action:@selector(jumpToStart) forControlEvents:UIControlEventTouchUpInside];
//            return extCell;
//        }
//            break;
//    }
//
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self postToServer:[FrontHelper getLoginInfo] order:[[_orderList objectAtIndex:indexPath.row] objectForKey:@"order_id"]];
//}
//
//
-(void)orderDetailRequestFinish:(NSDictionary *)dic
{
//    NSLog(@"orderList %@",dic);
}


-(void)sendOrderListFinish:(NSDictionary *)dic
{
    
    if ([[dic objectForKey:@"code"] intValue] != 108) {
        [SVProgressHUD dismissWithError:@"获取订单列表出错"];
    }
    else
    {
        _orderList = [dic objectForKey:@"result"];
        
        
        
        
        [SVProgressHUD dismiss];
        
//        [self.tableView reloadData];
    }
}

-(void)postToServer:(NSString *)mobile order:(NSString *)orderId
{
    NSString *token = [[NSString alloc] init];
    //订单详情
    token = [FrontHelper tokenController:@"order" action:@"view"];
   
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/order/view"];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:mobile forKey:@"mobile"];
    [request addPostValue:orderId forKey:@"order_id"];
    [request addPostValue:token forKey:@"token"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request setTag:100000];
    if ([FrontHelper getNetStatus] == 0) {
        [SVProgressHUD showErrorWithStatus_custom:@"无网络连接" duration:1.0];
        return;
    }
    [request startAsynchronous];
    
    
}

- (void)requestStarted:(ASIHTTPRequest *)request
{
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD showWithStatus:@"订单查询中..." maskType:SVProgressHUDMaskTypeClear];
    
}

- (void)request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders
{
    
    //    NSLog(@"heads %@",responseHeaders);
    
}

- (void)request:(ASIHTTPRequest *)request willRedirectToURL:(NSURL *)newURL
{
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
   
    
    [SVProgressHUD dismiss];
    
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:&err];
    
//     NSLog(@"%@",jsonDic);
    
    HKOrderDetailInfoModel *im = [[HKOrderDetailInfoModel alloc] initWithDic:jsonDic];
    
    if (im.order_status) {
        _detailVC = [[HKorderDetailTableController alloc] initWithStyle:UITableViewStylePlain andDic:jsonDic];
        
        [self.navigationController pushViewController:_detailVC animated:YES];
    }
    else
    {
        _detail2VC = [[HKOrderDetail2TableViewController alloc] initWithStyle:UITableViewStylePlain andDic:jsonDic];
        
        [self.navigationController pushViewController:_detail2VC animated:YES];
    }
    

}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"failed");
    [SVProgressHUD dismissWithError:@"获取订单信息失败"];
}

- (void)requestRedirected:(ASIHTTPRequest *)request
{
    NSLog(@"redirected,%@",request.postBody);
}


-(void)jumpToStart
{
    [self.tabBarController setSelectedIndex:0];
}


@end
