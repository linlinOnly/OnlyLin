//
//  AppDelegate.m
//  HK
//
//  Created by 马涛 on 14-4-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "AppDelegate.h"
#import "AlixPayResult.h"
#import "DataVerifier.h"
#import "PartnerConfig.h"

#import "UMSocial.h"

BMKMapManager* _mapManager;

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [UMSocialData setAppKey:kUMengAppKey];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object: nil];
    _hostReach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [_hostReach startNotifier];
    
    
    
      
    
    _mapManager = [[BMKMapManager alloc] init];
    BOOL ret = [_mapManager start:@"I8GD9WzsLLnYRd44ZQoF4Gib" generalDelegate:self];
    
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    _tab = [[HKTabBarController alloc] init];
    [_tab setDelegate:self];
    
    [_window setRootViewController:_tab];
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeNewsstandContentAvailability];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    switch (viewController.tabBarItem.tag) {
        case 1:
        {
            if (![FrontHelper checkLogin]) {
                
                HKLoginViewController *loginController = [[HKLoginViewController alloc] init];
                HKNavigationController *navi = [[HKNavigationController alloc] initWithRootViewController:loginController];
                [_tab presentViewController:navi animated:YES completion:nil];
                
                return false;
            }
            return true;
        }
            break;
        case 3:
        {
            [FrontHelper callService:@"4000018180"];
            return false;
        }
            break;
            
        default:
            return true;
            break;
    }
}

- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
    
}

- (void)onGetPermissionState:(int)iError
{
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}

-(void)reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    NetworkStatus status = [curReach currentReachabilityStatus];
    
    if (status == NotReachable) {
        //
        
    }
    
    switch (status) {
        case NotReachable:
        {
            [SVProgressHUD showErrorWithStatus_custom:@"网络已断开" duration:1.0];
            [FrontHelper setNetStatus:@"0"];
            break;
        }
        case kReachableViaWiFi:
        {
            [SVProgressHUD showSuccessWithStatus_custom:@"已连接Wifi" duration:1.0];
            [FrontHelper setNetStatus:@"1"];
            break;
        }
        case kReachableViaWWAN:
        {
            [SVProgressHUD showSuccessWithStatus_custom:@"已连接2G/3G网络" duration:1.0];
            [FrontHelper setNetStatus:@"2"];
            break;
        }
        default:
            break;
    }
    
}

//独立客户端回调函数
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
	
	[self parse:url application:application];
	return YES;
}

- (void)parse:(NSURL *)url application:(UIApplication *)application {
    
    //结果处理
    AlixPayResult* result = [self handleOpenURL:url];
    
    
    NSLog(@"result %d",result.statusCode);
    
	if (result)
    {
		
		if (result.statusCode == 9000)
        {
			/*
			 *用公钥验证签名 严格验证请使用result.resultString与result.signString验签
			 */
            
            //交易成功
            //            NSString* key = AlipayPubKey;
			id<DataVerifier> verifier;
            verifier = CreateRSADataVerifier(AlipayPubKey);
            
			if ([verifier verifyString:result.resultString withSign:result.signString])
            {
                //验证签名成功，交易结果无篡改
                NSLog(@"success");
                
//                NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"alipaySuccess" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"9000",@"payResultStatus", nil]];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"orderlist" object:self];
			}
        }
        else
        {
            //交易失败
            
            NSLog(@"failed");
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"payReusltCode" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"1",@"payResultStatus", nil]];
        }
    }
    else
    {
        //失败
        NSLog(@"failed 2");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"payReusltCode" object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"0",@"payResultStatus", nil]];
    }
    
}

- (AlixPayResult *)resultFromURL:(NSURL *)url {
	NSString * query = [[url query] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
#if ! __has_feature(objc_arc)
    return [[[AlixPayResult alloc] initWithString:query] autorelease];
#else
	return [[AlixPayResult alloc] initWithString:query];
#endif
}

- (AlixPayResult *)handleOpenURL:(NSURL *)url {
	AlixPayResult * result = nil;
	
	if (url != nil && [[url host] compare:@"safepay"] == 0) {
		result = [self resultFromURL:url];
	}
    
	return result;
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    
    
    NSLog(@"token %@",deviceToken);
    
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:deviceToken forKey:@"deviceToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    NSString *token = [[NSString alloc] init];
    token = [FrontHelper tokenController:@"push" action:@"index"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.niuhome.com/appapi/push"];
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    
    [request addPostValue:deviceToken forKey:@"deviceToken"];
//    [request addPostValue:_codeStr forKey:@"code"];
    [request addPostValue:token forKey:@"token"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
//    [request setTag:10012];
//    if ([FrontHelper getNetStatus] == 0) {
//        [SVProgressHUD showErrorWithStatus_custom:@"无网络连接" duration:1.0];
//        return;
//    }
    [request startAsynchronous];
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"token %@",error);
}

@end
