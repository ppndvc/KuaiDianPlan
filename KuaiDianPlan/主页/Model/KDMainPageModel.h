//
//  KDMainPageModel.h
//  KuaiDianPlan
//
//  Created by ppnd on 16/8/2.
//  Copyright © 2016年 zy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDMainPageModel : NSObject

//头部轮播图数组
@property(nonatomic,strong)NSArray *headerViewModelArray;

//操作面板数组
@property(nonatomic,strong)NSArray *collectionViewModelArray;

//商家数组
@property(nonatomic,strong)NSArray *tableViewModelArray;

@end
