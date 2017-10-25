//
//  SkyerNSTimerTool.m
//  skyer工程集合
//
//  Created by SoKing on 2017/5/18.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "SkyerNSTimerTool.h"

@implementation SkyerNSTimerTool
{
    NSTimer *timer;
}
//全局变量
static id _instance = nil;
//单例方法
+(instancetype)sharedInstance{
    return [[self alloc] init];
}
////alloc会调用allocWithZone:
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    //只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
        
    });
    return _instance;
}
//初始化方法
- (instancetype)init{
    // 只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}
//copy在底层 会调用copyWithZone:
- (id)copyWithZone:(NSZone *)zone{
    return  _instance;
}
+ (id)copyWithZone:(struct _NSZone *)zone{
    return  _instance;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone{
    return _instance;
}
- (id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

#pragma mark - 开始工作

- (void)SkyerInitNSTimerWithTimeInterval:(NSTimeInterval)time{
    timer=[NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(SkyerTimerAction) userInfo:nil repeats:YES];
    [timer setFireDate:[NSDate distantFuture]];
}

- (void)skyerStar{
    [timer setFireDate:[NSDate date]];
}

-(void)skyerEnd{
    [timer setFireDate:[NSDate distantFuture]];
}

- (void)SkyerTimerAction{
    if (_timerAction) {
        _timerAction();
    }
}


-(void)skyerTimerAction:(timerAction)timerAction{
    _timerAction=timerAction;
}
@end
