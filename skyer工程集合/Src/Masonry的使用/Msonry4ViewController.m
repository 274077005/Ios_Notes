//
//  Msonry4ViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/8.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "Msonry4ViewController.h"
#import "Masonry.h"

@interface Msonry4ViewController ()

@end

@implementation Msonry4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"模拟一个登录界面";
    self.view.backgroundColor=[UIColor whiteColor];
    [self drawUI];
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

- (void)drawUI{
   
    //绘制一个logo
    UIButton *btnLogo=[UIButton new];
    [btnLogo setTitle:@"LOGIN" forState:UIControlStateNormal];
    [btnLogo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnLogo setBackgroundColor:[UIColor grayColor]];
    
    
    [self.view addSubview:btnLogo];
    [btnLogo mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
        make.top.mas_equalTo(self.mas_topLayoutGuide).offset(20);
        
        make.centerX.equalTo(self.view.mas_centerX);
        
        
    }];
    
    //绘制用户名
    
    UITextField *fieldName=[UITextField new];
    fieldName.placeholder=@"请输入用户名";
    fieldName.backgroundColor=[UIColor grayColor];;
    [self.view addSubview:fieldName];
    
    
    [fieldName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(btnLogo.mas_centerX);
        
        make.top.mas_equalTo(btnLogo.mas_bottom).offset(20);
        
        make.left.mas_equalTo(30);
        
        make.right.mas_equalTo(-30);
        
        
    }];
    
    //绘制一个密码输入
    
    UITextField *fieldPassword=[UITextField new];
    fieldPassword.placeholder=@"请输入密码";
    fieldPassword.backgroundColor=[UIColor grayColor];;
    [self.view addSubview:fieldPassword];
    
    
    [fieldPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(btnLogo.mas_centerX);
        
        make.top.mas_equalTo(fieldName.mas_bottom).offset(20);
        
        make.left.mas_equalTo(30);
        
        make.right.mas_equalTo(-30);
        
        
    }];
    //绘制一个登录按钮
    UIButton *btnLogin=[UIButton new];
    btnLogin.backgroundColor=[UIColor grayColor];
    [btnLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnLogin setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:btnLogin];
    
    [btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        
        make.centerX.mas_equalTo(btnLogo.mas_centerX);
        
        make.top.mas_equalTo(fieldPassword.mas_bottom).offset(20);
    }];
    
    
    //第三方登录
    
    UIButton *btnLoginOther=[UIButton new];
    [btnLoginOther setTitle:@"第三方登录" forState:UIControlStateNormal];
    [btnLoginOther setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnLoginOther.backgroundColor=[UIColor grayColor];
    [self.view addSubview:btnLoginOther];
    [btnLoginOther mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.centerX.mas_equalTo(btnLogo.mas_centerX);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuideTop);
    }];
    
}

-(void)dealloc{
    NSLog(@"界面销毁");
}

@end
