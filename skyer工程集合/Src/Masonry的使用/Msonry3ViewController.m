//
//  Msonry3ViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/8.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "Msonry3ViewController.h"
#import "Masonry.h"

@interface Msonry3ViewController ()

@end

@implementation Msonry3ViewController

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

-(void)addViewUI{
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    __weak typeof(self) weakSelf=self;
    
    
    UIView *viewUp=[UIView new];
    viewUp.backgroundColor=[UIColor blackColor];
    [self.view addSubview:viewUp];
    
    [viewUp mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        
    }];
    
    
    UIView *viewDown=[UIView new];
    viewDown.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:viewDown];
    
    [viewDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(-20);
        
        make.height.equalTo(viewUp);
        
        make.top.equalTo(viewUp.mas_bottom).offset(20);
        
        make.left.equalTo(weakSelf.view.mas_centerX);
        
    }];
    
    
}



@end
