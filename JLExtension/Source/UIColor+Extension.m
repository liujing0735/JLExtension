//
//  UIColor+Extension.m
//  SmartApartment
//
//  Created by 刘靖 on 2017/3/1.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}
@end
