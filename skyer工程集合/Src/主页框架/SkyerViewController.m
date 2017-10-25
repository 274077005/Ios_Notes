//
//  SkyerViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/14.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "SkyerViewController.h"

@interface SkyerViewController ()

@end

@implementation SkyerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self drwaUI];
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
-(void) drwaUI{
    self.view.backgroundColor=[UIColor whiteColor];
}

-(void)dealloc{
    NSLog(@"界面销毁成功");
}

@end
