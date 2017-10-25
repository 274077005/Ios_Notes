//
//  TestSingleton.h
//  skyer工程集合
//
//  Created by SoKing on 2017/6/9.
//  Copyright © 2017年 skyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkyerSingleton.h"

@interface TestSingleton : NSObject

SkyerSingletonH(TestSingleton)

- (void)getData;

@end
