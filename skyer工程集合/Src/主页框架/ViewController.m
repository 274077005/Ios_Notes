//
//  ViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/8.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "ViewController.h"
#import "MsonryViewController.h"
#import "MoreViewViewController.h"
#import "KVCTestViewController.h"
#import "BLEViewController.h"
#import "ProgressViewController.h"
#import "ColumnViewController.h"
#import "WIFIViewController.h"
#import "OutViewViewController.h"
#import "FMDBViewController.h"
#import "PageViewController.h"
#import "TimerUserViewController.h"
#import "VoiceViewController.h"
#import "BlockViewController.h"
#import "SingletonViewController.h"
#import "LearnRunTimeViewController.h"
#import "AnimationViewController.h"


@interface ViewController ()

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *arrListData;//显示什么列
@property (nonatomic ,strong) NSArray *arrListName;//显示分组的名称

@end

@implementation ViewController

/*===========懒加载===========*/

- (NSArray *)arrListData{
    if (!_arrListData) {
        _arrListData=@[@"MsonryViewController"
                       ,@"MoreViewViewController"
                       ,@"KVCTestViewController"
                       ,@"BLEViewController"
                       ,@"ProgressViewController"
                       ,@"ColumnViewController"
                       ,@"WIFIViewController"
                       ,@"OutViewViewController"
                       ,@"FMDBViewController"
                       ,@"PageViewController"
                       ,@"TimerUserViewController"
                       ,@"VoiceViewController"
                       ,@"BlockViewController"
                       ,@"SingletonViewController"
                       ,@"LearnRunTimeViewController"
                       ,@"AnimationViewController"
                       ]
                       ;
    }
    return _arrListData;
}

- (NSArray *)arrListName{
    if (!_arrListName) {
        _arrListName=@[@"Masonry的简单实用"
                       ,@"MVC模式试手V界面"
                       ,@"KVC设计模式的使用"
                       ,@"BLE蓝牙4.0开发"
                       ,@"半圆形进度"
                       ,@"柱状图"
                       ,@"WIFI开发里面有demo"
                       ,@"剥离UITableView"
                       ,@"数据库的使用有demo"
                       ,@"分页"
                       ,@"定时器"
                       ,@"声音播放"
                       ,@"Block回调"
                       ,@"宏写的单例"
                       ,@"runTime的学习"
                       ,@"动画学习"
                       ];
    }
    return _arrListName;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView=[[UITableView alloc] initWithFrame:self.view.bounds];
        [_tableView setSeparatorColor:[UIColor lightGrayColor]];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"学习各类";
    
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - /*=============代理方法=============*/

#pragma mark cell 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.0;
}
#pragma mark section下得cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arrListData.count;
}
#pragma mark 绘制一个cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    
    static NSString *cellIdentifier =@"cellIdentifier";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    for(UIView *view in cell.contentView.subviews){
        
        [view removeFromSuperview];
        
    }
    cell.textLabel.text=[self.arrListName objectAtIndex:indexPath.row];
    
    
    return cell;
}
#pragma mark 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *stringVC=[_arrListData objectAtIndex:indexPath.row];
    
    UIViewController *VC=[NSClassFromString(stringVC) new];
    VC.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:VC animated:YES];
}


@end
