//
//  HKOrderDetail2TableViewController.m
//  HK
//
//  Created by 马涛 on 14-5-11.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKOrderDetail2TableViewController.h"

@interface HKOrderDetail2TableViewController ()

@end

@implementation HKOrderDetail2TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style andDic:(NSDictionary *)dic
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    return 3;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            //
            return 160;
            break;
        case 1:
            return 135;
            break;
            
        default:
            return 130;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *infoStr = @"orderInfoCellIdentifier";
    static NSString *keeperStr = @"keeperInfoCellIdentifier";
    static NSString *eoStr = @"eoInfoCellIdentifier";
    
    switch (indexPath.row) {
        case 0:
        {
            HKOrderInfoTableViewCell *infoCell = [tableView dequeueReusableCellWithIdentifier:infoStr];
            if (infoCell == nil) {
                infoCell = [[HKOrderInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:infoStr dic:_model];
            }
            return infoCell;
        }
            break;
            
        case 2:
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

@end
