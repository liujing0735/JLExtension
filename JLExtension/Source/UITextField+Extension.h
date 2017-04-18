//
//  UITextField+Extension.h
//  JLExtension
//
//  Created by 刘靖 on 2017/4/18.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

/**
 设置提示文字的颜色

 @param color UIColor 颜色
 */
- (void)setPlaceholderTextColor:(UIColor *)color;

/**
 设置提示文字的大小

 @param font UIFont 大小
 */
- (void)setPlaceholderFont:(UIFont *)font;
@end
