//
//  Msonry1ViewController.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/8.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "MsonryViewController.h"
#import "Msonry1ViewController.h"
#import "Msonry2ViewController.h"
#import "Msonry3ViewController.h"
#import "Msonry4ViewController.h"


@interface MsonryViewController ()
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *arrListData;//显示什么列
@end

@implementation MsonryViewController


/*
 
 ///111
 make.left.equalTo(10); //直接在equalTo()内填写数字，默认为相对于父视图而言，等同于下面注释的语句
 //make.left.equalTo(self.view.left).offset(10); //offset()内填写偏差量
 
 make.width.equalTo(self.view).dividedBy(2).offset(-30);//dividedBy()，除以某个量，用以实现按比例设置约束；multipliedBy()则是乘以某个量
 
 ///22
 固定约束是与其他控件没有联系的，本质上和设置控件的frame差别不大。
 make.size.equalTo(CGSizeMake(200, 100));
 
 
 ///3、边距填充约束
 make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(60, 60, 60, 60));
 
 ///4、约束优先级
 当存在多条相同意义的约束时，可以设置约束的优先级。
 make.top.left.and.right.equalTo(self.view);
 make.height.greaterThanOrEqualTo(100).with.priorityHigh();//高小于等于100，约束优先级高
 make.height.equalTo(500).with.priorityLow();//高为500，约束优先级低
 5、更新约束
 
 self.redView = redView;
 
 [redView makeConstraints:^(MASConstraintMaker *make) {
 make.center.equalTo(self.view);
 make.width.and.height.equalTo(300);
 }];
 //点击视图后更新约束
 [redView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(update)]];
 - (void)update{
 [self.redView updateConstraints:^(MASConstraintMaker *make) {
 make.width.and.height.equalTo(200);
 }];
 }
6、重设约束
 self.redView = redView;
 
 [redView makeConstraints:^(MASConstraintMaker *make) {
 make.center.equalTo(self.view);
 make.width.and.height.equalTo(300);
 }];
 //点击视图后重设约束
 [redView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remake)]];
 - (void)remake{
 [self.redView remakeConstraints:^(MASConstraintMaker *make) {
 //新的约束保留
 make.center.equalTo(self.view);
 make.width.and.height.equalTo(200);
 }];
 }
 
 
 */






/*===========懒加载===========*/
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
- (NSArray *)arrListData{
    if (!_arrListData) {
        _arrListData=@[@"Masonry使用1",@"Masonry使用2",@"Msonry使用3",@"Msonry使用4"];
    }
    return _arrListData;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Msonry的使用";
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
    
    cell.textLabel.text=_arrListData[indexPath.row];
    
    
    return cell;
}
#pragma mark 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    UIViewController *VC;
    
    switch (indexPath.row) {
        case 0://masonry
        {
            VC=[Msonry1ViewController new];
        }
            break;
        case 1://masonry
        {
            VC=[Msonry2ViewController new];
        }
            break;
        case 2://masonry
        {
            VC=[Msonry3ViewController new];
            
        }
            break;
        case 3://masonry
        {
            VC=[Msonry4ViewController new];
            
        }
            break;
            
            
        default:
            break;
    }
    
    
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
