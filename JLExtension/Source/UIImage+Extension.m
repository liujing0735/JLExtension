//
//  UIImage+Extension.m
//  JLExtension
//
//  Created by 刘靖 on 2017/3/17.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (NSString *)imageToBase64 {
    NSData *imageData = UIImagePNGRepresentation(self);
    return [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

- (UIImage *)scaleImage:(float)scaleSize {
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width * scaleSize, self.size.height * scaleSize));
    [self drawInRect:CGRectMake(0, 0, self.size.width * scaleSize, self.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
