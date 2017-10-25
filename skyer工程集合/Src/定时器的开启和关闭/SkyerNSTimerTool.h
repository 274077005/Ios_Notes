//
//  SkyerNSTimerTool.h
//  skyer工程集合
//
//  Created by SoKing on 2017/5/18.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SkyerNSTimerTool : NSObject

typedef void (^timerAction) (void);
@property (nonatomic,copy) timerAction timerAction;

/**
 单例

 @return 获得单例
 */
+(instancetype)sharedInstance;

/**
 初始化时间

 @param time 需要重复的时间
 */
- (void)SkyerInitNSTimerWithTimeInterval:(NSTimeInterval)time;
/**
 开始运行定时器
 */
- (void)skyerStar;

/**
 暂停定时器
 */
- (void)skyerEnd;

/**
 定时器调用的方法回调

 @param timerAction 调用的方法
 */
-(void)skyerTimerAction:(timerAction)timerAction;

@end
