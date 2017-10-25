//
//  LearnRunTimeViewController.m
//  skyer工程集合
//
//  Created by SoKing on 2017/8/1.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "LearnRunTimeViewController.h"
#import "NSObject+userInfoDic.h"

@interface LearnRunTimeViewController ()

@end

@implementation LearnRunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"获取用户的数据=%@",self.userInfoDic);
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
