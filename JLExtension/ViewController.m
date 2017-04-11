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
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.backgroundColor = [UIColor blueColor];
    [label cornerRadiusAtTopLeft];
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 220, 100, 100)];
    button.backgroundColor = [UIColor blueColor];
    [button cornerRadiusAtTopRight];
    [self.view addSubview:button];
    
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
    
    [JLDeviceInfo IPAdressForNetwork:^(NSString *ipAdress, NSString *cityName, NSString *cityCode) {
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
