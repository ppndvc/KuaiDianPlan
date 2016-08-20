//
//  KDOrderModel.h
//  KuaiDianPlan
//
//  Created by ppnd on 16/8/8.
//  Copyright © 2016年 zy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KDOrderModel : NSObject

//订单ID
@property(nonatomic,copy)NSString *orderID;

//商家名字
@property(nonatomic,copy)NSString *shopName;

//商家ID
@property(nonatomic,copy)NSString *shopID;

//图片地址
@property(nonatomic,copy)NSString *imageURL;

//图片名字
@property(nonatomic,copy)NSString *imageName;

//订单描述
@property(nonatomic,copy)NSString *orderDescriptionString;

//菜单描述
@property(nonatomic,copy)NSString *foodDescriptionString;

//分类
@property(nonatomic,assign)NSTimeInterval createTime;

//活动
@property(nonatomic,strong)NSArray *activityArray;

//商家平分
@property(nonatomic,assign)KDOrderStatus orderStatus;

//状态描述
@property(nonatomic,copy)NSString *statusDescriptionString;

//总价
@property(nonatomic,assign)CGFloat totalPrice;

//取货码
@property(nonatomic,copy)NSString *pickUpCode;


@end
