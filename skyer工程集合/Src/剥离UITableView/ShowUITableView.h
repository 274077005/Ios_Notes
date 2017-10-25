//
//  ShowUITableView.h
//  skyer工程集合
//
//  Created by SoKing on 2017/4/18.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ShowUITableView : UIView <UITableViewDelegate,UITableViewDataSource>

typedef void (^clickCell) (NSIndexPath*IndexPath);
@property(copy, nonatomic) clickCell clickCell;
- (void)cellDidSelect:(clickCell)clickCell;


@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) UIButton *btnClick;
@property (nonatomic ,strong) UIViewController *selfOwner;

- (void)reloadTableView;



@end
