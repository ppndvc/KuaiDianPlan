//
//  KDRouterManger.m
//  KuaiDianPlan
//
//  Created by ppnd on 16/6/23.
//  Copyright © 2016年 zy. All rights reserved.
//

#import "KDRouterManger.h"

#define ROUTER_FILES @"router_files"
#define CLASS_NAME @"class_name"

#define PerformSelectorWithIgnoreWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@interface KDRouterManger ()
//保存路由表的字典
@property(nonatomic,strong)NSMutableDictionary *routerDictionary;

@end

@implementation KDRouterManger

static KDRouterManger *sharedInstance;
+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[KDRouterManger alloc] init];
    });
    
    return sharedInstance;
}
-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self configureRouterPlist];
    }
    
    return self;
}
-(void)configureRouterPlist
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:ROUTER_FILES ofType:@"plist"];
    if(VALIDATE_STRING(plistPath))
    {
        _routerDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    }
}

//以push的方式加载视图
-(void)pushVCWithKey:(NSString *)vcKey parentVC:(UIViewController *)parentVC
{
    [self pushVCWithKey:vcKey parentVC:parentVC params:nil animate:YES vcDisappearBlock:nil];
}

//以push的方式加载视图
-(void)pushVCWithKey:(NSString *)vcKey parentVC:(UIViewController *)parentVC  params:(id)params
{
    [self pushVCWithKey:vcKey parentVC:parentVC params:params animate:YES vcDisappearBlock:nil];
}

//以push的方式加载视图，有结束回调
-(void)pushVCWithKey:(NSString *)vcKey parentVC:(UIViewController *)parentVC  params:(id)params animate:(BOOL)animate vcDisappearBlock:(KDRouterVCDisappearBlock)vcDisappearBlock
{
    if (parentVC && [parentVC isKindOfClass:[UIViewController class]])
    {
        id vc = [self getVCFromVCKey:vcKey];
        if (vc)
        {
            //设置页面间传递的参数
            SEL setParamMethod = NSSelectorFromString(@"setVCParams:");
            
            if ([vc respondsToSelector:setParamMethod] && params)
            {
                PerformSelectorWithIgnoreWarning([vc performSelector:setParamMethod withObject:params]);
            }
            
            //默认设置代理（如果有）
            //            SEL setDelegate = NSSelectorFromString(@"setDelegate:");
            //
            //            if ([vc respondsToSelector:setDelegate])
            //            {
            //                PerformSelectorWithIgnoreWarning([vc performSelector:setDelegate withObject:parentVC]);
            //            }
            
            //设置页面pop回来的回调
            SEL setBlockMethod = NSSelectorFromString(@"setVCDisappearBlock:");
            
            if ([vc respondsToSelector:setBlockMethod] && vcDisappearBlock)
            {
                PerformSelectorWithIgnoreWarning([vc performSelector:setBlockMethod withObject:vcDisappearBlock]);
            }
            
            if ([[NSThread currentThread] isMainThread])
            {
                ((UIViewController *)vc).hidesBottomBarWhenPushed = YES;
                if ([parentVC.navigationController.viewControllers containsObject:vc])
                {
                    [parentVC.navigationController popToViewController:vc animated:animate];
                }
                else
                {
                    [parentVC.navigationController pushViewController:vc animated:animate];
                }
            }
            else
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    ((UIViewController *)vc).hidesBottomBarWhenPushed = YES;
                    if ([parentVC.navigationController.viewControllers containsObject:vc])
                    {
                        [parentVC.navigationController popToViewController:vc animated:animate];
                    }
                    else
                    {
                        [parentVC.navigationController pushViewController:vc animated:animate];
                    }
                });
            }
        }
    }
}

//以模态视图的方式加载视图
-(void)presentVCWithKey:(NSString *)vcKey parentVC:(UIViewController *)parentVC
{
    [self presentVCWithKey:vcKey parentVC:parentVC params:nil  animate:YES vcAppearBlock:nil vcDisappearBlock:nil];
}

//以模态视图的方式加载视图，有dismiss回调
-(void)presentVCWithKey:(NSString *)vcKey parentVC:(UIViewController *)parentVC params:(id)params vcDisappearBlock:(KDRouterVCDisappearBlock)vcDisappearBlock
{
    [self presentVCWithKey:vcKey parentVC:parentVC params:params animate:YES vcAppearBlock:nil vcDisappearBlock:vcDisappearBlock];
}

//以模态视图的方式加载视图，有dismiss回调
-(void)presentVCWithKey:(NSString *)vcKey parentVC:(UIViewController *)parentVC params:(id)params animate:(BOOL)animate vcAppearBlock:(KDRouterVCAppearBlock)vcAppearBlock vcDisappearBlock:(KDRouterVCDisappearBlock)vcDisappearBlock
{
    if (parentVC && [parentVC isKindOfClass:[UIViewController class]])
    {
        id vc = [self getVCFromVCKey:vcKey];
        if (vc)
        {
            //设置页面间传递的参数
            SEL setParamMethod = NSSelectorFromString(@"setVCParams:");
            
            if ([vc respondsToSelector:setParamMethod] && params)
            {
                PerformSelectorWithIgnoreWarning([vc performSelector:setParamMethod withObject:params]);
            }
            
            //设置页面dismiss回来的回调
            SEL setBlockMethod = NSSelectorFromString(@"setVCDisappearBlock:");
            
            if ([vc respondsToSelector:setBlockMethod] && vcDisappearBlock)
            {
                PerformSelectorWithIgnoreWarning([vc performSelector:setBlockMethod withObject:vcDisappearBlock]);
            }
            
            
            if (![[NSThread currentThread] isMainThread])
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [parentVC presentViewController:vc animated:animate completion:vcAppearBlock];
                });
            }
            else
            {
                [parentVC presentViewController:vc animated:animate completion:vcAppearBlock];
            }
        }
    }
}

-(id)getVCFromVCKey:(NSString *)vcKey
{
    id vc = nil;
    if (VALIDATE_STRING(vcKey) && _routerDictionary)
    {
        NSDictionary *classDict = [_routerDictionary objectForKey:vcKey];
        if (classDict)
        {
            NSString *classString = [classDict objectForKey:CLASS_NAME];
            if (VALIDATE_STRING(classString))
            {
                Class classFromString = NSClassFromString(classString);
                vc = [[classFromString alloc] init];
            }
        }
    }
    
    return vc;
}
@end
