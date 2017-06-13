//
//  UIView+Helper.h
//  UIHelper
//
//  Created by suhc on 2017/6/13.
//  Copyright © 2017年 hclib. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface UIView (Helper)

/**
 为当前视图添加UIHelper

 @param recursive 是否递归(为其子视图也添加UIHelper(注:不包含其孙视图))
 */
- (void)addUIHelperRecursive:(BOOL)recursive;

@end
