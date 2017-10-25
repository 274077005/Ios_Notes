//
//  SkScollPageTitleView.h
//  skyer工程集合
//
//  Created by SoKing on 2017/5/12.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkScollPageTitleView : UIScrollView <UIScrollViewDelegate>

typedef void (^getPageIndex)(NSInteger pageIndex);

@property (nonatomic ,copy) getPageIndex getPageIndex;

/**
 初始化滚动控件

 @param controlWidth 一个小控件的宽度
 @param controlHigth 一个小控件的高度
 @param controlCount 小控件的总数量
 @param controlCountOneRow 一行显示小控件的个数
 */
- (void)skInitScrollPageTitleViewWithControlWidth:(NSInteger)controlWidth
                                     controlHigth:(NSInteger)controlHigth
                                     controlCount:(NSInteger)controlCount
                               controlCountOneRow:(NSInteger)controlCountOneRow
                                      selectIndex:(NSInteger)selectIndex;


/**
 设置选中的页码

 @param pageIndex 选中页码下标
 */
- (void)setPageWithIndex:(NSInteger)pageIndex;

- (void)skyerGetPageIndex:(getPageIndex)getPageIndex;
@end
