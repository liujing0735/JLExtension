//
//  NSData+Extension.h
//  TrudianTools
//
//  Created by 刘靖 on 2017/3/14.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const kInitVector = @"16-Bytes--String";

@interface NSData (Extension)

/**
 NSData 转 Mac地址
 
 @return NSString类型的Mac地址
 */
- (NSString *)dataToMACFor2A23;

/**
 NSData 转 NSString

 @return NSString类型的字符串
 */
- (NSString *)dataToString;

/**
 AES256 加密算法

 @param key 加密key
 @return 加密密文
 */
- (NSData *)aes256EncryptWithKey:(NSString *)key;

/**
 AES256 解密算法
 
 @param key 加密key
 @return 解密明文
 */
- (NSData *)aes256DecryptWithKey:(NSString *)key;

/**
 RSA 公钥加密
 
 @param der public_key.der
 @return 公钥加密密文
 */
- (NSData *)rsaEncryptWithPublicKey:(NSString *)der;

/**
 RSA 私钥加密
 
 @param p12 private_key.p12
 @return 私钥加密密文
 */
- (NSData *)rsaEncryptWithPrivateKey:(NSString *)p12 PWD:(NSString *)pwd;

/**
 RSA 公钥解密
 
 @param der public_key.der
 @return 公钥解密明文
 */
- (NSData *)rsaDecryptWithPublicKey:(NSString *)der;

/**
 RSA 私钥加密
 
 @param p12 private_key.p12
 @return 私钥解密明文
 */
- (NSData *)rsaDecryptWithPrivateKey:(NSString *)p12 PWD:(NSString *)pwd;
@end
