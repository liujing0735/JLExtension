//
//  NSString+Extension.h
//  JLExtension
//
//  Created by 刘靖 on 2017/3/31.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 MD5加密

 @return MD5加密值
 */
- (NSString *)md5Encrypt;

/**
 DES字符串加密

 @param key 密钥 64位
 @return 字符串密文
 */
- (NSString *)desEncryptWithKey:(NSString *)key;

/**
 DES字符串解密

 @param key 密钥 64位
 @return 字符串明文
 */
- (NSString *)desDecryptWithKey:(NSString*)key;

/**
 AES256字符串加密

 @param key 密钥 64位
 @return 字符串密文
 */
- (NSString *)aes256EncryptWithKey:(NSString *)key;

/**
 AES256字符串解密

 @param key 密钥 64位
 @return 字符串明文
 */
- (NSString *)aes256DecryptWithKey:(NSString *)key;

/**
 Base64的字符串转换为图片

 @return UIImage
 */
- (UIImage *)base64ToUIImage;

/**
 计算字符串字节长度，中文2个字节，英文1个字节

 @return 计算字符串字节长度
 */
- (NSUInteger)textLength;

/**
 将十六进制颜色值转换为UIColor颜色

 @return UIColor
 */
- (UIColor *)hexStringToColor;
@end
