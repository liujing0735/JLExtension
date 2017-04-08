//
//  UIView+Extension.h
//  SmartApartment
//
//  Created by 刘靖 on 2017/2/23.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (Extension)

/**
 为视图添加圆角
 */
- (void)cornerRadius;

/**
 为视图添加圆角

 @param radius 圆角半径
 */
- (void)cornerRadius:(CGFloat)radius;

/**
 为视图添加圆角

 @param radius 圆角半径
 @param color 圆的颜色
 */
- (void)cornerRadius:(CGFloat)radius color:(UIColor *)color;

/**
 为视图添加圆角

 @param radius 圆角半径
 @param color 圆的颜色
 @param width 圆的线宽
 */
- (void)cornerRadius:(CGFloat)radius color:(UIColor *)color width:(CGFloat)width;

/**
 为视图添加阴影

 @param color 阴影颜色
 */
- (void)shadowColor:(UIColor *)color;

/**
 为视图添加阴影

 @param color 阴影颜色
 @param offset 阴影偏移量
 */
- (void)shadowColor:(UIColor *)color offset:(CGSize)offset;

/**
 为视图添加阴影

 @param color 阴影颜色
 @param opacity 阴影透明度
 @param offset 阴影偏移量
 @param radius 阴影圆角半径
 */
- (void)shadowColor:(UIColor *)color opacity:(float)opacity offset:(CGSize)offset radius:(CGFloat)radius;

- (void)xibAutoLayout;
- (void)xibAutoLayoutWith47;
- (void)xibAutoLayoutWith55;
@end
