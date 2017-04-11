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
 显示HUD，需要调用hideHUD隐藏
 */
- (void)showHUD;

/**
 隐藏HUD
 */
- (void)hideHUD;

/**
 显示HUD，2.0秒后自动隐藏

 @param text 需要显示的文字
 */
- (void)showHUDWithText:(NSString *)text;

/**
 显示HUD

 @param text 需要显示的文字
 @param delay 自动隐藏的延时时间,必须大于0.0
 */
- (void)showHUDWithText:(NSString *)text delay:(NSTimeInterval)delay;

/**
 更新HUD，2.0秒后自动隐藏

 @param text 需要更新的文字
 */
- (void)updateHUDWithText:(NSString *)text;

/**
 更新HUD

 @param text 需要显示的文字
 @param delay 自动隐藏的延时时间,必须大于0.0
 */
- (void)updateHUDWithText:(NSString *)text delay:(NSTimeInterval)delay;

/**
 在左上角为视图添加圆角
 */
- (void)cornerRadiusAtTopLeft;

/**
 在右上角为视图添加圆角
 */
- (void)cornerRadiusAtTopRight;

/**
 在左下角为视图添加圆角
 */
- (void)cornerRadiusAtBottomLeft;

/**
 在右下角为视图添加圆角
 */
- (void)cornerRadiusAtBottomRight;

/**
 在左上角为视图添加圆角

 @param size 圆角的大小
 */
- (void)cornerRadiusAtTopLeftWithRadii:(CGSize)size;

/**
 在右上角为视图添加圆角

 @param size 圆角的大小
 */
- (void)cornerRadiusAtTopRightWithRadii:(CGSize)size;

/**
 在左下角为视图添加圆角

 @param size 圆角的大小
 */
- (void)cornerRadiusAtBottomLeftWithRadii:(CGSize)size;

/**
 在右下角为视图添加圆角

 @param size 圆角的大小
 */
- (void)cornerRadiusAtBottomRightWithRadii:(CGSize)size;

/**
 为视图添加个别方向的圆角

 @param corner 圆角的位置
 @param size 圆角的大小
 */
- (void)cornerRadiusWithCorner:(UIRectCorner)corner radii:(CGSize)size;

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
