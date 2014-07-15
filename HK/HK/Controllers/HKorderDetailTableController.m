//
//  HKorderDetailTableController.m
//  HK
//
//  Created by 马涛 on 14-5-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKorderDetailTableController.h"

@interface HKorderDetailTableController ()

@end

@implementation HKorderDetailTableController

- (id)initWithStyle:(UITableViewStyle)style andDic:(NSDictionary *)dic
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
//        _dic = [[NSDictionary alloc] init];
        _model = [[HKOrderDetailInfoModel alloc] initWithDic:dic];
        self.tableView.backgroundColor = BGColor;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        self.title = @"订单详情";
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    [self.navigationItem setLeftBarButtonItem:leftButton];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PayResult:) name:@"payReusltCode" object:nil];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 5;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            //
            return 110;
            break;
        case 1:
            return 120;
            break;
        case 2:
            return 160;
            break;
        case 3:
            return 130;
            break;
        default:
            return 155;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
    
    static NSString *commentStr = @"commentCellIdentifier";
    static NSString *payStr = @"payCellIdentifier";
    static NSString *infoStr = @"orderInfoCellIdentifier";
    static NSString *keeperStr = @"keeperInfoCellIdentifier";
    static NSString *eoStr = @"eoInfoCellIdentifier";
    
    switch (indexPath.row) {
        case 0:
        {
            
            HKCommentTableViewCell *commentCell = [tableView dequeueReusableCellWithIdentifier:commentStr];
            if (commentCell == nil) {
                //
                commentCell = [[HKCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentStr andDic:_model];
            }
            return commentCell;
        }
            break;
        case 1:
        {
            HKPayTableViewCell *payCell = [tableView dequeueReusableCellWithIdentifier:payStr];
            if (payCell == nil) {
                payCell = [[HKPayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:payStr andDic:_model];
            }
            return payCell;
        }
            break;
            
        case 2:
        {
            HKOrderInfoTableViewCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoStr];
            if (infoCell == nil) {
                infoCell = [[HKOrderInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:infoStr dic:_model];
            }
            return infoCell;
           
        }
            break;
        case 3:
        {
            HKKeeperInfo2TableViewCell *keepCell = [tableView dequeueReusableCellWithIdentifier:keeperStr];
            if (keepCell == nil) {
                keepCell = [[HKKeeperInfo2TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:keeperStr dic:_model];
            }
            return keepCell;
            
        }
            break;
            
        default:
        {
            HKEOInfoTableViewCell *eoCell = [tableView dequeueReusableCellWithIdentifier:eoStr];
            if (eoCell == nil) {
                eoCell = [[HKEOInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:eoStr dic:_model];
            }
            return eoCell;
        }
            break;
    }
    
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

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

-(void)PayResult:(NSNotification *)noti
{
    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"payReusltCode" object:nil];

    if ([[[noti userInfo] objectForKey:@"payResultStatus"] isEqualToString:@"9000"])
    {
        HKPayTableViewCell *cell =(HKPayTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] ];
        
        cell.payView.priceLabel.text = [NSString stringWithFormat:@"资金已托管"];
        
        [cell.payView.btn setTitle:@"确认付款" forState:UIControlStateDisabled];
        [cell.payView.btn setBackgroundColor:[UIColor lightGrayColor]];
        [cell.payView.btn setEnabled:false];
        [SVProgressHUD showSuccessWithStatus_custom:@"支付成功" duration:2.0];
    }
    else
    {
        [SVProgressHUD showSuccessWithStatus_custom:@"支付失败" duration:2.0];
    }

    
    NSLog(@"Detail %@",[noti userInfo]);
}

@end
