//
//  PageViewController.m
//  skyer工程集合
//
//  Created by SoKing on 2017/5/11.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "PageViewController.h"
@interface PageViewController ()
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    SkScollPageTitleView *ssptv=[[SkScollPageTitleView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 40)];
    [ssptv skInitScrollPageTitleViewWithControlWidth:40 controlHigth:40 controlCount:10 controlCountOneRow:6 selectIndex:2];
    
    [self.view addSubview:ssptv];
    
    SkyerNSTimerTool *timerTool=[SkyerNSTimerTool sharedInstance];
    [timerTool SkyerInitNSTimerWithTimeInterval:1];
    [timerTool skyerStar];
    [timerTool skyerTimerAction:^{
        NSLog(@"我就喜欢");
    }];
    
    
}
- (void)dealloc
{
    [[SkyerNSTimerTool sharedInstance] skyerEnd];
}
@end
