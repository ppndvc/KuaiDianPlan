//
//  KDCacheManager.m
//  KuaiDianPlan
//
//  Created by ppnd on 16/6/18.
//  Copyright © 2016年 zy. All rights reserved.
//

#import "KDCacheManager.h"

@implementation KDCacheManager
+ (instancetype)sharedInstance
{
    __strong static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init
{
    self = [super init];
    return self;
}

-(YYCache *)systemCache
{
    YYCache *systemCache = [YYCache cacheWithName:kSystemCacheName];
    return systemCache;
}
-(YYCache *)userCache
{
    YYCache *userCache = [YYCache cacheWithName:kUserCacheName];
    return userCache;
}
@end
