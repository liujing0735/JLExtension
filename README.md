# JLExtension

## 如何安装

### 1 手动安装 

step1:将项目JLExtension/Source 文件夹中的文件直接拖入你的项目中即可

step2:导入.h文件

#import "JLExtension.h"

### 2 CocoaPods 

step1: add the following line to your Podfile:

pod 'JLExtension','~> 0.1.6'

step2: 导入.h文件

#import <JLExtension/JLExtension.h>

## 使用示例
### 为视图添加个别方向的圆角
```
    // 在UILabel左上角画圆
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.backgroundColor = [UIColor blueColor];
    [label cornerRadiusAtTopLeft];
    [self.view addSubview:label];
    
    // 在UILabel右上角画圆
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 220, 100, 100)];
    button.backgroundColor = [UIColor blueColor];
    [button cornerRadiusAtTopRight];
    [self.view addSubview:button];
```
### 获取设备信息
```
    // 获取设备信息
    NSLog(@"用户自定义的名称: %@", [JLDeviceInfo deviceName]);
    NSLog(@"设备类型: %@", [JLDeviceInfo deviceModel]);
    NSLog(@"系统名称: %@", [JLDeviceInfo deviceSystemName]);
    NSLog(@"系统的版本号: %@", [JLDeviceInfo deviceSystemVersion]);
    NSLog(@"系统信息: %@", [JLDeviceInfo deviceSystemInfo]);
    NSLog(@"设备电池状态：%@",[JLDeviceInfo deviceBatteryState]);
    NSLog(@"设备电池电量: %f", [JLDeviceInfo deviceBatteryLevel]);
    NSLog(@"设备的详细类型: %@", [JLDeviceInfo deviceType]);
    NSLog(@"设备的CPU参数: %@", [JLDeviceInfo deviceCPUParam]);
    
    NSLog(@"当前设备总内存: %@", [JLDeviceInfo totalMemoryString]);
    NSLog(@"当前设备可用内存: %@", [JLDeviceInfo availableMemoryString]);
    
    NSLog(@"当前设备总的磁盘容量: %@", [JLDeviceInfo totalDiskString]);
    NSLog(@"当前设备可用的磁盘容量: %@", [JLDeviceInfo availableDiskString]);
    
    NSLog(@"当前设备的网络类型: %@", [JLDeviceInfo netWorkType]);
    
    // 显示HUD
    [self.view showHUD];
    [JLDeviceInfo IPAdressForNetwork:^(NSString *ipAdress, NSString *cityName, NSString *cityCode) {
        // 更新HUD提示文字
        [self.view updateHUDWithText:@"成功获取公网IP"];
        
        NSLog(@"当前设备的公网IP地址(外网IP/公网IP): %@", ipAdress);
        NSLog(@"当前设备的公网IP地址所属城市名称: %@", cityName);
        NSLog(@"当前设备的公网IP地址所属城市编码: %@", cityCode);
    }];
    NSLog(@"当前设备的WWAN的IP地址(无线广域网IP): %@", [JLDeviceInfo IPAdressForWWAN]);
    NSLog(@"当前设备的WiFi的IP地址(无线局域网IP): %@", [JLDeviceInfo IPAdressForWiFi]);
```
## 代码说明

### NSDictionary
```
@interface NSDictionary (Extension)

/**
 从字典中取出一个字典

 @param key 关键字
 @return 关键字存在时返回实际的值，不存在时返回@{}
 */
- (NSDictionary *)dictionaryForKey:(NSString *)key;

/**
 从字典中取出一个数组

 @param key 关键字
 @return 关键字存在时返回实际的值，不存在时返回@[]
 */
- (NSArray *)arrayForKey:(NSString *)key;

/**
 从字典中取出一个字符串
 
 @param key 关键字
 @return 关键字存在时返回实际的值，不存在时返回@""
 */
- (NSString *)stringForKey:(NSString *)key;

/**
 从字典中取出一个布尔值
 
 @param key 关键字
 @return 关键字存在时，如果实际的值是为0或@"0"返回NO，其他值返回YES，不存在时直接返回NO
 */
- (BOOL)boolForKey:(NSString *)key;

/**
 从字典中取出一个整型数字
 
 @param key 关键字
 @return 关键字存在时返回实际的值，不存在时返回0
 */
- (NSInteger)intForKey:(NSString *)key;

/**
 从字典中取出一个双精度型数字
 
 @param key 关键字
 @return 关键字存在时返回实际的值，不存在时返回0.00
 */
- (double)doubleForKey:(NSString *)key;

@end
```

### NSArray
```
@interface NSArray (Extension)

/**
 从数组中取出一个整数型数字
 
 @param index 序列号
 @return 序列号在数组范围时返回实际的值，不存在时返回0
 */
- (NSInteger)intAtIndex:(NSUInteger)index;

/**
 从数组中取出一个双精度型数字
 
 @param index 序列号
 @return 序列号在数组范围时返回实际的值，不存在时返回0.00
 */
- (double)doubleAtIndex:(NSUInteger)index;

/**
 从数组中取出一个字典
 
 @param index 序列号
 @return 序列号在数组范围时返回实际的值，不存在时返回@{}
 */
- (NSDictionary *)dictionaryAtIndex:(NSUInteger)index;

/**
 从数组中取出一个数组
 
 @param index 序列号
 @return 序列号在数组范围时返回实际的值，不存在时返回@[]
 */
- (NSDictionary *)arrayAtIndex:(NSUInteger)index;

/**
 从数组中取出一个字符串
 
 @param index 序列号
 @return 序列号在数组范围时返回实际的值，不存在时返回@""
 */
- (NSString *)stringAtIndex:(NSUInteger)index;

- (NSString *)RMBAtIndex:(NSUInteger)index;
@end
```

### NSString
```
@interface NSString (Extension)

/**
 MD5加密

 @return MD5加密值
 */
- (NSString *)md5Encrypt;

/**
 DES字符串加密

 @param key 密钥 64位
 @return 字符串密文
 */
- (NSString *)desEncryptWithKey:(NSString *)key;

/**
 DES字符串解密

 @param key 密钥 64位
 @return 字符串明文
 */
- (NSString *)desDecryptWithKey:(NSString*)key;

/**
 AES256字符串加密

 @param key 密钥 64位
 @return 字符串密文
 */
- (NSString *)aes256EncryptWithKey:(NSString *)key;

/**
 AES256字符串解密

 @param key 密钥 64位
 @return 字符串明文
 */
- (NSString *)aes256DecryptWithKey:(NSString *)key;

/**
 Base64的字符串转换为图片

 @return UIImage
 */
- (UIImage *)base64ToUIImage;

/**
 计算字符串字节长度，中文2个字节，英文1个字节

 @return 计算字符串字节长度
 */
- (NSUInteger)textLength;

/**
 将十六进制颜色值转换为UIColor颜色

 @return UIColor
 */
- (UIColor *)hexStringToColor;

/**
 十六进制转十进制

 @return 十进制字符串
 */
- (NSString *)hexToDecimal;

/**
 十进制转十六进制
 
 @return 十六进制字符串
 */
- (NSString *)decimalToHex;

/*
 二进制转十进制
 
 @return 十进制字符串
 */
- (NSString *)binaryToDecimal;

/**
 十进制转二进制
 
 @return 二进制字符串
 */
- (NSString *)decimalToBinary;
@end
```
### UIView
```
@interface UIView (Extension)

/**
 为视图添加圆角
 */
- (void)cornerRadius;

/**
 为视图添加圆角

 @param radius 圆角半径
 */
- (void)cornerRadius:(CGFloat)radius;

/**
 为视图添加圆角

 @param radius 圆角半径
 @param color 圆的颜色
 */
- (void)cornerRadius:(CGFloat)radius color:(UIColor *)color;

/**
 为视图添加圆角

 @param radius 圆角半径
 @param color 圆的颜色
 @param width 圆的线宽
 */
- (void)cornerRadius:(CGFloat)radius color:(UIColor *)color width:(CGFloat)width;

/**
 为视图添加阴影

 @param color 阴影颜色
 */
- (void)shadowColor:(UIColor *)color;

/**
 为视图添加阴影

 @param color 阴影颜色
 @param offset 阴影偏移量
 */
- (void)shadowColor:(UIColor *)color offset:(CGSize)offset;

/**
 为视图添加阴影

 @param color 阴影颜色
 @param opacity 阴影透明度
 @param offset 阴影偏移量
 @param radius 阴影圆角半径
 */
- (void)shadowColor:(UIColor *)color opacity:(float)opacity offset:(CGSize)offset radius:(CGFloat)radius;
@end
```
