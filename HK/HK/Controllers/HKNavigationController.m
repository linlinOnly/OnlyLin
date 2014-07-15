//
//  HKNavigationController.m
//  HK
//
//  Created by 马涛 on 14-4-26.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HKNavigationController.h"

@interface HKNavigationController ()

@end

@implementation HKNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    float height = 0;
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        height = 64;
        
    }else {
        height = 44;
    }
    
    UIImage * image= [UIImage imageNamed:@"navbar"];
    
    if ([UINavigationBar instancesRespondToSelector:@selector(setBackgroundImage:forBarMetrics:)]){
        
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setFrame:CGRectMake(0, 0, self.navigationBar.frame.size.width, height)];
    }else {
        
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.navigationBar.frame.size.width, height)];
        view.image = image;
        [self.navigationBar insertSubview:view atIndex:1];
        

    }
    
    
    
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
