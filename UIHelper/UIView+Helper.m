//
//  UIView+Helper.m
//  UIHelper
//
//  Created by suhc on 2017/6/13.
//  Copyright © 2017年 hclib. All rights reserved.
//

#import "UIView+Helper.h"
#import "UIHelperSwitch.h"

@implementation UIView (Helper)

- (void)showChangeFrameAlert{
    NSString *title = [NSString stringWithFormat:@"%@",NSStringFromClass(self.class)];
    NSString *message = [NSString stringWithFormat:@"%@",NSStringFromCGRect(self.frame)];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    //0.x
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSString *placeholder = nil;
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.frame.origin.x];
        NSString *text1 = [NSString stringWithFormat:@"%.1f",self.frame.origin.x];
        placeholder = text0;
        if (text0.floatValue != text1.floatValue) {
            placeholder = text1;
        }
        textField.placeholder = [NSString stringWithFormat:@"x=%@",placeholder];
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    //1.y
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSString *placeholder = nil;
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.frame.origin.y];
        NSString *text1 = [NSString stringWithFormat:@"%.1f",self.frame.origin.y];
        placeholder = text0;
        if (text0.floatValue != text1.floatValue) {
            placeholder = text1;
        }
        textField.placeholder = [NSString stringWithFormat:@"y=%@",placeholder];
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    //2.width
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSString *placeholder = nil;
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.frame.size.width];
        NSString *text1 = [NSString stringWithFormat:@"%.1f",self.frame.size.width];
        placeholder = text0;
        if (text0.floatValue != text1.floatValue) {
            placeholder = text1;
        }
        textField.placeholder = [NSString stringWithFormat:@"width=%@",placeholder];
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    //3.height
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSString *placeholder = nil;
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.frame.size.height];
        NSString *text1 = [NSString stringWithFormat:@"%.1f",self.frame.size.height];
        placeholder = text0;
        if (text0.floatValue != text1.floatValue) {
            placeholder = text1;
        }
        textField.placeholder = [NSString stringWithFormat:@"height=%@",placeholder];
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    //4.backgroundColor
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = [NSString stringWithFormat:@"backgroundColor=%@",[self hexStrForColor:self.backgroundColor]];
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    //UILabel && UIButton
    if ([self isKindOfClass:[UILabel class]] || [self isKindOfClass:[UIButton class]]) {
        //5.font
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            CGFloat font = 0;
            if ([self isKindOfClass:[UILabel class]]) {
                font = ((UILabel *)self).font.pointSize;
            }else{
                font = ((UIButton *)self).titleLabel.font.pointSize;
            }
            textField.placeholder = [NSString stringWithFormat:@"fontsize=%.f",font];
            textField.keyboardType = UIKeyboardTypeNumberPad;
        }];
        //6.textColor
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            UIColor *textColor = nil;
            if ([self isKindOfClass:[UILabel class]]) {
                textColor = ((UILabel *)self).textColor;
            }else{
                textColor = ((UIButton *)self).titleLabel.textColor;
            }
            textField.placeholder = [NSString stringWithFormat:@"textColor=%@",[self hexStrForColor:textColor]];
            textField.keyboardType = UIKeyboardTypeNumberPad;
        }];
    }
    //7.borderWidth
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSString *placeholder = nil;
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.layer.borderWidth];
        NSString *text1 = [NSString stringWithFormat:@"%.1f",self.layer.borderWidth];
        placeholder = text0;
        if (text0.floatValue != text1.floatValue) {
            placeholder = text1;
        }
        textField.placeholder = [NSString stringWithFormat:@"borderWidth=%@",placeholder];
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    //8.borderColor
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = [NSString stringWithFormat:@"borderColor=%@",[self hexStrForColor:[UIColor colorWithCGColor:self.layer.borderColor]]];
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    //9.cornerRadius
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSString *placeholder = nil;
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.layer.cornerRadius];
        NSString *text1 = [NSString stringWithFormat:@"%.1f",self.layer.cornerRadius];
        placeholder = text0;
        if (text0.floatValue != text1.floatValue) {
            placeholder = text1;
        }
        textField.placeholder = [NSString stringWithFormat:@"cornerRadius=%@",placeholder];
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    //10.backgroundColor.alpha
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSString *placeholder = nil;
        NSString *alpha = [self alphaStrForColor:self.backgroundColor];
        
        NSString *text0 = [NSString stringWithFormat:@"%.f",alpha.floatValue];
        NSString *text1 = [NSString stringWithFormat:@"%.2f",alpha.floatValue];
        placeholder = text0;
        if (text0.floatValue != text1.floatValue) {
            placeholder = text1;
        }
        textField.placeholder = [NSString stringWithFormat:@"backgroundColor.alpha=%@",placeholder];
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    //11.self.alpha
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        NSString *placeholder = nil;
        NSString *text0 = [NSString stringWithFormat:@"%.f",self.alpha];
        NSString *text1 = [NSString stringWithFormat:@"%.2f",self.alpha];
        placeholder = text0;
        if (text0.floatValue != text1.floatValue) {
            placeholder = text1;
        }
        
        textField.placeholder = [NSString stringWithFormat:@"self.alpha=%@",placeholder];
        textField.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //0.x
        UITextField *xField = alert.textFields[0];
        //1.y
        UITextField *yField = alert.textFields[1];
        //2.width
        UITextField *widthField = alert.textFields[2];
        //3.height
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
        //4.backgroundColor
        UITextField *backgroundColorField = alert.textFields[4];
        if (backgroundColorField.text.length > 0) {
            self.backgroundColor = [self colorWithHexString:backgroundColorField.text];
        }
        //UILabel && UIButton
        UITextField *borderWidthField = nil;
        UITextField *borderColorField = nil;
        UITextField *cornerRadiusField = nil;
        UITextField *backgroundColorAlphaField = nil;
        UITextField *selfAlphaField = nil;
        if ([self isKindOfClass:[UILabel class]] || [self isKindOfClass:[UIButton class]]) {
            //5.font
            UITextField *fontField = alert.textFields[5];
            if (fontField.text.length > 0) {
                if ([self isKindOfClass:[UILabel class]]) {
                    ((UILabel *)self).font = [UIFont systemFontOfSize:fontField.text.floatValue];
                }else{
                    ((UIButton *)self).titleLabel.font = [UIFont systemFontOfSize:fontField.text.floatValue];
                }
            }
            //6.textColor
            UITextField *textColorField = alert.textFields[6];
            if (textColorField.text.length > 0) {
                if ([self isKindOfClass:[UILabel class]]) {
                    ((UILabel *)self).textColor = [self colorWithHexString:textColorField.text];
                }else{
                    [((UIButton *)self) setTitleColor:[self colorWithHexString:textColorField.text] forState:UIControlStateNormal];
                }
            }
            borderWidthField = alert.textFields[7];
            borderColorField = alert.textFields[8];
            cornerRadiusField = alert.textFields[9];
            backgroundColorAlphaField = alert.textFields[10];
            selfAlphaField = alert.textFields[11];
        }else{
            borderWidthField = alert.textFields[5];
            borderColorField = alert.textFields[6];
            cornerRadiusField = alert.textFields[7];
            backgroundColorAlphaField = alert.textFields[8];
            selfAlphaField = alert.textFields[9];
        }
        //borderWidth
        if (borderWidthField.text.length > 0) {
            self.layer.borderWidth = borderWidthField.text.floatValue;
        }
        //borderColor
        if (borderColorField.text.length > 0) {
            self.layer.borderColor = [self colorWithHexString:borderColorField.text].CGColor;
        }
        //cornerRadius
        if (cornerRadiusField.text.length > 0) {
            self.layer.cornerRadius = cornerRadiusField.text.floatValue;
        }
        //backgroundColor.alpha
        if (backgroundColorAlphaField.text.length > 0) {
            self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:backgroundColorAlphaField.text.floatValue];
        }
        //self.alpha
        if (selfAlphaField.text.length > 0) {
            self.alpha = selfAlphaField.text.floatValue;
        }
    }];
    [alert addAction:confirm];
    [[self getController] presentViewController:alert animated:YES completion:nil];
}

- (void)addUIHelperRecursive:(BOOL)recursive{
    if (![UIHelperSwitch sharedSwitch].isEnabled) {
        return;
    }
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

//取出一个颜色的十六进制表示
- (NSString *)hexStrForColor:(UIColor *)color{
    CGColorSpaceModel colorSpaceModel = CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor));
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    float r = components[0];
    float g = components[1];
    if (colorSpaceModel == kCGColorSpaceModelMonochrome){
        g = components[0];
    }
    float b = components[2];
    if (colorSpaceModel == kCGColorSpaceModelMonochrome){
        b = components[0];
    }
    
    NSInteger red = r * 255;
    NSInteger green = g * 255;
    NSInteger blue = b * 255;
    NSString *hexStr = [NSString stringWithFormat:@"#%@%@%@",[self toHex:red],[self toHex:green],[self toHex:blue]];
    
    return hexStr;
}

//透明度
- (NSString *)alphaStrForColor:(UIColor *)color{
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    float alpha = components[CGColorGetNumberOfComponents(color.CGColor) - 1];
    
    return [NSString stringWithFormat:@"%.2f",alpha];
}

//把10进制转换为16进制
- (NSString *)toHex:(uint16_t)tmpid{
    NSString *nLetterValue;
    NSString *str = @"";
    uint16_t ttmpig;
    for (int i = 0; i < 9; i++) {
        ttmpig = tmpid%16;
        tmpid = tmpid/16;
        switch (ttmpig)
        {
            case 0:
                nLetterValue = @"00";break;
            case 10:
                nLetterValue = @"A";break;
            case 11:
                nLetterValue = @"B";break;
            case 12:
                nLetterValue = @"C";break;
            case 13:
                nLetterValue = @"D";break;
            case 14:
                nLetterValue = @"E";break;
            case 15:
                nLetterValue = @"F";break;
            default:
                
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
    }
    return str;
}

//  十六进制颜色转换为UIColor
- (UIColor *)colorWithHexString:(NSString *)hexString{
    
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    //  string should be 6 or 8 characters
    if ([colorString length] < 6) {
        return [UIColor clearColor];
    }
    
    //  strip 0X if it appears
    if ([colorString hasPrefix:@"0X"]) {
        colorString = [colorString substringFromIndex:2];
    }
    
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    
    if ([colorString length] != 6) {
        return [UIColor clearColor];
    }
    
    //  separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //  r
    NSString *rString = [colorString substringWithRange:range];
    
    //  g
    range.location = 2;
    NSString *gString = [colorString substringWithRange:range];
    
    //  b
    range.location = 4;
    NSString *bString = [colorString substringWithRange:range];
    
    //  scan value
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float)r/255.0f) green:((float)g/255.0f) blue:((float)b/255.0f) alpha:1.0f];
}

@end
