//
//  VoiceViewController.m
//  skyer工程集合
//
//  Created by SoKing on 2017/5/22.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "VoiceViewController.h"
#import "VoiceTool.h"

@interface VoiceViewController ()

@end

@implementation VoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)initView{
    
    
    
    UIButton *btnStart=[UIButton new];
    [self.view addSubview:btnStart];
    [btnStart setTitle:@"播放" forState:0];
    [btnStart addTarget:self action:@selector(btnSystemStart:) forControlEvents:UIControlEventTouchUpInside];
    [btnStart setTitleColor:[UIColor blackColor] forState:0];
    btnStart.tag=0;
    [btnStart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.top.mas_equalTo(self.mas_topLayoutGuideBottom);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    UIButton *btnStop=[UIButton new];
    [self.view addSubview:btnStop];
    [btnStop setTitle:@"停止" forState:0];
    btnStop.tag=0;
    [btnStop addTarget:self action:@selector(btnSystemStop:) forControlEvents:UIControlEventTouchUpInside];
    [btnStop setTitleColor:[UIColor blackColor] forState:0];
    [btnStop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.top.mas_equalTo(btnStart.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    
    UIButton *btnStart1=[UIButton new];
    [self.view addSubview:btnStart1];
    [btnStart1 setTitle:@"播放" forState:0];
    btnStart1.tag=1;
    [btnStart1 addTarget:self action:@selector(btnSystemStart:) forControlEvents:UIControlEventTouchUpInside];
    [btnStart1 setTitleColor:[UIColor blackColor] forState:0];
    [btnStart1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.top.mas_equalTo(btnStop.mas_bottom).offset(50);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    UIButton *btnStop1=[UIButton new];
    [self.view addSubview:btnStop1];
    [btnStop1 setTitle:@"停止" forState:0];
    btnStop1.tag=1;
    [btnStop1 addTarget:self action:@selector(btnSystemStop:) forControlEvents:UIControlEventTouchUpInside];
    [btnStop1 setTitleColor:[UIColor blackColor] forState:0];
    [btnStop1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.top.mas_equalTo(btnStart1.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
}
    
    
- (void)btnSystemStart:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
            [[VoiceTool sharedInstance] skyerPlaySystemVoice:@"Alarm.mp3"];
            break;
        case 1:
            [[VoiceTool sharedInstance] skyerPlayAudioPlayer:@"Alarm.mp3"];
            [[VoiceTool sharedInstance] skyerPlayAudioPlayerStart];
            break;
            
        default:
            break;
    }
    
}
-(void)btnSystemStop:(UIButton *)sender{
    switch (sender.tag) {
        case 0:
            [[VoiceTool sharedInstance] skyerRemoveSystemVoice];
            break;
        case 1:
            [[VoiceTool sharedInstance] skyerPlayAudioPlayerStop];
            break;
        default:
            break;
    }
    
}
@end
