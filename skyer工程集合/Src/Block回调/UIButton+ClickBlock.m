//
//  UIButton+ClickBlock.m
//  skyer
//
//  Created by SoKing on 2017/9/14.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "UIButton+ClickBlock.h"
#import <objc/runtime.h>

static const void *associatedKey = "btnClickBlock";

@implementation UIButton (ClickBlock)

//Category中的属性，只会生成setter和getter方法，不会生成成员变量
-(void)setClickBlock:(void (^)(UIButton *))clickBlock{
    objc_setAssociatedObject(self, associatedKey, clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self removeTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    if (clickBlock) {
        [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void (^)(UIButton *))clickBlock{
    return objc_getAssociatedObject(self, associatedKey);
}
-(void)buttonClick{
    if (self.clickBlock) {
        self.clickBlock(self);
    }
}@end
