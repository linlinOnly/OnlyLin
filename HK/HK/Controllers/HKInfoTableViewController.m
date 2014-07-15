//
//  HKInfoTableViewController.m
//  HK
//
//  Created by 马涛 on 14-5-2.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKInfoTableViewController.h"

@interface HKInfoTableViewController ()
@property (nonatomic,strong) UIScrollView *bottomScorllView;
@property (nonatomic,strong) NSArray *infoArr;

@end

@implementation HKInfoTableViewController

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
    
//    self.tableView.layer.cornerRadius = 5;
    
    self.title = @"服务介绍";
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    customLab.backgroundColor = [UIColor clearColor];
    [customLab setTextColor:[UIColor whiteColor]];
    customLab.textAlignment= NSTextAlignmentCenter;
    [customLab setText:self.title];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    
    
    _bottomScorllView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    
    _bottomScorllView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    [_bottomScorllView setBackgroundColor:[UIColor whiteColor]];
    [_bottomScorllView setContentSize:CGSizeMake(320, 1000)];
    NSLog(@"%f",self.view.frame.size.height);
    [self.view addSubview:_bottomScorllView];
    
    _infoArr = [[NSArray alloc] initWithObjects:@"关于我们",@"服务价格",@"服务范围",@"登录账号", nil];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(loginStatusChange:) name:@"kLoginStatusChangeNotification" object:nil];

    
    UIImage * rightImage = [UIImage imageNamed:@"bar_telphone"];
    UIButton * rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, rightImage.size.width, rightImage.size.height)];
    [rightBtn setImage:rightImage forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * rightBarBtn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
//   [self.navigationItem setRightBarButtonItem:rightBarBtn];
    
    HKRoundCornerPriceInfoView *aboutView = [[HKRoundCornerPriceInfoView alloc] initWithFrame:CGRectMake(10, 10, 300, 80) title:@"关于我们" viewtype:0];
    [_bottomScorllView addSubview:aboutView];
    
    HKRoundCornerPriceInfoView *priceView = [[HKRoundCornerPriceInfoView alloc] initWithFrame:CGRectMake(10, kFrameSetBottom(aboutView)+10, 300, 210) title:@"服务价格" viewtype:1];
    [_bottomScorllView addSubview:priceView];
    
    HKRoundCornerPriceInfoView *rangeView = [[HKRoundCornerPriceInfoView alloc] initWithFrame:CGRectMake(10, kFrameSetBottom(priceView)+10, 300, 750) title:@"服务范围" viewtype:2];
    [_bottomScorllView addSubview:rangeView];
    
     [_bottomScorllView setContentSize:CGSizeMake(320, kFrameSetBottom(rangeView)+20)];
    
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
//    
//    if ([FrontHelper checkLogin]) {
//        return 4;
//    }
//    else
//    {
//        return 3;
//    }
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    static NSString *infoCellIdentifier = @"infoCell";
//    
//    InfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoCellIdentifier];
//    
//    if (infoCell == nil) {
//        //
//        infoCell = [[InfoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:infoCellIdentifier];
//    }
//    
//    infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    
//    infoCell.title.text = [_infoArr objectAtIndex:indexPath.row];
////    [infoCell.title.textLabel setFont:[UIFont systemFontOfSize:14]];
//    
//    infoCell.title.font = [UIFont systemFontOfSize:16];
//    
//    [infoCell.secondLabel setFont:[UIFont systemFontOfSize:16]];
//    
//    
//    switch (indexPath.row) {
//        case 0:
//        {
//            
//            [infoCell.btn addTarget:self action:@selector(call) forControlEvents:UIControlEventTouchUpInside];
//            infoCell.secondLabel.text = @"4000018180";
//            [infoCell.btn setTitle:@"呼叫" forState:UIControlStateNormal];
//            [infoCell.btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//            [infoCell.btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
//            
//            return infoCell;
//        }
//            break;
//        case 3:
//        {
//            [infoCell.btn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
//            infoCell.secondLabel.text = [FrontHelper getLoginInfo];
//            [infoCell.btn setTitle:@"退出" forState:UIControlStateNormal];
//            [infoCell.btn setTitleColor:MYREDColor forState:UIControlStateNormal];
//            [infoCell.btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
////            [infoCell.btn settit]
//            return infoCell;
//        }
//            break;
//            
//        default:
//            infoCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//            break;
//    }
//    
//    
//    
//    // Configure the cell...
//    
//    return infoCell;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    switch (indexPath.row) {
//        case 1:
//            
//        {
//            IntroductionViewController *indVC = [[IntroductionViewController alloc] init];
//            indVC.title = @"服务说明";
//            [self.navigationController pushViewController:indVC animated:YES];
//        }
//            
//            break;
//        case 2:
//        {
//            
//            AboutViewController *aboutVC = [[AboutViewController alloc] init];
//            aboutVC.title = @"关于我们";
//            [self.navigationController pushViewController:aboutVC animated:YES];
//        }
//            break;
//        case 3:
//            break;
//        default:
//            break;
//    }
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)call
{
    [FrontHelper callService:@"4000018180"];
}

-(void)logout
{
    [FrontHelper logout];
}

-(void)loginStatusChange:(NSNotification *)noti
{
    
    //[self.tableView reloadData];
}

@end
