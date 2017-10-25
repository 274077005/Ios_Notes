//
//  TestView.m
//  CircleDemo
//
//  Created by apple on 2017/2/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "SkyerCircularSlider.h"

#define  ToRad(ang)  ((M_PI *(ang)) / 180)//度数转化为弧度

#define  ToAng(rad)  ( (180.0 * (rad)) / M_PI )//弧度转化为度数

#define SQR(x)			( (x) * (x) )g

@interface SkyerCircularSlider ()

{
    int  angle;
    
    int  downAngle;
    
    NSInteger radius;
    
}

@end

@implementation SkyerCircularSlider


-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        
        angle =180;
        downAngle =150;
        radius =self.frame.size.width/2-20;
     }

    return self;
}

- (void)drawRect:(CGRect)rect {
 
    [self drawCircle];
}

-(void)drawCircle{
  
    [self drawUpCircleAtX:self.frame.size.width/2 Y:self.frame.size.height/2];
    
}

- (void)drawUpCircleAtX:(float)x Y:(float)y {

    //灰色
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, x, y, radius,ToRad(180), ToRad(360), 0);
    CGContextSetStrokeColorWithColor(ctx, _unfilledColor.CGColor);
    CGContextSetLineWidth(ctx, _lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    //进度色
    CGContextAddArc(ctx, x, y, radius,ToRad(180), ToRad(180+(_currentValue*1.8)), 0);
    CGContextSetStrokeColorWithColor(ctx, _filledColor.CGColor);
    CGContextSetLineWidth(ctx, _lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextDrawPath(ctx, kCGPathStroke);
    
}



@end
