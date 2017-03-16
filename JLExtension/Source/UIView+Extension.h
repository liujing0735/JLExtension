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

- (void)cornerRadius;
- (void)cornerRadius:(CGFloat)radius;
- (void)cornerRadius:(CGFloat)radius color:(UIColor *)color;
- (void)cornerRadius:(CGFloat)radius color:(UIColor *)color width:(CGFloat)width;

- (void)xibAutoLayout;
@end
