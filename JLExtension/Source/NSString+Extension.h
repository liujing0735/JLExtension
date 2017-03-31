//
//  NSString+Extension.h
//  JLExtension
//
//  Created by 刘靖 on 2017/3/31.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 计算字符串字节长度，中文2个字节，英文1个字节

 @return 计算字符串字节长度
 */
- (NSUInteger)textLength;

/**
 将十六进制颜色值转换为UIColor颜色

 @return UIColor
 */
- (UIColor *)hexStringToColor;
@end
