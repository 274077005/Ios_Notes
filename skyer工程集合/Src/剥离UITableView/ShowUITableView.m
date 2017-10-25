//
//  ShowUITableView.m
//  skyer工程集合
//
//  Created by SoKing on 2017/4/18.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "ShowUITableView.h"

@implementation ShowUITableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _tableView=[[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self addSubview:_tableView];
    }
    
    return self;
}


#pragma mark - cell的代理
#pragma mark cell 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0;
}
#pragma mark section下得cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
#pragma mark 绘制一个cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    for(UIView *view in cell.contentView.subviews){
        
        [view removeFromSuperview];
        
    }
    
    _btnClick = [[UIButton alloc] initWithFrame:CGRectMake(200, 10, 50, 20)];
    [_btnClick setTitle:@"点击" forState:0];
    _btnClick.tag=indexPath.row;
    [_btnClick setTitleColor:[UIColor blueColor] forState:0];
    
    [_btnClick addTarget:_selfOwner action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:_btnClick];
    
    cell.textLabel.text=@"我就试试效果";
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_clickCell) {
        _clickCell(indexPath);
    }
}



- (void)cellDidSelect:(clickCell)clickCell{
    _clickCell=clickCell;
}
- (void)reloadTableView{
    [_tableView reloadData];
}
@end
