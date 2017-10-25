//
//  KVCTestModel.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/14.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "KVCTestModel.h"
#import "MJExtension.h"

@implementation KVCTestModel


-(void)getUserInfo{
    NSDictionary *userInfo=@{@"name":@"伍新稳",
                             @"password":@"123456"};
    
    [self dataChangeWithObject:userInfo];
}

@end
