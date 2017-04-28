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
 字符串是否为空

 @return YES为空，NO不为空
 */
- (BOOL)isEmpty;

/**
 字符串是否为网页地址

 @return YES 是，NO 不是
 */
- (BOOL)isUrl;

/**
 字符串是否为图片地址
 
 @return YES 是，NO 不是
 */
- (BOOL)isImageUrl;

/**
 字符串是否为邮箱地址
 
 @return YES 是，NO 不是
 */
- (BOOL)isEmail;

/**
 字符串是否为手机号
 
 @return YES 是，NO 不是
 */
- (BOOL)isMobilePhone;

/**
 字符串是否为身份证号码
 
 @return YES 是，NO 不是
 */
- (BOOL)isIdCardNumber;

/**
 字符串是否符合密码，长度在6-16之间
 
 @return YES 是，NO 不是
 */
- (BOOL)isPassword;

/**
 字符串是否符合强密码，包含大小写字母和数字的组合，不能使用特殊字符，长度在6-16之间
 
 @return YES 是，NO 不是
 */
- (BOOL)isStrongPassword;

/**
 字符串的密码强度，取值范围：-1、0、1、2、3、4，为-1时表示不符合密码

 @return 密码强度0~4
 */
- (NSInteger)passwordStrength;

/**
 字符串是否为纯数字
 
 @return YES 是，NO 不是
 */
- (BOOL)isNumber;

/**
 字符串是否为指定长度的纯数字
 
 @return YES 是，NO 不是
 */
- (BOOL)isNumberWithLength:(NSUInteger)length;

/**
 字符串是否满足正则表达式
 
 @return YES 是，NO 不是
 */
- (BOOL)regularExpression:(NSString *)pattern;

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

/**
 十六进制转十进制

 @return 十进制字符串
 */
- (NSString *)hexToDecimal;

/**
 十进制转十六进制
 
 @return 十六进制字符串
 */
- (NSString *)decimalToHex;

/*
 二进制转十进制
 
 @return 十进制字符串
 */
- (NSString *)binaryToDecimal;

/**
 十进制转二进制
 
 @return 二进制字符串
 */
- (NSString *)decimalToBinary;
@end
