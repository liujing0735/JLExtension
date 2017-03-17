//
//  NSData+Extension.h
//  TrudianTools
//
//  Created by 刘靖 on 2017/3/14.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import <Foundation/Foundation.h>

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
 AES256加密算法

 @param key 加密key
 @return 加密后的数据
 */
- (NSData *)aes256EncryptWithKey:(NSString *)key;

/**
 AES256e解密算法
 
 @param key 加密key
 @return 解密后的数据
 */
- (NSData *)aes256DecryptWithKey:(NSString *)key;
@end
