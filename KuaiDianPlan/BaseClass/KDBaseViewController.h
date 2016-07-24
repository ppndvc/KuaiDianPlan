//
//  KDBaseViewController.h
//  KuaiDianPlan
//
//  Created by ppnd on 16/6/11.
//  Copyright © 2016年 zy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KDBaseViewController : UIViewController

//页面参数
@property(nonatomic,strong) NSDictionary *parameters;


//网络是否可达
-(BOOL)isNetworkReachable;

@end
