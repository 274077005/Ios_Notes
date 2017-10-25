//
//  AnimationViewController.m
//  skyer工程集合
//
//  Created by SoKing on 2017/10/19.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()
{
    BOOL isfliped;
    UIImage *image;
    
}
@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self UIKitAnimate];
    
    
}

/**
 这个是使用UIKit提供的默认动画
 */
- (void)UIKitAnimate{
    UIImageView *view=[[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 100, 50)];
    view.image=[UIImage imageNamed:@"animationImage"];
    [self.view addSubview:view];
    
    //重复的来回动画
    [UIView animateWithDuration:1 delay:5 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        view.center=self.view.center;
    } completion:^(BOOL finished) {
        view.backgroundColor=[UIColor redColor];
    }];
    //透明度动画
    //    [UIView animateWithDuration:2 delay:2 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionRepeat animations:^{
    //        view.alpha=0.5;
    //    } completion:^(BOOL finished) {
    //
    //    }];
    //转场动画
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [UIView transitionWithView:view duration:2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
    //            view.image=[UIImage imageNamed:@"tongxl_qytime"];
    //        } completion:^(BOOL finished) {
    //
    //        }];
    //    });
    
    //一个可以实现弹簧效果的动画的动画
    //    [UIView animateWithDuration: 0.5 delay: 2 usingSpringWithDamping: 0.6 initialSpringVelocity: 0 options: UIViewAnimationOptionCurveLinear animations: ^{
    //        view.center = self.view.center;
    //    } completion: nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
