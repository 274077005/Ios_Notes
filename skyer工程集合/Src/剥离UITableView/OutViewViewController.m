//
//  OutViewViewController.m
//  skyer工程集合
//
//  Created by SoKing on 2017/4/18.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "OutViewViewController.h"
#import "ShowUITableView.h"


@interface OutViewViewController ()

@property (nonatomic ,strong)ShowUITableView *tableView;

@end

@implementation OutViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _tableView=[[ShowUITableView alloc] initWithFrame:self.view.bounds];
    _tableView.selfOwner=self;
    
    _tableView.clickCell = ^(NSIndexPath *IndexPath) {
        NSLog(@"点击了哪个%ld",IndexPath.row);
        
    };
    [self.view addSubview:_tableView];
    
    
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
- (void)btnClickAction:(UIButton *)sender{
    NSLog(@"点击了哪个%ld",sender.tag);
}
@end
