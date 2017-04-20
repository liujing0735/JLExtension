//
//  CBPeripheral+Extension.m
//  TrudianTools
//
//  Created by 刘靖 on 2017/3/14.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import "CBPeripheral+Extension.h"
#import <objc/runtime.h>

@implementation CBPeripheral (Extension)

static char currentRSSIKey = 'a';
static char readCharacteristicKey = 'b';
static char writeCharacteristicKey = 'c';
static char macAddressKey = 'd';
static char writeDataKey = 'e';

- (BOOL)isConnect {
    if (self.state == CBPeripheralStateConnected) {
        return YES;
    }
    return NO;
}

- (BOOL)isReadwrite {
    if (self.readCharacteristic && self.writeCharacteristic) {
        return YES;
    }
    return NO;
}

- (void)setCurrentRSSI:(NSNumber *)currentRSSI {
    objc_setAssociatedObject(self, &currentRSSIKey, currentRSSI, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSNumber *)currentRSSI {
    return objc_getAssociatedObject(self, &currentRSSIKey);
}

- (void)setReadCharacteristic:(CBCharacteristic *)readCharacteristic {
    objc_setAssociatedObject(self, &readCharacteristicKey, readCharacteristic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CBCharacteristic *)readCharacteristic {
    return objc_getAssociatedObject(self, &readCharacteristicKey);
}

- (void)setWriteCharacteristic:(CBCharacteristic *)writeCharacteristic {
    objc_setAssociatedObject(self, &writeCharacteristicKey, writeCharacteristic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CBCharacteristic *)writeCharacteristic {
    return objc_getAssociatedObject(self, &writeCharacteristicKey);
}

- (void)setMacAddress:(NSString *)macAddress {
    objc_setAssociatedObject(self, &macAddressKey, macAddress, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)macAddress {
    return objc_getAssociatedObject(self, &macAddressKey);
}

- (void)setWriteData:(NSData *)writeData {
    objc_setAssociatedObject(self, &writeDataKey, writeData, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSData *)writeData {
    return objc_getAssociatedObject(self, &writeDataKey);
}

// OBJC_ASSOCIATION_ASSIGN
// @property (assign) or @property (unsafe_unretained)
// 弱引用关联对象

// OBJC_ASSOCIATION_RETAIN_NONATOMIC
// @property (strong, nonatomic)
// 强引用关联对象，且为非原子操作

// OBJC_ASSOCIATION_COPY_NONATOMIC
// @property (copy, nonatomic)
// 复制关联对象，且为非原子操作

// OBJC_ASSOCIATION_RETAIN
// @property (strong, atomic)
// 强引用关联对象，且为原子操作

// OBJC_ASSOCIATION_COPY
// @property (copy, atomic)
// 复制关联对象，且为原子操作

@end
