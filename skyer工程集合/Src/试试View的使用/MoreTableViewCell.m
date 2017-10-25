//
//  MoreTableViewCell.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/13.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "MoreTableViewCell.h"
#import "Masonry.h"
@implementation MoreTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //添加一个lab
        _labName=[UILabel new];
        _labName.frame=CGRectMake(10, 10, 300, 20);
        _labName.tag=1001;
        _labName.textColor=[UIColor blackColor];
        [self.contentView addSubview:_labName];
        
        
        //添加一个button
        _btnAction=[UIButton new];
        _btnAction.frame=CGRectMake(10, 40, 50, 30);
        [_btnAction setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btnAction setTitle:@"点击" forState:UIControlStateNormal];
        [self.contentView addSubview:_btnAction];
        
    }
    
    return self;
}


@end
