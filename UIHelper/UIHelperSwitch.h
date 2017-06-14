//
//  UIHelperSwitch.h
//  UIHelper
//
//  Created by suhc on 2017/6/14.
//  Copyright © 2017年 hclib. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIHelperSwitch : NSObject

/**获取开关单例*/
+ (instancetype)sharedSwitch;

/**是否开启UIHelper服务(请在项目启动的时候(AppDelegate.m里面)设置该值)*/
@property (nonatomic, assign, getter=isEnabled) BOOL enabled;

@end
