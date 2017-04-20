//
//  CBPeripheral+Extension.h
//  TrudianTools
//
//  Created by 刘靖 on 2017/3/14.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import <CoreBluetooth/CoreBluetooth.h>

@interface CBPeripheral (Extension)

/**
 连接状态
 */
@property (readonly, nonatomic) BOOL isConnect;

/**
 读写状态
 */
@property (readonly, nonatomic) BOOL isReadwrite;

/**
 蓝牙信号强度
 */
@property (readwrite, nonatomic) NSNumber *currentRSSI;

/**
 可读的特征
 */
@property (readwrite, nonatomic) CBCharacteristic *readCharacteristic;

/**
 可写的特征
 */
@property (readwrite, nonatomic) CBCharacteristic *writeCharacteristic;

/**
 蓝牙的Mac地址
 */
@property (readwrite, nonatomic) NSString *macAddress;

/**
 待写入数据
 */
@property (readwrite, nonatomic) NSData *writeData;
@end
