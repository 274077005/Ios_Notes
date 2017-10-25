//
//  Black2ViewController.m
//  skyer工程集合
//
//  Created by SoKing on 2017/5/31.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "Black2ViewController.h"

@interface Black2ViewController ()

@end

@implementation Black2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btnBack=[UIButton new];
    [btnBack setTitle:@"返回" forState:UIControlStateNormal];
    [btnBack setTitleColor:[UIColor blackColor] forState:0];
    [btnBack addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
    
    [btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 50));
        
        make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
        
        make.centerX.mas_equalTo(self.view.mas_centerX);
        
    }];
    
}

- (void)btnAction{
    _getWoCaoBlock(@"卧槽");
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
