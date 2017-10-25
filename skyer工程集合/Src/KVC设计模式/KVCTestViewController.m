//
//  KVCTestViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/14.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "KVCTestViewController.h"
#import "KVCTestModel.h"
#import "MJExtension.h"
#import "SkDataOperation.h"

@interface KVCTestViewController ()

@property (nonatomic ,strong) KVCTestModel *model;

@end

@implementation KVCTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
//    
//    _model=[KVCTestModel new];
//    
//    [_model getUserInfo];
//    
//    NSLog(@"名字=%@",_model.name);
//    
//    NSDictionary *dicInfo=_model.mj_keyValues;
//    
//    [SkDataOperation SkSaveData:dicInfo withSaveFileName:@"520" succeedBlock:^{
//       
//        NSLog(@"保存成功=%@",kCachePath);
//        
//    }];
//    
//    NSLog(@"字典转模型=%@",dicInfo);
//    
//    NSDictionary *userInfo=@{@"name":@"轻浮",
//                             @"password":@"12345678"};
//    
//    _model=[_model mj_setKeyValues:userInfo];
//    NSLog(@"用户名=%@",_model.name);
//    
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

-(void)dealloc{
    NSLog(@"界面销毁");
}


@end
