//
//  UIView+Extension.m
//  SmartApartment
//
//  Created by 刘靖 on 2017/2/23.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import "UIView+Extension.h"
#import "JLExtension.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation UIView (Extension)

- (void)showHUD {
    [MBProgressHUD showHUDAddedTo:self animated:YES];
}

- (void)hideHUD {
    [MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)showHUDWithText:(NSString *)text {
    [self showHUDWithText:text delay:2.0];
}

- (void)showHUDWithText:(NSString *)text delay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    if ([text length] > 18) {
        hud.detailsLabel.text = text;
        hud.detailsLabel.adjustsFontSizeToFitWidth = YES;
    }else {
        hud.label.text = text;
        hud.label.adjustsFontSizeToFitWidth = YES;
    }
    hud.mode = MBProgressHUDModeCustomView;
    if (delay > 0.0) {
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:delay];
    }
    NSLog(@"%@", text);
}

- (void)updateHUDWithText:(NSString *)text {
    [self showHUDWithText:text delay:2.0];
}

- (void)updateHUDWithText:(NSString *)text delay:(NSTimeInterval)delay {
    [self showHUDWithText:text delay:delay];
}

- (void)cornerRadiusAtTopLeft {
    [self cornerRadiusAtTopLeftWithRadii:CGSizeMake(10, 10)];
}

- (void)cornerRadiusAtTopRight {
    [self cornerRadiusAtTopRightWithRadii:CGSizeMake(10, 10)];
}

- (void)cornerRadiusAtBottomLeft {
    [self cornerRadiusAtBottomLeftWithRadii:CGSizeMake(10, 10)];
}

- (void)cornerRadiusAtBottomRight {
    [self cornerRadiusAtBottomRightWithRadii:CGSizeMake(10, 10)];
}

- (void)cornerRadiusAtTopLeftWithRadii:(CGSize)size {
    [self cornerRadiusWithCorner:UIRectCornerTopLeft radii:size];
}

- (void)cornerRadiusAtTopRightWithRadii:(CGSize)size {
    [self cornerRadiusWithCorner:UIRectCornerTopRight radii:size];
}

- (void)cornerRadiusAtBottomLeftWithRadii:(CGSize)size {
    [self cornerRadiusWithCorner:UIRectCornerBottomLeft radii:size];
}

- (void)cornerRadiusAtBottomRightWithRadii:(CGSize)size {
    [self cornerRadiusWithCorner:UIRectCornerBottomRight radii:size];
}

- (void)cornerRadiusWithCorner:(UIRectCorner)corner radii:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    // 贝塞尔曲线 给矩形可添加圆角的方法
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:size];
    // 创建shaplayer
    CAShapeLayer * masklayer = [[CAShapeLayer alloc]init];
    masklayer.frame = self.bounds;
    // 设置路径
    masklayer.path = path.CGPath;
    self.layer.mask = masklayer;
}

- (void)cornerRadius {
    [self cornerRadius:7];
}

- (void)cornerRadius:(CGFloat)radius {
    [self cornerRadius:radius color:[UIColor clearColor] width:1.0];
}

- (void)cornerRadius:(CGFloat)radius color:(UIColor *)color {
    [self cornerRadius:radius color:color width:1.0];
}

- (void)cornerRadius:(CGFloat)radius color:(UIColor *)color width:(CGFloat)width {
    if (!self.backgroundColor) {
        self.backgroundColor = [UIColor whiteColor];
    }
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = width;
    self.layer.borderColor = [color CGColor];
}

- (void)autoLayoutWithView:(UIView *)view screenSize:(CGFloat)size {
    CGFloat screenWidth = 0.0;
    CGFloat screenHeight = 0.0;
    
    if (size == 3.5) {
        screenWidth = 320;
        screenHeight = 480;
    }else if (size == 4.0) {
        screenWidth = 320;
        screenHeight = 568;
    }else if (size == 4.7) {
        screenWidth = 375;
        screenHeight = 667;
    }else {
        screenWidth = 414;
        screenHeight = 736;
    }
    
    CGFloat autoSizeScaleX, autoSizeScaleY;
    
    if(SCREEN_HEIGHT == screenHeight){// 4寸屏
        autoSizeScaleX = 1.0;
        autoSizeScaleY = 1.0;
    }else{
        autoSizeScaleX = SCREEN_WIDTH/screenWidth;
        autoSizeScaleY = SCREEN_HEIGHT/screenHeight;
    }
    
    for (UIView *subView in view.subviews) {
        
        if ([subView isKindOfClass:[UINavigationBar class]]) {
            continue;
        }
        
        CGRect rect;
        rect.origin.x = subView.frame.origin.x * autoSizeScaleX;
        rect.origin.y = subView.frame.origin.y * autoSizeScaleY;
        rect.size.width = subView.frame.size.width * autoSizeScaleX;
        rect.size.height = subView.frame.size.height * autoSizeScaleY;
        subView.frame = rect;
        
        if ([subView.subviews count] > 0) {
            [self autoLayoutWithView:subView screenSize:size];
        }
    }
}

- (void)shadowColor:(UIColor *)color {
    [self shadowColor:color opacity:0.7f offset:CGSizeMake(1.0f, 1.0f) radius:2.0f];
}

- (void)shadowColor:(UIColor *)color offset:(CGSize)offset {
    [self shadowColor:color opacity:0.7f offset:offset radius:2.0f];
}

- (void)shadowColor:(UIColor *)color opacity:(float)opacity offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
}

- (void)xibAutoLayout {
    [self autoLayoutWithView:self screenSize:4.0];
}

- (void)xibAutoLayoutWith47 {
    [self autoLayoutWithView:self screenSize:4.7];
}

- (void)xibAutoLayoutWith55 {
    [self autoLayoutWithView:self screenSize:5.5];
}

@end
