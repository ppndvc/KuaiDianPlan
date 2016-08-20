//
//  KDDefines.h
//  KuaiDianPlan
//
//  Created by ppnd on 16/6/11.
//  Copyright © 2016年 zy. All rights reserved.
//

#pragma mark - Metric & System

//系统版本定义
#define IS_OS_7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue]>= 7.0)
//系统版本定义
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue]>= 8.0)
//屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//判断是否合法字符串
#define VALIDATE_STRING(a) ((a) && [(a) isKindOfClass:[NSString class]] && (a).length > 0)

//导航栏 + 状态栏高度
#define NAVIGATION_BAR_HEIHT 64

//tabbar高度
#define TAB_BAR_HEIHT 49

//分割栏高度
#define GENERAL_SEPERATOR_HEIGHT 10.0f

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#pragma mark - Colors

//导航栏颜色
#define NAVIBAR_BG_COLOR ([UIColor colorWithRed:233/255.0 green:64/255.0 blue:52/255.0 alpha:1])
//导航栏标题颜色
#define NAVIBAR_TITLE_COLOR ([UIColor whiteColor])
//tabbar背景颜色
#define TABBAR_BG_COLOR ([UIColor whiteColor])
//页面背景颜色
#define APP_BG_COLOR ([UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1])
//分割线颜色
#define SEPERATOR_COLOR ([UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1])
//次要文本颜色
#define TEXT_LOW_COLOR ([UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1])
//详细文本颜色
#define TEXT_MEDIUM_COLOR ([UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1])
//重要文本标题颜色
#define TEXT_HIGH_COLOR ([UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1])
//tabbar选中标题颜色
#define TABBAR_SELECTED_TEXT_COLOR ([UIColor colorWithRed:234/255.0 green:63/255.0 blue:53/255.0 alpha:1])
//hud背景颜色
#define HUD_BG_COLOR ([UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:0.9])
//hud前景颜色
#define HUD_FG_COLOR ([UIColor whiteColor])
//价格橘色
#define PRICE_ORANG_COLOR ([UIColor colorWithRed:253/255.0 green:97/255.0 blue:33/255.0 alpha:1])
//红色
#define APPD_RED_COLOR ([UIColor colorWithRed:234/255.0 green:63/255.0 blue:53/255.0 alpha:1])

#pragma mark - Font Size

//导航栏标题字体
#define NAVIBAR_TITLE_FONT_SIZE 20.0f

//文本字体特大
#define TEXT_FONT_VERY_BIG_SIZE 20.0f
//文本字体大
#define TEXT_FONT_BIG_SIZE 16.0f
//文本字体中
#define TEXT_FONT_MEDIUM_SIZE 14.0f
//文本字体小
#define TEXT_FONT_SMALL_SIZE 12.0f
//hud文本字体
#define HUD_FONT_SIZE 16.0f

#pragma mark - Enums

//网络错误页面类型
typedef NS_ENUM(NSInteger, KDNetworkErrorType)
{
    //网络不可达
    KDNetworkNoReachable = 0,
    //网络请求请求错误
    KDNetworkRequestError = 1,
};

//网络环境类型
typedef NS_ENUM(NSInteger, KDEnvironmentType)
{
    //生产环境
    KDEnvironmentTypeOfProduct = 0,
    //测试环境
    KDEnvironmentTypeOfTest = 1,
};
//URL前缀类型
typedef NS_ENUM(NSInteger, KDURLPrefixType)
{
    //http
    KDURLPrefixTypeOfHTTP = 0,
    //https
    KDURLPrefixTypeOfHTTPS = 1,
};

//导航栏返回类型
typedef NS_ENUM(NSInteger, KDNavigationBackType)
{
    //返回上一页面
    KDNavigationBackToPreviousVC = 0,
    //返回根视图
    KDNavigationBackToRootVC = 1,
    //不显示返回按钮
    KDNavigationNoBackAction = 2,
};

//Mall页面类型
typedef NS_ENUM(NSInteger, KDMallType)
{
    //快点
    KDMallTypeOfDefault = 0,
    //美食
    KDMallTypeOfDeliciousFood = 1,
    //品牌馆
    KDMallTypeOfBrandShop = 2,
    //商城
    KDMallTypeOfNormalShop = 3,
    //早餐
    KDMallTypeOfBreakFast = 4,
};

//订单状态类型
typedef NS_ENUM(NSInteger, KDOrderStatus)
{
    //未支付
    KDOrderStatusOfNotCharged = 0,
    //未接单
    KDOrderStatusOfNotAccepted = 1,
    //已接单
    KDOrderStatusOfAlreadyAccepted = 2,
    //正在派送
    KDOrderStatusOfDelivering = 3,
    //已完成但未评价
    KDOrderStatusOfSuccessButNoEvaluated = 4,
    //已完成以评价
    KDOrderStatusOfSuccessAndEvaluated = 5,
};
#pragma mark - Blocks

//错误页面的点击回调
typedef void (^KDNetworkErrorPageTapBlock)(KDNetworkErrorType type);

//视图显示的回调
typedef void (^KDRouterVCAppearBlock)(void);

//视图消失的回调
typedef void (^KDRouterVCDisappearBlock)(NSString *vcKey, id params);

//刷新页面回调
typedef void (^KDMainPageUpdateCallBackBlock)(NSArray *headerViewModels);

#pragma mark - static strings

//日志等级
extern int const ddLogLevel;

//系统缓存
extern NSString *const kSystemCacheName;
//用户缓存
extern NSString *const kUserCacheName;

#pragma mark - defined strings

#define APP_NAME @"快点"

#define TABBAR_MAINPAGE_TITLE @"主页"

#define TABBAR_ORDER_TITLE @"订单"

#define TABBAR_FASTMEAL_TITLE @"抢饭"

#define TABBAR_MINE_TITLE @"我的"

#define DELICIOUS_FOOD @"美食"
#define BRAND_SHOP @"品牌馆"
#define NORMAL_SHOP @"商城"
#define BREAKFAST @"早餐"

#define CATEGORY_SEARCH @"分类"
#define SORT_SEARCH @"排序"
#define FILTER_SEARCH @"筛选"

#define ORDER_NOT_ACCEPTED @"商家未接单"
#define ORDER_HAS_ACCEPTED @"商家已接单"
#define ORDER_IS_DELIVERING @"配送途中"
#define ORDER_COMPLETED @"订单已完成"

#define BEING_CHARGE_BUTTON_TITLE @"待支付"
#define ALREADY_CHARGED_BUTTON_TITLE @"已支付"
#define BEING_EVALUATE_BUTTON_TITLE @"评价"
#define ALREADY_EVALUATE_BUTTON_TITLE @"已评价"

#pragma mark - image name strings

//tabbar
#define TABBAR_MAINPAGE_IMAGE_NORMAL @"main_page_normal"
#define TABBAR_MAINPAGE_IMAGE_SELECTED @"main_page_selected"

#define TABBAR_ORDER_IMAGE_NORMAL @"order_normal"
#define TABBAR_ORDER_IMAGE_SELECTED @"order_selected"

#define TABBAR_FASTMEAL_IMAGE_NORMAL @"fast_meal_normal"
#define TABBAR_FASTMEAL_IMAGE_SELECTED @"fast_meal_selected"

#define TABBAR_MINE_IMAGE_NORMAL @"mine_normal"
#define TABBAR_MINE_IMAGE_SELECTED @"mine_selected"

