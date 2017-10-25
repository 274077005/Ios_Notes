//
//  KVCHelper.m
//  PalmTeam
//
//  Created by Alex on 15/9/1.
//  Copyright (c) 2015年 Castelecom. All rights reserved.
//

#import "KVCHelper.h"

@implementation KVCHelper

- (id)initWithJson:(id)obj
{
    if (self = [super init]) {
        // 通过KVC获取词典中的值,将key作为属性名，将value作为参数
        [self setValuesForKeysWithDictionary:obj];
    }
    return self;
}

- (void)dataChangeWithObject:(id)obj
{
    if (obj != [NSNull null])
    {
        [self setValuesForKeysWithDictionary:obj];
    }
}


// 防止在找不到key的时候奔溃
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

// 如果找不到key直接返回
- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

// 防止服务器和Model的数据类型不符合的崩溃
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSNumber class]])
    {
        [self setValue:[NSString stringWithFormat:@"%@",value] forKey:key];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
