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

- (UIImage *)clipImageInRect:(CGRect)rect {
    CGSize size = self.size;
    CGRect frame = rect;
    if (rect.origin.y >= size.height) {
        return self;
    }
    if (rect.origin.x >= size.width) {
        return self;
    }
    
    if (rect.origin.y + rect.size.height > size.height) {
        frame.size.height = size.height - rect.origin.y;
    }
    if (rect.origin.x + rect.size.width > size.width) {
        frame.size.width = size.width - rect.origin.x;
    }
    
    CGImageRef imageRef = self.CGImage;
    CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, frame);
    //UIImage *imageRect = [[UIImage alloc] initWithCGImage:imageRefRect];
    UIImage *imageRect = [UIImage imageWithCGImage:imageRefRect scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return imageRect;
}

@end
