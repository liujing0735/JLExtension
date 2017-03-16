//
//  UILabel+Extension.m
//  SmartApartment
//
//  Created by 刘靖 on 2017/3/13.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (CGFloat)heightForOffset {
    CGFloat height = self.frame.size.height;
    UIFont *font = self.font;
    NSString *text = self.text;
    return [self heightForAdaptWithText:text font:font] - height;
}

- (CGFloat)heightForOffsetWithText:(NSString *)text {
    CGFloat height = self.frame.size.height;
    UIFont *font = self.font;
    return [self heightForAdaptWithText:text font:font] - height;
}

- (CGFloat)heightForOffsetWithText:(NSString *)text font:(UIFont *)font {
    CGFloat height = self.frame.size.height;
    return [self heightForAdaptWithText:text font:font] - height;
}

- (CGFloat)heightForAdapt {
    UIFont *font = self.font;
    NSString *text = self.text;
    return [self heightForAdaptWithText:text font:font];
}

- (CGFloat)heightForAdaptWithText:(NSString *)text {
    UIFont *font = self.font;
    return [self heightForAdaptWithText:text font:font];
}

- (CGFloat)heightForAdaptWithText:(NSString *)text font:(UIFont *)font {
    CGFloat width = self.frame.size.width;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = text;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    
    CGRect frame = self.frame;
    frame.size.height = label.frame.size.height;
    self.frame = frame;
    self.numberOfLines = 0;
    
    CGFloat height = label.frame.size.height;
    return height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
