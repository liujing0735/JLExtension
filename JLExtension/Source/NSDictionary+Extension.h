//
//  NSDictionary+Extension.h
//  SmartApartment
//
//  Created by 刘靖 on 2017/2/27.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

- (NSDictionary *)dictionaryForKey:(NSString *)key;

- (NSArray *)arrayForKey:(NSString *)key;

- (NSString *)stringForKey:(NSString *)key;

- (BOOL)boolForKey:(NSString *)key;

- (NSInteger)intForKey:(NSString *)key;

- (double)doubleForKey:(NSString *)key;

- (NSString *)RMBForKey:(NSString *)key;
- (NSString *)RMBCodeForKey:(NSString *)key;
- (NSString *)dateForKey:(NSString *)key;

- (void)createPropertyCode;

@end
