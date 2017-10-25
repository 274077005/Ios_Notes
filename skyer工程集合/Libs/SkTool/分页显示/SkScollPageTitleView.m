//
//  SkScollPageTitleView.m
//  skyer工程集合
//
//  Created by SoKing on 2017/5/12.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "SkScollPageTitleView.h"
#define KUIScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define KUIScreenHeight ([UIScreen mainScreen].bounds.size.height)

@implementation SkScollPageTitleView 
{
    NSInteger skSelfWidth;//UIScrollView自身的宽度
    NSInteger skSelfHigth;//UIScrollView自身的高度
    
    NSInteger skcontrolSpace;//控件的空格
    NSInteger skcontrolWidth;//控件的宽
    NSInteger skcontrolHigth;//控件的高
    NSInteger skcontrolCount;//控件的个数
    NSInteger skcontrolCountOneRow;//每行控件的个数
    NSMutableArray *arrView;//每个控件都放进这个数组保存
    
    
}

- (void)skInitScrollPageTitleViewWithControlWidth:(NSInteger)controlWidth
                                     controlHigth:(NSInteger)controlHigth
                                     controlCount:(NSInteger)controlCount
                               controlCountOneRow:(NSInteger)controlCountOneRow
                                      selectIndex:(NSInteger)selectIndex{
    
    skSelfWidth=self.frame.size.width;
    skSelfHigth=self.frame.size.height;
    skcontrolWidth=controlWidth;
    skcontrolHigth=controlHigth;
    skcontrolCount=controlCount;
    skcontrolCountOneRow=controlCountOneRow;
    if (controlCountOneRow%2==0) {
        skcontrolCountOneRow-=1;
    }
    
    //隐藏滚动条
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator=NO;
    self.delegate=self;
    //两个控件的间隙
    skcontrolSpace=(skSelfWidth-skcontrolCountOneRow * skcontrolWidth)/(skcontrolCountOneRow-1);
    
    //保存每个控件的View
    arrView=[NSMutableArray new];
    
    for (int i =0 ; i<skcontrolCount; ++i) {
        UIView *viewOne=[[UIView alloc] initWithFrame:CGRectMake(i*(skcontrolWidth+skcontrolSpace), 0, skcontrolWidth, skcontrolHigth)];
        [self addSubview:viewOne];
        [arrView addObject:viewOne];
        [viewOne setBackgroundColor:[UIColor greenColor]];
        UIButton *btnOne=[[UIButton alloc] initWithFrame:viewOne.bounds];
        btnOne.tag=i;
        [btnOne setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [btnOne addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [viewOne addSubview:btnOne];
    }
    self.contentSize = CGSizeMake((skcontrolWidth+skcontrolSpace)*skcontrolCount-skcontrolSpace, skcontrolHigth);
    [self setPageWithIndex:selectIndex];
}
#pragma mark 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(scrollViewDidEndScrollingAnimation:) withObject:scrollView afterDelay:0.1];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSInteger pageSelect=scrollView.contentOffset.x / (skSelfWidth/skcontrolCountOneRow);
    
    [self setPageWithIndexAoto:pageSelect];
    
}



#pragma mark - 按钮的点击方法
-(void)btnClick:(UIButton *)sender{
    NSInteger tag=sender.tag;
    [self setPageWithIndex:tag];
}
#pragma mark 点击了按钮移动的方法
- (void)setPageWithIndex:(NSInteger)pageIndex{
    
    if (pageIndex>skcontrolCountOneRow/2&&pageIndex<skcontrolCount-skcontrolCountOneRow/2) {//中间几个
        [UIView animateWithDuration:0.5 animations:^{
            self.contentOffset = CGPointMake([self getOffsetWithIndex:pageIndex-skcontrolCountOneRow/2], 0);
        }];
    }else if (pageIndex>=skcontrolCount-skcontrolCountOneRow/2){//后面几个
        [UIView animateWithDuration:0.5 animations:^{
            self.contentOffset = CGPointMake([self getOffsetWithIndex:skcontrolCount-skcontrolCountOneRow], 0);
        }];
    }else{//前面几个
        [UIView animateWithDuration:0.5 animations:^{
            self.contentOffset = CGPointMake([self getOffsetWithIndex:0], 0);
        }];
    }
    [self setPageToCenter:pageIndex];
}
#pragma mark 设置为选择状态（UIScrollView代理方法选择自动调用）
-(void)setPageWithIndexAoto:(NSInteger)pageIndex{
    [UIView animateWithDuration:0.5 animations:^{
        self.contentOffset = CGPointMake([self getOffsetWithIndex:pageIndex], 0);
    }];
}
    
#pragma mark 通过下标返回位置坐标
- (NSInteger)getOffsetWithIndex:(NSInteger)index{
    NSInteger offSet=(skcontrolWidth+skcontrolSpace) * index;
    return offSet;
}

#pragma mark 设置为选择状态（手动点击按钮时调用）
- (void)setPageToCenter:(NSInteger)pageIndex{
    if (_getPageIndex) {
        _getPageIndex(pageIndex);
    }
    
    for (int i =0 ; i<skcontrolCount; ++i) {
        UIView *view=[arrView objectAtIndex:i];
        if (i==pageIndex) {
            [self skSetViewsBorde:view BorderWidth:2 Radius:5 andBorderColor:[UIColor redColor]];//选择的时候的颜色
        }else{
            [self skSetViewsBorde:view BorderWidth:2 Radius:5 andBorderColor:[UIColor whiteColor]];//没选中的时候的颜色
        }
    }
    
}


#pragma mark - 获得选中页码的回调函数
-(void)skyerGetPageIndex:(getPageIndex)getPageIndex{
    _getPageIndex=getPageIndex;
}

-(void)skSetViewsBorde:(UIView*)View
           BorderWidth:(CGFloat)Width
                Radius:(CGFloat)Radius
        andBorderColor:(UIColor*)borderColor{
    
    View.layer.cornerRadius=Radius;
    View.layer.masksToBounds=YES;
    View.layer.borderWidth=Width;
    View.layer.borderColor=[borderColor CGColor];
}
@end
