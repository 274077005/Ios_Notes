//
//  Msonry2ViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/8.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "Msonry2ViewController.h"
#import "Masonry.h"

@interface Msonry2ViewController ()

@end

@implementation Msonry2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addViewUI];
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

- (void)addViewUI{
    self.view.backgroundColor=[UIColor whiteColor];
    //初始化黑色的view
    
    UIView *viewBlack=[UIView new];
    
    viewBlack.backgroundColor=[UIColor blackColor];
    
    [self.view addSubview:viewBlack];
    
    //对viewBlack添加约束
    
    [viewBlack mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
        make.left.and.top.mas_equalTo(20);
        
    }];
    //初始化灰色的view
    UIView *viewGray=[UIView new];
    
    viewGray.backgroundColor=[UIColor greenColor];
    
    [self.view addSubview:viewGray];
    
    [viewGray mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.and.top.equalTo(viewBlack);
        
        
        make.right.mas_equalTo(-20);
        
    }];
    
    
}

@end
