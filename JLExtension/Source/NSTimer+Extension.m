//
//  NSTimer+Extension.m
//  SmartApartment
//
//  Created by 刘靖 on 2017/4/13.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import "NSTimer+Extension.h"

@implementation NSTimer (Extension)

- (void)start {
    if (![self isValid]) {
        [self fire];
    }else {
        [self setFireDate:[NSDate distantPast]];
    }
}

- (void)pause {
    [self setFireDate:[NSDate distantFuture]];
}

- (void)stop {
    if ([self isValid]) {
        [self invalidate];
    }
}

@end
