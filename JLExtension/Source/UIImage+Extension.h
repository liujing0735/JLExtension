//
//  UIImage+Extension.h
//  JLExtension
//
//  Created by 刘靖 on 2017/3/17.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIImage (Extension)

/**
 将图片转换为Base64的字符串
 
 @return Base64的字符串
 */
- (NSString *)imageToBase64;

/**
 将图片等比缩放

 @param scaleSize 缩放比例
 @return 等比缩放后的图片
 */
- (UIImage *)scaleImage:(float)scaleSize;

/**
 截取图片的一部分

 @param rect 要截取的区域
 @return 截取到的新图片
 */
- (UIImage *)clipImageInRect:(CGRect)rect;
@end
