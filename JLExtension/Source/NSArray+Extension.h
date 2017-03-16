//
//  NSArray+Extension.h
//  SmartApartment
//
//  Created by 刘靖 on 2017/2/27.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extension)

- (double)doubleAtIndex:(NSUInteger)index;

- (NSDictionary *)dictionaryAtIndex:(NSUInteger)index;

- (NSString *)stringAtIndex:(NSUInteger)index;

- (NSString *)RMBAtIndex:(NSUInteger)index;
@end
