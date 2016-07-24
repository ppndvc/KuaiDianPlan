//
//  KDEnvironmentManager.m
//  KuaiDianPlan
//
//  Created by ppnd on 16/6/18.
//  Copyright © 2016年 zy. All rights reserved.
//

#import "KDEnvironmentManager.h"
#import "KDCacheManager.h"

#define ENVIRONMENT_CONFIGURE @"environment_configure"

#define ENV_CODE @"env_code"
#define PREFIX_CODE @"prefix_code"
#define REQUEST_DOMAIN_KEY @"request_domain_key"
#define HTTP @"http://"
#define HTTPS @"htps://"
#define DEFAULT_TEST_ENV_DOAMIN @"www.baidu.com"
#define DEFAULT_PRODUCT_ENV_DOAMIN @"www.baidu.com"

@interface KDEnvironmentManager()

//网络环境类型
@property(nonatomic, assign)KDEnvironmentType type;
//url前缀
@property(nonatomic, assign)KDURLPrefixType urlPrefix;
//网络请求的基础url
@property(nonatomic, copy)NSString *baseURL;

@end

@implementation KDEnvironmentManager

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
    
    if (self)
    {
        [self _initEnvironmentConfigure];
    }
    
    return self;
}

#pragma mark - setter and getter
-(void)setEnvironmentType:(KDEnvironmentType)type
{
    if (type != _type)
    {
        _type = type;
        [self _synchEnvironmentToCache];

    }
}
-(void)setURLPrfixType:(KDURLPrefixType)prefixType
{
    if (prefixType != _urlPrefix)
    {
        _urlPrefix = prefixType;
        [self _synchEnvironmentToCache];
    }
}
-(KDEnvironmentType)getEnvironmentType
{
    return _type;
}

-(KDURLPrefixType)getURLPrefixType
{
    return _urlPrefix;
}
-(NSString *)getBaseURL
{
    if (VALIDATE_STRING(_baseURL))
    {
        return _baseURL;
    }
    else
    {
        if (_type == KDEnvironmentTypeOfTest)
        {
            _baseURL = [NSString stringWithFormat:@"%@%@/",HTTP,DEFAULT_TEST_ENV_DOAMIN];
            return _baseURL;
        }
        else
        {
            _baseURL = [NSString stringWithFormat:@"%@%@/",HTTPS,DEFAULT_PRODUCT_ENV_DOAMIN];
            return _baseURL;
        }
    }
}

#pragma mark - private methods
-(void)_synchEnvironmentToCache
{
    NSDictionary *envDict = @{ENV_CODE:[NSNumber numberWithInteger:_type],PREFIX_CODE:[NSNumber numberWithInteger:_urlPrefix]};
    
    if (envDict)
    {
        [[[KDCacheManager sharedInstance] systemCache] setObject:envDict forKey:ENVIRONMENT_CONFIGURE];
    }
}
-(void)_initEnvironmentConfigure
{
    NSDictionary *envConfigure = (NSDictionary *)[[[KDCacheManager sharedInstance] systemCache] objectForKey:ENVIRONMENT_CONFIGURE];
    NSString *domainStr = nil;
    
#ifdef DEBUG
    
    if (envConfigure && [envConfigure isKindOfClass:[NSDictionary class]])
    {
        domainStr = [envConfigure objectForKey:REQUEST_DOMAIN_KEY];
        
        NSNumber *typeNum = [envConfigure objectForKey:ENV_CODE];
        
        if (typeNum && [typeNum isKindOfClass:[NSNumber class]])
        {
            _type = [typeNum integerValue];
        }
        else
        {
            _type = KDEnvironmentTypeOfTest;
        }
        
        NSNumber *prefixNum = [envConfigure objectForKey:PREFIX_CODE];
        if (prefixNum && [prefixNum isKindOfClass:[NSNumber class]])
        {
            _urlPrefix = [prefixNum integerValue];
        }
        else
        {
            _urlPrefix = KDURLPrefixTypeOfHTTP;
        }
        
    }
    else
    {
        _type = KDEnvironmentTypeOfTest;
        _urlPrefix = KDURLPrefixTypeOfHTTP;
    }
    
    if (VALIDATE_STRING(domainStr))
    {
        if (_urlPrefix == KDURLPrefixTypeOfHTTP)
        {
            _baseURL = [NSString stringWithFormat:@"%@%@/",HTTP,domainStr];
        }
        else
        {
            _baseURL = [NSString stringWithFormat:@"%@%@/",HTTPS,domainStr];
        }
    }
    else
    {
        if (_urlPrefix == KDURLPrefixTypeOfHTTP)
        {
            if (_type == KDEnvironmentTypeOfTest)
            {
                _baseURL = [NSString stringWithFormat:@"%@%@/",HTTP,DEFAULT_TEST_ENV_DOAMIN];
            }
            else
            {
                _baseURL = [NSString stringWithFormat:@"%@%@/",HTTP,DEFAULT_PRODUCT_ENV_DOAMIN];
            }
        }
        else
        {
            if (_type == KDEnvironmentTypeOfTest)
            {
                _baseURL = [NSString stringWithFormat:@"%@%@/",HTTPS,DEFAULT_TEST_ENV_DOAMIN];
            }
            else
            {
                _baseURL = [NSString stringWithFormat:@"%@%@/",HTTPS,DEFAULT_PRODUCT_ENV_DOAMIN];
            }
        }
    }
#else
    _type = KDEnvironmentTypeOfProduct;
    _urlPrefix = KDURLPrefixTypeOfHTTPS;
    
    if (envConfigure && [envConfigure isKindOfClass:[NSDictionary class]])
    {
        domainStr = [envConfigure objectForKey:REQUEST_DOMAIN_KEY];
    }
    
    if (VALIDATE_STRING(domainStr))
    {
        _baseURL = [NSString stringWithFormat:@"%@%@/",HTTPS,domainStr];
    }
    else
    {
        _baseURL = [NSString stringWithFormat:@"%@%@/",HTTPS,DEFAULT_PRODUCT_ENV_DOAMIN];
    }
#endif
}
@end
