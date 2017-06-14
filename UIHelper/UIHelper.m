//
//  UIHelper.m
//  test
//
//  Created by suhc on 2017/6/14.
//  Copyright © 2017年 hclib. All rights reserved.
//

#import "UIHelper.h"

@implementation UIHelper

static UIHelper *_instance;

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
+ (instancetype)sharedHelper
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

@end
