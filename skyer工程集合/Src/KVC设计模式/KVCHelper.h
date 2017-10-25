//
//  KVCHelper.h
//  PalmTeam
//
//  Created by Alex on 15/9/1.
//  Copyright (c) 2015年 Castelecom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVCHelper : NSObject

/**
 父类的init方法
 */
- (id)initWithJson:(id)obj;

- (void)dataChangeWithObject:(id)obj;

@end
