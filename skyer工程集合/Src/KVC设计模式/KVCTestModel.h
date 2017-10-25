//
//  KVCTestModel.h
//  skyer工程集合
//
//  Created by SoKing on 17/3/14.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import "KVCHelper.h"

@interface KVCTestModel : KVCHelper

@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *password;


- (void)getUserInfo;

@end
