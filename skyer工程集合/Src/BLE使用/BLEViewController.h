//
//  BLEViewController.h
//  skyer工程集合
//
//  Created by SoKing on 17/3/15.
//  Copyright © 2017年 skyer. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "BabyBluetooth.h"

@interface BLEViewController : SkyerViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) BabyBluetooth *baby;

@property __block NSMutableArray *arrServicesa;
@property __block NSMutableArray *arrPeripheral;
@property __block NSMutableArray *arrCharacteristics;



@end
