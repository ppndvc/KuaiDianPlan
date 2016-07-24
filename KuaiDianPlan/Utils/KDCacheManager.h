//
//  KDCacheManager.h
//  KuaiDianPlan
//
//  Created by ppnd on 16/6/18.
//  Copyright © 2016年 zy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYCache.h"

@interface KDCacheManager : NSObject
//类方法
+ (instancetype)sharedInstance;

//系统配置的cache
-(YYCache *)systemCache;

//用户cache
-(YYCache *)userCache;

@end
