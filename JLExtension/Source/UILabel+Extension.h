//
//  UILabel+Extension.h
//  SmartApartment
//
//  Created by 刘靖 on 2017/3/13.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 返回适应后偏移的高度
 
 @return 自动适应后偏移的高度
 */
- (CGFloat)heightForOffset;

/**
 返回适应后偏移的高度
 
 @param text 需要适应的文本内容
 @return 自动适应后偏移的高度
 */
- (CGFloat)heightForOffsetWithText:(NSString *)text;

/**
 返回适应后偏移的高度
 
 @param text 需要适应的文本内容
 @param font 需要适应的字体
 @return 自动适应后偏移的高度
 */
- (CGFloat)heightForOffsetWithText:(NSString *)text font:(UIFont *)font;

/**
 返回适应后的实际高度
 
 @return 自动适应后的实际高度
 */
- (CGFloat)heightForAdapt;

/**
 返回适应后的实际高度
 
 @param text 需要适应的文本内容
 @return 自动适应后的实际高度
 */
- (CGFloat)heightForAdaptWithText:(NSString *)text;

/**
 返回适应后的实际高度
 
 @param text 需要适应的文本内容
 @param font 需要适应的字体
 @return 自动适应后的实际高度
 */
- (CGFloat)heightForAdaptWithText:(NSString *)text font:(UIFont *)font;
@end
