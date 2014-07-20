//
//  HKTabBarController.m
//  HK
//
//  Created by 马涛 on 14-4-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKTabBarController.h"

@interface HKTabBarController ()

@property (nonatomic,strong) HKNavigationController *userNavi;
@property (nonatomic,strong) HKNavigationController *mainNavi;
@property (nonatomic,strong) HKNavigationController *infoNavi;

@end

@implementation HKTabBarController



- (id)init
{
    self = [super init];
    if (self) {
        
  
    
    }
    return self;
}
//- (void)viewDidAppear:(BOOL)animated{
//    [self hideRealTabBar];
//    [self customTabBar];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"selectXiaDan" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(selectXiaDan) name: @"selectXiaDan" object: nil];
    
#warning 设置默认选中立即下单.
//     [[NSNotificationCenter defaultCenter] postNotificationName:@"selectXiaDan" object:self];
    
    self.currentSelectedIndex = -1;
    
    _userNavi = [[HKNavigationController alloc] init];
    StartViewController *startVC = [[StartViewController alloc] init];
    
    UITabBarItem *orderItem=[[UITabBarItem alloc]initWithTitle:@"立即下单" image:[UIImage imageNamed:@"tabbar_order.png"] tag:0];
    _userNavi.tabBarItem=orderItem;
    [_userNavi addChildViewController:startVC];
    
    
    _mainNavi = [[HKNavigationController alloc] init];
    HKMainTableViewController *mainTable = [[HKMainTableViewController alloc] init];
    
    UITabBarItem *userItem=[[UITabBarItem alloc]initWithTitle:@"个人中心" image:[UIImage imageNamed:@"tabbar_user.png"] tag:1];
    _mainNavi.tabBarItem=userItem;
    [_mainNavi addChildViewController:mainTable];
    _mainNavi.tabBarItem.tag = 1;
    
    
    _infoNavi = [[HKNavigationController alloc] init];
    HKInfoTableViewController *infoTable = [[HKInfoTableViewController alloc] init];
    
    
    UITabBarItem *introItem = [[UITabBarItem alloc]initWithTitle:@"服务介绍" image:[UIImage imageNamed:@"tabbar_intro.png"] tag:2];
    _infoNavi.tabBarItem = introItem;
    
    [_infoNavi addChildViewController:infoTable];
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    UITabBarItem *contactItem = [[UITabBarItem alloc]initWithTitle:@"联系客服" image:[UIImage imageNamed:@"tabbar_contact.png"] tag:3];
    vc.tabBarItem = contactItem;
    vc.tabBarItem.tag = 3;
    
    
    [self addChildViewController:_userNavi];
    [self addChildViewController:_mainNavi];
    [self addChildViewController:_infoNavi];
    [self addChildViewController:vc];
    
    
    [self hideRealTabBar];
    [self customTabBar];

}

- (void)hideRealTabBar{
    for(UIView *view in self.view.subviews){
        if([view isKindOfClass:[UITabBar class]]){
            view.hidden = YES;
            break;
        }
    }
}
- (void)customTabBar{
    
    
    NSArray * imageN = @[@{@"normal": @"tab_xiadan_n",
                           @"select": @"tab_xiadan_s"},
                         @{@"normal": @"tab_zhongxin_n",
                           @"select": @"tab_zhongxin_s"},
                         @{@"normal": @"tab_fuwu_n",
                           @"select": @"tab_fuwu_s"},
                         @{@"normal": @"tab_kefu_n",
                           @"select": @"tab_kefu_s"},];
    

    int viewCount = self.viewControllers.count > 5 ? 5 : self.viewControllers.count;
    self.buttons = [NSMutableArray arrayWithCapacity:viewCount];
    double _width = 320 / viewCount;
    double _height = self.tabBar.frame.size.height;
    for (int i = 0; i < viewCount; i++) {
        
        NSDictionary * pDic  = [imageN objectAtIndex:i];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*_width,self.tabBar.frame.origin.y, _width, _height);
        
        [btn setBackgroundImage:[UIImage imageNamed:[pDic objectForKey:@"normal"]] forState:UIControlStateNormal];
         [btn setBackgroundImage:[UIImage imageNamed:[pDic objectForKey:@"select"]] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self.buttons addObject:btn];
        [self.view  addSubview:btn];

    }

    [self selectedTab:[self.buttons objectAtIndex:0]];
    
}

- (void)selectedTab:(UIButton *)button{
    
    
    if (button.tag == 3) {
        
        [FrontHelper callService:@"4000018180"];
        return;
    }
    
    for (UIButton * pbtn in self.buttons) {
        
        if (button == pbtn) {
            pbtn.selected = YES;
        }else {
            pbtn.selected = NO;
        }
    }
    
    if (self.currentSelectedIndex == button.tag) {
       
        return;
    }

    self.currentSelectedIndex = button.tag;
    self.selectedIndex = self.currentSelectedIndex;
    
}

- (void)selectXiaDan{
    for (UIButton * pbtn in self.buttons) {
        pbtn.selected = NO;
    }
    
    ((UIButton*)self.buttons[0]).selected = YES;
    self.currentSelectedIndex = 0;
    self.selectedIndex = self.currentSelectedIndex;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

@end
