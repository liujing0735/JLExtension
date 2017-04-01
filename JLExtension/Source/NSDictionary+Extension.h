//
//  NSDictionary+Extension.h
//  SmartApartment
//
//  Created by 刘靖 on 2017/2/27.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

/**
 从字典中取出一个字典

 @param key 关键字
 @return 关键字存在时返回实际的值，不存在时返回@{}
 */
- (NSDictionary *)dictionaryForKey:(NSString *)key;

/**
 从字典中取出一个数组

 @param key 关键字
 @return 关键字存在时返回实际的值，不存在时返回@[]
 */
- (NSArray *)arrayForKey:(NSString *)key;

/**
 从字典中取出一个字符串
 
 @param key 关键字
 @return 关键字存在时返回实际的值，不存在时返回@""
 */
- (NSString *)stringForKey:(NSString *)key;

/**
 从字典中取出一个布尔值
 
 @param key 关键字
 @return 关键字存在时，如果实际的值是为0或@"0"返回NO，其他值返回YES，不存在时直接返回NO
 */
- (BOOL)boolForKey:(NSString *)key;

/**
 从字典中取出一个整型数字
 
 @param key 关键字
 @return 关键字存在时返回实际的值，不存在时返回0
 */
- (NSInteger)intForKey:(NSString *)key;

/**
 从字典中取出一个双精度型数字
 
 @param key 关键字
 @return 关键字存在时返回实际的值，不存在时返回0.00
 */
- (double)doubleForKey:(NSString *)key;

- (NSString *)RMBForKey:(NSString *)key;
- (NSString *)RMBCodeForKey:(NSString *)key;
- (NSString *)dateForKey:(NSString *)key;

- (void)createPropertyCode;

@end
