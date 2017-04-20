//
//  JLExtension.h
//  SmartApartment
//
//  Created by 刘靖 on 2017/2/27.
//  Copyright © 2017年 Trudian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLDeviceInfo.h"

#import "UIView+Extension.h"
#import "NSDictionary+Extension.h"
#import "NSString+Extension.h"
#import "NSData+Extension.h"
#import "NSArray+Extension.h"
#import "UIColor+Extension.h"
#import "UILabel+Extension.h"
#import "CBPeripheral+Extension.h"
#import "NSTimer+Extension.h"

#define RGB(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define RGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#ifdef DEBUG
#define NSLog(...) NSLog(@"\n 在文件(%@)第(%d)行\n %@\n",[[NSString stringWithFormat:@"%s",__FILE__] componentsSeparatedByString:@"/"].lastObject,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

#ifndef JLExtension_h
#define JLExtension_h


#endif /* JLExtension_h */
