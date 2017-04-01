//
//  NSArray+Extension.m
//  SmartApartment
//
//  Created by 刘靖 on 2017/2/27.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (NSInteger)intAtIndex:(NSUInteger)index {
    if ([self count] > index) {
        id value = [self objectAtIndex:index];
        if ([value isKindOfClass:[NSString class]]) {
            return [(NSString *)value integerValue];
        }
        if ([value isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)value integerValue];
        }
    }
    return 0;
}

- (double)doubleAtIndex:(NSUInteger)index {
    if ([self count] > index) {
        id value = [self objectAtIndex:index];
        if ([value isKindOfClass:[NSString class]]) {
            return [(NSString *)value doubleValue];
        }
        if ([value isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)value doubleValue];
        }
    }
    return 0.00;
}

- (NSDictionary *)dictionaryAtIndex:(NSUInteger)index {
    if ([self count] > index) {
        id value = [self objectAtIndex:index];
        if ([value isKindOfClass:[NSDictionary class]]) {
            return (NSDictionary *)value;
        }
    }
    return @{};
}

- (NSArray *)arrayAtIndex:(NSUInteger)index {
    if ([self count] > index) {
        id value = [self objectAtIndex:index];
        if ([value isKindOfClass:[NSArray class]]) {
            return (NSArray *)value;
        }
    }
    return @[];
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    if ([self count] > index) {
        id value = [self objectAtIndex:index];
        if ([value isKindOfClass:[NSString class]]) {
            return (NSString *)value;
        }
        if ([value isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)value stringValue];
        }
    }
    return @"";
}

- (NSString *)RMBAtIndex:(NSUInteger)index {
    if ([self count] > index) {
        id value = [self objectAtIndex:index];
        if ([value isKindOfClass:[NSString class]]) {
            NSString *rmb = (NSString *)value;
            if ([rmb hasSuffix:@".00"]) {
                rmb = [rmb stringByReplacingOccurrencesOfString:@".00" withString:@""];
            }
            return [NSString stringWithFormat:@"%@元",rmb];
        }
        if ([value isKindOfClass:[NSNumber class]]) {
            return [NSString stringWithFormat:@"%@元",[(NSNumber *)value stringValue]];
        }
    }
    return @"0元";
}
@end
