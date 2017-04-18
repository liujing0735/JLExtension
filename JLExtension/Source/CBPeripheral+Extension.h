//
//  CBPeripheral+Extension.h
//  TrudianTools
//
//  Created by 刘靖 on 2017/3/14.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import <CoreBluetooth/CoreBluetooth.h>

@interface CBPeripheral (Extension)
@property (readonly, nonatomic) BOOL isConnect;
@property (readonly, nonatomic) BOOL isReadwrite;

@property (strong, nonatomic) NSNumber *currentRSSI;

@property (strong, nonatomic) CBCharacteristic *readCharacteristic;
@property (strong, nonatomic) CBCharacteristic *writeCharacteristic;
@property (strong, nonatomic) NSString *macAddress;

@property (strong, nonatomic) NSData *writeData;
@end
