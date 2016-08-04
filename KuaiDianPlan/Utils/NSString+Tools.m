//
//  NSString+Tools.m
//  KuaiDianPlan
//
//  Created by ppnd on 16/8/4.
//  Copyright © 2016年 zy. All rights reserved.
//

#import "NSString+Tools.h"

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
@end
