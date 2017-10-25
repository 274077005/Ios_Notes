//
//  UIViewController+LogViewName.m
//  skyer工程集合
//
//  Created by SoKing on 2017/8/1.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "UIViewController+LogViewName.h"
#import <objc/runtime.h>

@implementation UIViewController (LogViewName)


+(void)load{

#ifdef DEBUG
    //原本的viewWillAppear方法
    Method viewWillAppear=class_getInstanceMethod(self, @selector(viewWillAppear:));
    //需要替换成 能够输出日志的viewWillAppearLog
    Method viewWillAppearLog=class_getInstanceMethod(self, @selector(viewWillAppearLog:));
    //两方法进行交换
    method_exchangeImplementations(viewWillAppear, viewWillAppearLog);
#endif
}

- (void)viewWillAppearLog:(BOOL)animated{
    NSString *className=NSStringFromClass([self class]);
    
    NSLog(@"进入的类名称：%@",className);
    
    //下面方法的调用，其实是调用viewWillAppear
    [self viewWillAppearLog:YES];
}

@end
