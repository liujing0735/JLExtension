//
//  JLDeviceInfo.h
//  JLExtension
//
//  Created by 刘靖 on 2017/4/10.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface JLDeviceInfo : NSObject

/**
 用户自定义的名称

 @return e.g. "My iPhone"
 */
+ (NSString *)deviceName;

/**
 设备类型

 @return e.g. @"iPhone", @"iPod touch"
 */
+ (NSString *)deviceModel;

/**
 系统名称

 @return e.g. @"iOS"
 */
+ (NSString *)deviceSystemName;

/**
 系统的版本号

 @return e.g. @"10.3"
 */
+ (NSString *)deviceSystemVersion;

/**
 系统信息

 @return e.g. @"iOS 10.3"
 */
+ (NSString *)deviceSystemInfo;

/**
 设备电池状态
 
 @return e.g. @"未知",@"放电",@"充电中",@"已充满"
 */
+ (NSString *)deviceBatteryState;

/**
 设备电池电量

 @return 0 .. 1.0，未知返回 -1.0
 */
+ (float)deviceBatteryLevel;

/**
 设备的详细类型

 @return e.g. @"iPhone 7 Plus"
 */
+ (NSString *)deviceType;

/**
 设备的CPU参数

 @return e.g. @"ARM"
 */
+ (NSString *)deviceCPUParam;

/**
 当前设备总内存，单位B

 @return e.g. @"102400"
 */
+ (long long)totalMemory;

/**
 当前设备可用内存，单位B

 @return e.g. @"1024"
 */
+ (long long)availableMemory;

/**
 当前设备总内存
 
 @return e.g. @"512.0 MB"
 */
+ (NSString *)totalMemoryString;

/**
 当前设备可用内存
 
 @return e.g. @"100.0 MB"
 */
+ (NSString *)availableMemoryString;

/**
 当前设备总的磁盘容量，单位B

 @return e.g. 120108089344
 */
+ (long long)totalDisk;

/**
 当前设备可用的磁盘容量，单位B

 @return e.g. 41418289152
 */
+ (long long)availableDisk;

/**
 当前设备总的磁盘容量

 @return e.g. @"16.0 GB"
 */
+ (NSString *)totalDiskString;

/**
 当前设备可用的磁盘容量

 @return e.g. @"1.5 GB"
 */
+ (NSString *)availableDiskString;

/**
 当前设备的网络类型（2/3/4G、WiFi）

 @return e.g. @"WiFi"
 */
+ (NSString *)netWorkType;

/**
 当前设备的公网IP地址(外网IP/公网IP)

 @param callback e.g. @"183.32.236.126",@"广东省中山市",@"442000"(身份证号码前六位)
 */
+ (void)IPAdressForNetwork:(void (^)(NSString *ipAdress, NSString *cityName, NSString *cityCode))callback;

/**
 当前设备的WWAN的IP地址(无线广域网IP)
 
 @return e.g. @"10.150.147.188"
 */
+ (NSString *)IPAdressForWWAN;

/**
 当前设备的WiFi的IP地址(无线局域网IP)
 
 @return e.g. @"192.169.1.2"
 */
+ (NSString *)IPAdressForWiFi;

/**
 当前APP的名称

 @return e.g. @“JLExtension”
 */
+ (NSString *)currentAppName;

/**
 当前APP的版本号

 @return e.g. @“1.0.0”
 */
+ (NSString *)currentAppVersion;

/**
 当前APP的编译号

 @return e.g. @“1001”
 */
+ (NSString *)currentAppBuild;

@end
