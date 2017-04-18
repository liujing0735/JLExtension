//
//  UITextField+Extension.m
//  JLExtension
//
//  Created by 刘靖 on 2017/4/18.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

- (void)setPlaceholderTextColor:(UIColor *)color {
    if (color) {
        [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    }else {
        [self setValue:[UIColor clearColor] forKeyPath:@"_placeholderLabel.textColor"];
    }
}

- (void)setPlaceholderFont:(UIFont *)font {
    if (font) {
        [self setValue:font forKeyPath:@"_placeholderLabel.font"];
    }else {
        [self setValue:[UIFont systemFontOfSize:17.0] forKeyPath:@"_placeholderLabel.font"];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
