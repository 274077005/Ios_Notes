//
//  TimerUserViewController.m
//  skyer工程集合
//
//  Created by SoKing on 2017/5/18.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "TimerUserViewController.h"
#import "SkyerNSTimerTool.h"

@interface TimerUserViewController ()

@end

@implementation TimerUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SkyerNSTimerTool *timerTool=[SkyerNSTimerTool sharedInstance];
    [timerTool SkyerInitNSTimerWithTimeInterval:1];
    [timerTool skyerStar];
    
    kWeakSelf(self);
    
    [timerTool skyerTimerAction:^{
        NSLog(@"开始定时器");
        weakself.view.backgroundColor=[UIColor greenColor];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [[SkyerNSTimerTool sharedInstance] skyerEnd];
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
