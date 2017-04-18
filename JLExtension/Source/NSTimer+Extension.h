//
//  NSTimer+Extension.h
//  SmartApartment
//
//  Created by 刘靖 on 2017/4/13.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Extension)

/**
 启动/继续
 */
- (void)start;

/**
 暂停
 */
- (void)pause;

/**
 停止，invalidate
 */
- (void)stop;

@end
