//
//  UIView+Helper.m
//  UIHelper
//
//  Created by suhc on 2017/6/13.
//  Copyright © 2017年 hclib. All rights reserved.
//

#import "UIView+Helper.h"

@implementation UIView (Helper)

- (void)showChangeFrameAlert{
    NSString *title = [NSString stringWithFormat:@"%@",NSStringFromClass(self.class)];
    NSString *message = [NSString stringWithFormat:@"%@",NSStringFromCGRect(self.frame)];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"x";
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.frame.origin.x];
        NSString *text1 = [NSString stringWithFormat:@"%.1f",self.frame.origin.x];
        textField.text = text0;
        if (text0.floatValue != text1.floatValue) {
            textField.text = text1;
        }
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"y";
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.frame.origin.y];
        NSString *text1 = [NSString stringWithFormat:@"%.1f",self.frame.origin.y];
        textField.text = text0;
        if (text0.floatValue != text1.floatValue) {
            textField.text = text1;
        }
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"width";
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.frame.size.width];
        NSString *text1 = [NSString stringWithFormat:@"%.1f",self.frame.size.width];
        textField.text = text0;
        if (text0.floatValue != text1.floatValue) {
            textField.text = text1;
        }
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"height";
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.frame.size.height];
        NSString *text1 = [NSString stringWithFormat:@"%.1f",self.frame.size.height];
        textField.text = text0;
        if (text0.floatValue != text1.floatValue) {
            textField.text = text1;
        }
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    if ([self isKindOfClass:[UILabel class]] || [self isKindOfClass:[UIButton class]]) {
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"font";
            CGFloat font = 0;
            if ([self isKindOfClass:[UILabel class]]) {
                font = ((UILabel *)self).font.pointSize;
            }else{
                font = ((UIButton *)self).titleLabel.font.pointSize;
            }
            textField.text = [NSString stringWithFormat:@"%.f",font];
            textField.keyboardType = UIKeyboardTypeNumberPad;
        }];
    }
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if ([self isKindOfClass:[UILabel class]] || [self isKindOfClass:[UIButton class]]) {
            UITextField *fontField = alert.textFields[4];
            if ([self isKindOfClass:[UILabel class]]) {
                ((UILabel *)self).font = [UIFont systemFontOfSize:fontField.text.floatValue];
            }else{
                ((UIButton *)self).titleLabel.font = [UIFont systemFontOfSize:fontField.text.floatValue];
            }
        }
        
        UITextField *xField = alert.textFields[0];
        UITextField *yField = alert.textFields[1];
        UITextField *widthField = alert.textFields[2];
        UITextField *heightField = alert.textFields[3];
        CGFloat x = self.frame.origin.x;
        CGFloat y = self.frame.origin.y;
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        if (xField.text.length > 0) {
            x = xField.text.floatValue;
        }
        if (yField.text.length > 0) {
            y = yField.text.floatValue;
        }
        if (widthField.text.length > 0) {
            width = widthField.text.floatValue;
        }
        if (heightField.text.length > 0) {
            height = heightField.text.floatValue;
        }
        self.frame = CGRectMake(x, y, width, height);
    }];
    [alert addAction:confirm];
    [[self getController] presentViewController:alert animated:YES completion:nil];
}

- (void)addUIHelperRecursive:(BOOL)recursive{
    if ([self isKindOfClass:[UILabel class]] || [self isKindOfClass:[UIImageView class]]) {
        self.userInteractionEnabled = YES;
    }
    UITapGestureRecognizer *showAlertTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showChangeFrameAlert)];
    showAlertTap.numberOfTapsRequired = 2;
    if (recursive) {
        for (UIView *subView in self.subviews) {
            [subView addUIHelperRecursive:recursive];
        }
    }
    [self addGestureRecognizer:showAlertTap];
}

//获取当前view所在的controller
- (UIViewController *)getController {
    for (UIView *next = self.superview; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
