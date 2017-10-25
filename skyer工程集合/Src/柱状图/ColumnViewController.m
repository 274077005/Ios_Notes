//
//  ColumnViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/27.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "ColumnViewController.h"
#import "ColumnView.h"

@interface ColumnViewController ()

@end

@implementation ColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ColumnView *CView=[[ColumnView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    CView.ColorColumn=[UIColor greenColor];
    CView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:CView];
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
