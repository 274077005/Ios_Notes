//
//  WIFIViewController.m
//  skyer工程集合
//
//  Created by SoKing on 2017/4/14.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "WIFIViewController.h"

#import <SystemConfiguration/CaptiveNetwork.h>


@interface WIFIViewController ()

@end

@implementation WIFIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    id info = nil;
    
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    
    for (NSString *ifnam in ifs) {
        
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        
        NSString *str = info[@"SSID"];
        NSString *str2 = info[@"BSSID"];
        NSString *str3 = [[ NSString alloc] initWithData:info[@"SSIDDATA"] encoding:NSUTF8StringEncoding];
        
        NSLog(@"SSID=%@",str);
        NSLog(@"BSSID=%@",str2);
        NSLog(@"SSIDDATA=%@",str3);
        NSLog(@"所有东西=%@",info);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
