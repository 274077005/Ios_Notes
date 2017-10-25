//
//  NSObject+userInfoDic.m
//  skyer工程集合
//
//  Created by SoKing on 2017/9/8.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "NSObject+userInfoDic.h"
#import <objc/runtime.h>

#define KuserInfoKey @"userInfoDic"

@implementation NSObject (userInfoDic)

- (void)setUserInfoDic:(NSMutableDictionary *)userInfoDic{
    objc_setAssociatedObject(self, KuserInfoKey, userInfoDic, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSMutableDictionary *)userInfoDic{
    return objc_getAssociatedObject(self, KuserInfoKey);
}

@end
