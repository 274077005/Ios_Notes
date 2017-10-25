//
//  ColumnView.m
//  skyer工程集合
//
//  Created by SoKing on 17/3/27.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "ColumnView.h"

@implementation ColumnView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //数据数组
    NSArray *arr = @[@10, @20, @30, @40, @50, @60, @70, @80, @90, @100];

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat viewW = self.bounds.size.width;
    CGFloat viewH = self.bounds.size.height;
    
    NSUInteger count = arr.count;
    
    CGFloat w = viewW / (count * 2 - 1);
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat h = 0;
    
    for (int i = 0; i < count; i ++) {
        
        x = i * w * 2;
        
        h = ([arr[i] integerValue] / 100.0) * viewH;
        
        y = viewH - h;
        
        //画矩形柱体
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        
        //填充对应颜色
        [(UIColor *)_ColorColumn set];
        
        CGContextAddPath(ctx, path.CGPath);
        
        //注意是Fill, 而不是Stroke, 这样才可以填充矩形区域
        CGContextFillPath(ctx);
        
    }
}




@end
