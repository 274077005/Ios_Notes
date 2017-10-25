//
//  UIButton+ClickBlock.h
//  skyer
//
//  Created by SoKing on 2017/9/14.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 使用runtime给UIButton添加block的点击事件
 */
@interface UIButton (ClickBlock)

@property (nonatomic ,copy) void (^clickBlock)(UIButton *sender);

@end
