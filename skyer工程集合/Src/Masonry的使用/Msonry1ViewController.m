//
//  Msonry1ViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/8.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "Msonry1ViewController.h"
#import "Masonry.h"

@interface Msonry1ViewController ()

@end

@implementation Msonry1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addCenterView];
    
    
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


#pragma mark - 无论在什么尺寸的设备上（包括横竖屏切换），红色view都居中显示。

- (void) addCenterView{
    self.view.backgroundColor=[UIColor whiteColor];
    
    // 初始化黑色view
    UIView *blackView = [UIView new];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    // 给黑色view添加约束
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 添加大小约束
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
        make.top.mas_equalTo(self.mas_topLayoutGuide).offset(20);
        
        // 添加左、上边距约束（左、上约束都是20）
        make.left.and.mas_equalTo(20);
    }];
    
    // 初始化灰色view
    UIView *grayView = [UIView new];
    grayView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:grayView];
    
    // 给灰色view添加约束
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 大小、上边距约束与黑色view相同
        make.size.and.top.equalTo(blackView);
        // 添加右边距约束（这里的间距是有方向性的，左、上边距约束为正数，右、下边距约束为负数）
        make.right.mas_equalTo(-20);
    }];
    
}

@end
