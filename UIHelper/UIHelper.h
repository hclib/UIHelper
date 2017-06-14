//
//  UIHelper.h
//  test
//
//  Created by suhc on 2017/6/14.
//  Copyright © 2017年 hclib. All rights reserved.
//

//  代码地址:https://github.com/hclib/UIHelper
//  技术交流QQ群:429807817 申请加入请备注:UIHelper，方便验证，欢迎加入!

#import "UIView+Helper.h"

@interface UIHelper : NSObject

/**获取UIHelper单例*/
+ (instancetype)sharedHelper;

/**是否开启UIHelper服务(请在项目启动的时候(AppDelegate.m里面)设置该值)*/
@property (nonatomic, assign, getter=isEnabled) BOOL enabled;

@end
