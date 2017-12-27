//
//  NSDate+Extension.h
//  JLExtension
//
//  Created by JasonLiu on 2017/6/3.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 当前时间

 @return 时间 YYYY-MM-dd HH:mm:ss
 */
+ (NSString *)currentTime;

/**
 当前时间戳

 @return 时间戳 1514337527
 */
+ (NSString *)currentTimestamp;
@end
