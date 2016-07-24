//
//  KDShopModel.h
//  KuaiDianPlan
//
//  Created by ppnd on 16/7/24.
//  Copyright © 2016年 zy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDShopModel : NSObject

//商家名字
@property(nonatomic,copy)NSString *name;

//商家ID
@property(nonatomic,copy)NSString *shopID;

//图片地址
@property(nonatomic,copy)NSString *imageURL;

//地址
@property(nonatomic,copy)NSString *address;

//分类
@property(nonatomic,copy)NSString *category;

//活动
@property(nonatomic,strong)NSArray *activityArray;

//商家平分
@property(nonatomic,assign)CGFloat score;

//销量
@property(nonatomic,assign)NSInteger salesVolume;

//最低价
@property(nonatomic,assign)CGFloat minPrice;

//运费
@property(nonatomic,assign)CGFloat transportExpend;

//距离
@property(nonatomic,assign)CGFloat distance;

@end
