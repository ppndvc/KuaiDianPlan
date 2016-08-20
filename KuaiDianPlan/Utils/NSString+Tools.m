//
//  NSString+Tools.m
//  KuaiDianPlan
//
//  Created by ppnd on 16/8/4.
//  Copyright © 2016年 zy. All rights reserved.
//

#import "NSString+Tools.h"

#define anHour  3600
#define aMinute 60

#define TODAY_STRING @"今天"
#define YESTODAY_STRING @"昨天"

@implementation NSString (Tools)

-(BOOL)containSubStr:(NSString *)subStr
{
    BOOL contain = NO;
    
    if (VALIDATE_STRING(subStr))
    {
        if (IS_OS_8_OR_LATER)
        {
            contain = [self containsString:subStr];
        }
        else
        {
            NSRange range = [self rangeOfString:subStr];
            
            if ( range.location != NSNotFound)
            {
                contain = YES;
            }
        }
    }
    
    return contain;
}
+(NSString *)weiboFormateTimeWithTimeInterval:(NSTimeInterval)dateStamp
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    //将当前时间转化为时间戳
    NSTimeInterval currentDateStamp = [currentDate timeIntervalSince1970] + 8 * anHour;

    //获取当前时间的小时单位（24小时制）
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"H"];
    int nowHour = [[formatter stringFromDate:currentDate] intValue];
    //获取当前时间的分钟单位
    NSDateFormatter *minFormatter = [NSDateFormatter new];
    [minFormatter setDateFormat:@"m"];
    int nowMinute = [[minFormatter stringFromDate:currentDate] intValue];
    //今天0点的时间戳
    double todayZeroClock = currentDateStamp - anHour * nowHour - aMinute * nowMinute;
    //时间格式化，为输出做准备
    NSDateFormatter *outputFormat = [NSDateFormatter new];
    [outputFormat setDateFormat:@"M月d日 HH:mm"];
    
    //已经超过两天以上
    if (todayZeroClock - dateStamp > 24 * anHour)
    {
        NSDateFormatter *outputFormat = [NSDateFormatter new];
        [outputFormat setDateFormat:@"M月d日 HH:mm"];
        
        return [outputFormat stringFromDate:[NSDate dateWithTimeIntervalSince1970:dateStamp]];
    }
    //已经超过一天（昨天）
    else if (todayZeroClock - dateStamp > 0)
    {
        NSDateFormatter *outputFormat = [NSDateFormatter new];
        [outputFormat setDateFormat:@"HH:mm"];
        NSString *timeStr = [outputFormat stringFromDate:[NSDate dateWithTimeIntervalSince1970:dateStamp]];
        return [NSString stringWithFormat:@"%@ %@",YESTODAY_STRING,timeStr];
    }
    else
    {
        NSDateFormatter *outputFormat = [NSDateFormatter new];
        [outputFormat setDateFormat:@"HH:mm"];
        NSString *timeStr = [outputFormat stringFromDate:[NSDate dateWithTimeIntervalSince1970:dateStamp]];
        return [NSString stringWithFormat:@"%@ %@",TODAY_STRING,timeStr];
    }
}
@end
