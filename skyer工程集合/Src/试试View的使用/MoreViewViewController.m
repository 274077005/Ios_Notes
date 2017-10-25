//
//  MoreViewViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/13.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "MoreViewViewController.h"
#import "Masonry.h"
#import "MoreTableViewCell.h"

@interface MoreViewViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MoreViewViewController


#pragma mark - ========懒加载=========

- (UITableView *)tableView{
    
    if (!_tableView) {
        NSLog(@"初始化");
        _tableView=[UITableView new];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self.tableView reloadData];
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
#pragma mark - cell的代理
#pragma mark cell 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80.0;
}
#pragma mark section下得cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 100;
}
#pragma mark 绘制一个cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[MoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.btnAction.tag=indexPath.row;
    [cell.btnAction addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *labName=(UILabel*) [self.view viewWithTag:1001];
    
    labName.text=@"我想写啥就是啥";
    
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void) btnAction:(UIButton *)sencer{
    NSLog(@"点到我了吗=%ld",sencer.tag);
}

#pragma mark 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark 在滑动手势删除某一行的时候，显示出更多的按钮
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里可以什么都不做
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *layTopRowAction1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [tableView setEditing:NO animated:YES];
        
        //点击事件回调
        
        
        
    }];
    layTopRowAction1.backgroundColor = [UIColor orangeColor];
    
    NSArray *arr= @[layTopRowAction1];
    
    return arr;
}
- (void)dealloc
{
    NSLog(@"界面销毁");
}
@end
