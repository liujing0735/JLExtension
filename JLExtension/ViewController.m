//
//  ViewController.m
//  JLExtension
//
//  Created by 刘靖 on 2017/3/16.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import "ViewController.h"
#import "JLExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"当前时间 %@",[NSDate currentTime]);
    NSLog(@"当前时间戳 %@",[NSDate currentTimestamp]);
    NSLog(@"时间戳转标准时间 %@",[[NSDate currentTimestamp] timestampToStandardtime]);
    NSLog(@"时间戳转标准时间数组 %@",[[NSDate currentTimestamp] timestampToStandardtimes]);
    
    // Do any additional setup after loading the view, typically from a nib.
    NSString *cipherData = @"测试有很多中文和英文混在一起的时候的AES加密和解密的效果。！@";
    NSString *enc = [cipherData aes256EncryptWithKey:@"GbY5hpr0RNP3eL5D"];
    NSLog(@"AES256加密： %@",enc);
    NSString *dec =  [enc aes256DecryptWithKey:@"GbY5hpr0RNP3eL5D"];
    NSLog(@"AES256解密： %@",dec);
    
    NSString *encryptStr = @"fyZ6ttY0ff9GP+/5p51bmnNZvpF1frhysPg3MuC0g9v2dpjbFJF7U5BswayCPW2oVfk5HnMH4h8zy2kG1JWf/1STQSBfdFTm2a4BV33J26YBPMasGa7oInrcsL5Wff1qVRtD9p1XprZH6Zd4IF/pSMOE+UhMi6IMiuOB3J/HUfMJh2jZtKVJbQPOGyx279rXAGq1hUjWjdSD9w+nKv69xO+TxljX9z+uTqWOMuIKSM7VCJEpCpSDPWHixG2ZojeqvbV0tZHMl9M0ysjphQuX4kx9KXrPuinWpaSvAg1f3/6v4QkkMyRrRok8F/NnAHoYfk4H/l7vS36bgnq4kCkKK1x8e8/xCJ4hrccL1Okv2Mm73PtnmY3XOFLP59WG59lcMRddomO+njH0XAq+KiQEKUjav4xQgP10anOf4Vo8YHHzOCQj5KRZGeZQ9WUqBVjjci7NJAOulnOJWsXVuZI4uC+/79MMXOi058AbMXPMWlJgjPUDX+ry37DsPIdXERvXtmqleXp8cF7qFCMANGhRA02qsUVUSx4e6vkghXbr55nOitZFtCT26rSTVIMAgNvR/ECbWkXTPRHbZNVIoWkcHu8wYvNn1/rjX3g4iH4Px05KakLNrAgulmHqYIusjCz8dsTbFeOWkN7GA1HOrmeatt25P2cVmR8/+DIKRuFIeX4rnQHyEioBYXNyNGjQiG8iM+qvRzxndJkZ9cM7SuaTin7bZJsc9H1+XnImfxQuhrMC8r0oSCwqHTdkhq14sGKvLQcrDvhB0IrRJFzxA2S/uncv8etsNjSjhory+SabhP1INs7IWGDssnkAtlaqzdPdRUNWFiORaWKHCopr2uHptnq6N3I8uAG6CLme4CLZs46/IByWS3wFgEsH6Zjz/6TizsOglQlVW1pRbIeTSihllvS1/VwyXT4Esa9WZROngVFvIUC2QSEtQewMV4OW6KGHQ2ARmKM5m2KNrAhOE6e5NTXrGN+vLOU3k25NPsUwm/cwrAa5QTHCFefaJoGwQB4LUhlnr+Jv2V/PVFxEqTCIc9ENbn+UPWBUcnJ8qaFoDrpOktaJLYViuEY5TyKJjPSyeECp5myrYxiKgt3E25ldwTAc78per6ck5NLvO1o7MDGiXdBrFHDUG3+eJqBMcpVaTHU7kc7QnzzN6ERbvJeS+83xEfqI77vRiaY5OSciJdc=";
    NSString *encRSA = [cipherData rsaEncryptWithPublicKey:@"public_key.der"];
    NSLog(@"RSA加密： %@",encRSA);
    NSString *decRSA =  [encRSA rsaDecryptWithPrivateKey:@"private_key.p12" PWD:nil];
    NSLog(@"RSA解密： %@",decRSA);
    NSString *decRSA2 =  [encryptStr rsaDecryptWithPublicKey:@"public_key.der"];
    NSLog(@"RSA解密： %@",decRSA2);
    
    NSDictionary *dictionary = @{@"NSString":@"string",@"NSArray":@[@"value1",@"value2"],@"NSDate":@"1514337947"};
    NSString *string = [dictionary stringForKey:@"NSString"];
    NSArray *array = [dictionary arrayForKey:@"NSArray"];
    NSString *date = [dictionary dateForKey:@"NSDate"];
    NSArray *dates = [dictionary datesForKey:@"NSDate"];
    NSLog(@"存在的字符串：%@ 存在的数组：%@ 存在时间：%@ 时间数组 %@", string, array, date, dates);
    // 取到不存在的字符
    NSString *stringNot = [dictionary stringForKey:@"NSStringNot"];
    // 取到不存在的数组
    NSArray *arrayNot = [dictionary arrayForKey:@"NSArrayNot"];
    NSLog(@"不存在的字符串：%@ 不存在的数组：%@", stringNot, arrayNot);
    
    // 校验密码强度
    NSArray *pwds = @[@"1234",@"123456",@"QQ1234",@"QQ123456",@"qq1234QQ"];
    for (NSString *pwd in pwds) {
        NSInteger strength = [pwd passwordStrength];
        NSLog(@"密码：%@ 强度：%ld", pwd, (long)strength);
    }
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
