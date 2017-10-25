//
//  ProgressViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/27.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "ProgressViewController.h"
#import "SkyerCircularSlider.h"

@interface ProgressViewController ()

@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    SkyerCircularSlider *skyerSlider=[[SkyerCircularSlider alloc] initWithFrame:CGRectMake(0, 80, 320, 320)];
    skyerSlider.lineWidth=8;
    skyerSlider.maximumValue=100;
    skyerSlider.minimumValue=0  ;
    skyerSlider.currentValue=70 ;
    skyerSlider.backgroundColor=[UIColor clearColor];
    skyerSlider.filledColor=[UIColor greenColor];
    skyerSlider.unfilledColor=[UIColor lightGrayColor];
    [self.view addSubview:skyerSlider];
    
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
