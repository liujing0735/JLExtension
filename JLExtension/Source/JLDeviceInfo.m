//
//  JLDeviceInfo.m
//  JLExtension
//
//  Created by 刘靖 on 2017/4/10.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import "JLDeviceInfo.h"
#import <sys/utsname.h>
#import <sys/sysctl.h>
#import <sys/mount.h>
#import <mach/machine.h>
#import <mach/mach.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

#import <AFNetworking/AFNetworking.h>
#import "NSDictionary+Extension.h"

@implementation JLDeviceInfo

+ (NSString *)deviceName {
    return [[UIDevice currentDevice] name];
}

+ (NSString *)deviceModel {
    return [[UIDevice currentDevice] model];
}

+ (NSString *)deviceSystemName {
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)deviceSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)deviceSystemInfo {
    return [NSString stringWithFormat:@"%@ %@", [self deviceSystemName], [self deviceSystemVersion]];
}

+ (NSString *)deviceBatteryState {
    if (![UIDevice currentDevice].batteryMonitoringEnabled) {
        [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    }
    
    switch ([[UIDevice currentDevice] batteryState]) {
        case UIDeviceBatteryStateUnknown:
            return @"未知";
        case UIDeviceBatteryStateUnplugged:
            return @"放电";
        case UIDeviceBatteryStateCharging:
            return @"充电中";
        case UIDeviceBatteryStateFull:
            return @"已充满";
        default:
            break;
    }
}

+ (float)deviceBatteryLevel {
    if (![UIDevice currentDevice].batteryMonitoringEnabled) {
        [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    }
    return [[UIDevice currentDevice] batteryLevel];
}

+ (NSString *)deviceType {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
    if ([deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
    if ([deviceModel isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
    if ([deviceModel isEqualToString:@"iPhone10,3"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhone X";
    if ([deviceModel isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    if ([deviceModel isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([deviceModel isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([deviceModel isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max";
    
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod touch";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod touch (2nd generation)";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod touch (3rd generation)";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod touch (4th generation)";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod touch (5th generation)";
    if ([deviceModel isEqualToString:@"iPod7,1"])      return @"iPod touch (6th generation)";
    if ([deviceModel isEqualToString:@"iPod9,1"])      return @"iPod touch (7th generation)";
    
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceModel isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceModel isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceModel isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceModel isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    if ([deviceModel isEqualToString:@"iPad6,11"])     return @"iPad (5th generation)";
    if ([deviceModel isEqualToString:@"iPad6,12"])     return @"iPad (5th generation)";
    if ([deviceModel isEqualToString:@"iPad7,1"])      return @"iPad Pro (12.9-inch) (2nd generation)";
    if ([deviceModel isEqualToString:@"iPad7,2"])      return @"iPad Pro (12.9-inch) (2nd generation)";
    if ([deviceModel isEqualToString:@"iPad7,3"])      return @"iPad Pro (10.5-inch)";
    if ([deviceModel isEqualToString:@"iPad7,4"])      return @"iPad Pro (10.5-inch)";
    if ([deviceModel isEqualToString:@"iPad7,5"])      return @"iPad (6th generation)";
    if ([deviceModel isEqualToString:@"iPad7,6"])      return @"iPad (6th generation)";
    if ([deviceModel isEqualToString:@"iPad8,1"])      return @"iPad Pro (11-inch)";
    if ([deviceModel isEqualToString:@"iPad8,2"])      return @"iPad Pro (11-inch)";
    if ([deviceModel isEqualToString:@"iPad8,3"])      return @"iPad Pro (11-inch)";
    if ([deviceModel isEqualToString:@"iPad8,4"])      return @"iPad Pro (11-inch)";
    if ([deviceModel isEqualToString:@"iPad8,5"])      return @"iPad Pro (12.9-inch) (3rd generation)";
    if ([deviceModel isEqualToString:@"iPad8,6"])      return @"iPad Pro (12.9-inch) (3rd generation)";
    if ([deviceModel isEqualToString:@"iPad8,7"])      return @"iPad Pro (12.9-inch) (3rd generation)";
    if ([deviceModel isEqualToString:@"iPad8,8"])      return @"iPad Pro (12.9-inch) (3rd generation)";
    if ([deviceModel isEqualToString:@"iPad11,1"])     return @"iPad mini (5th generation)";
    if ([deviceModel isEqualToString:@"iPad11,2"])     return @"iPad mini (5th generation)";
    if ([deviceModel isEqualToString:@"iPad11,3"])     return @"iPad Air (3rd generation)";
    if ([deviceModel isEqualToString:@"iPad11,4"])     return @"iPad Air (3rd generation)";
    
    if ([deviceModel isEqualToString:@"AppleTV2,1"])   return @"Apple TV 2";
    if ([deviceModel isEqualToString:@"AppleTV3,1"])   return @"Apple TV 3";
    if ([deviceModel isEqualToString:@"AppleTV3,2"])   return @"Apple TV 3";
    if ([deviceModel isEqualToString:@"AppleTV5,3"])   return @"Apple TV 4";
    if ([deviceModel isEqualToString:@"AppleTV6,2"])   return @"Apple TV 4K";
    
    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    
    return deviceModel;
}

+ (NSString *)deviceCPUParam {
    NSMutableString *cpu = [[NSMutableString alloc] init];
    size_t size;
    cpu_type_t type;
    cpu_subtype_t subtype;
    size = sizeof(type);
    sysctlbyname("hw.cputype", &type, &size, NULL, 0);
    
    size = sizeof(subtype);
    sysctlbyname("hw.cpusubtype", &subtype, &size, NULL, 0);
    
    // values for cputype and cpusubtype defined in mach/machine.h
    if (type == CPU_TYPE_X86) {
        [cpu appendString:@"x86 "];
        // check for subtype ...
        
    }else if (type == CPU_TYPE_ARM) {
        [cpu appendString:@"ARM"];
        [cpu appendFormat:@",Type:%d",subtype];
    }
    return cpu;
}

+ (long long)totalMemory {
    return [NSProcessInfo processInfo].physicalMemory;
}

+ (long long)availableMemory {
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS) {
        return NSNotFound;
    }
    
    return ((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count));
}

+ (NSString *)totalMemoryString {
    return [self diskToString:[self totalMemory]];
}

+ (NSString *)availableMemoryString {
    return [self diskToString:[self availableMemory]];
}

+ (long long)totalDisk {
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_blocks);
    }
    return freeSpace;
}

+ (long long)availableDisk {
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    return freeSpace;
}

+ (NSString *)totalDiskString {
    return [self diskToString:[self totalDisk]];
}

+ (NSString *)availableDiskString {
    return [self diskToString:[self availableDisk]];
}

+ (NSString *)diskToString:(unsigned long long)freeSpace {
    NSInteger KB = 1024;
    NSInteger MB = KB*KB;
    NSInteger GB = MB*KB;
    
    if (freeSpace < 10) {
        return @"0 B";
    }else if (freeSpace < KB) {
        return @"< 1 KB";
    }else if (freeSpace < MB) {
        return [NSString stringWithFormat:@"%.1f KB",((CGFloat)freeSpace)/KB];
    }else if (freeSpace < GB) {
        return [NSString stringWithFormat:@"%.1f MB",((CGFloat)freeSpace)/MB];
    }else {
        return [NSString stringWithFormat:@"%.1f GB",((CGFloat)freeSpace)/GB];
    }
}

+ (NSString *)netWorkType {
    NSString *strNetworkType = @"";
    //创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    struct sockaddr_storage zeroAddress;
    
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.ss_len = sizeof(zeroAddress);
    zeroAddress.ss_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    // 获得连接的标志
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    // 如果不能获取连接标志，则不能连接网络，直接返回
    if (!didRetrieveFlags) {
        return strNetworkType;
    }
    
    // 没有网络
    if ((flags & kSCNetworkReachabilityFlagsReachable) == 0) {
        return @"";
    }
    
    if ((flags &kSCNetworkReachabilityFlagsConnectionRequired) ==0) {
        // if target host is reachable and no connection is required
        // then we'll assume (for now) that your on Wi-Fi
        strNetworkType = @"WiFi";
    }
    
    if (((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) !=0) ||
        (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) !=0
        ) {
        // ... and the connection is on-demand (or on-traffic) if the
        // calling application is using the CFSocketStream or higher APIs
        if ((flags &kSCNetworkReachabilityFlagsInterventionRequired) == 0) {
            // ... and no [user] intervention is needed
            strNetworkType = @"WiFi";
        }
    }
    
    if ((flags &kSCNetworkReachabilityFlagsIsWWAN) ==kSCNetworkReachabilityFlagsIsWWAN) {
        if ([[[UIDevice currentDevice]systemVersion]floatValue] >=7.0) {
            CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc]init];
            NSString *currentRadioAccessTechnology = info.currentRadioAccessTechnology;
            
            if (currentRadioAccessTechnology) {
                if ([currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyLTE]) {
                    strNetworkType =  @"4G";
                } else if ([currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyEdge] || [currentRadioAccessTechnology isEqualToString:CTRadioAccessTechnologyGPRS]) {
                    strNetworkType =  @"2G";
                }
                else {
                    strNetworkType =  @"3G";
                }
            }
        }else {
            if((flags &kSCNetworkReachabilityFlagsReachable) ==kSCNetworkReachabilityFlagsReachable) {
                if ((flags &kSCNetworkReachabilityFlagsTransientConnection) ==kSCNetworkReachabilityFlagsTransientConnection) {
                    if((flags &kSCNetworkReachabilityFlagsConnectionRequired) ==kSCNetworkReachabilityFlagsConnectionRequired) {
                        strNetworkType = @"2G";
                    }
                    else {
                        strNetworkType = @"3G";
                    }
                }
            }
        }
    }
    
    if ([strNetworkType isEqualToString:@""]) {
        strNetworkType = @"WWAN";
    }
    return strNetworkType;
}

+ (void)IPAdressForNetwork:(void (^)(NSString *ipAdress, NSString *cityName, NSString *cityCode))callback {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSURL *URL = [NSURL URLWithString:@"https://pv.sohu.com/cityjson?ie=utf-8"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            callback(@"未连接",@"未知",@"未知");
        } else {
            NSString *result = [[NSString alloc] initWithData:responseObject  encoding:NSUTF8StringEncoding];
            NSRange range = [result rangeOfString:@"var returnCitySN = "];
            if (range.length != 0) {
                NSString *data = [result substringFromIndex:range.length];
                data = [data stringByReplacingOccurrencesOfString:@";" withString:@""];
                NSData *json = [data dataUsingEncoding:NSUTF8StringEncoding];
                NSError *err;
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&err];
                if (!err) {
                    callback([dic stringForKey:@"cip"],[dic stringForKey:@"cname"],[dic stringForKey:@"cid"]);
                    return ;
                }
            }
            NSLog(@"%@", result);
            callback(@"未连接",@"未知",@"未知");
        }
    }];
    [dataTask resume];
}

+ (NSString *)IPAdressForWWAN {
    NSString *address = @"未连接";
    if (![[[self IPAddresses] stringForKey:@"pdp_ip0/ipv4"] isEqualToString:@""]) {
        address = [[self IPAddresses] stringForKey:@"pdp_ip0/ipv4"];
    }
    return address;
}

+ (NSString *)IPAdressForWiFi {
    NSString *address = @"未连接";
    if (![[[self IPAddresses] stringForKey:@"en0/ipv4"] isEqualToString:@""]) {
        address = [[self IPAddresses] stringForKey:@"en0/ipv4"];
    }
    return address;
}

+ (NSDictionary *)IPAddresses {
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = @"ipv4";
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = @"ipv6";
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : @{};
}

+ (NSString *)currentAppName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)currentAppVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)currentAppBuild {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

@end
