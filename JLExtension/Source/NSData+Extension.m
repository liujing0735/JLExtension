//
//  NSData+Extension.m
//  TrudianTools
//
//  Created by 刘靖 on 2017/3/14.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import "NSData+Extension.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (Extension)

- (NSString *)dataToMACFor2A23 {
    NSString *value = [NSString stringWithFormat:@"%@", self];
    //NSLog(@"length = %lu",(unsigned long)[value length]);
    if ([value length] == 19) {
        NSMutableString *mac = [[NSMutableString alloc] init];
        [mac appendString:[[value substringWithRange:NSMakeRange(16, 2)] uppercaseString]];
        [mac appendString:@":"];
        [mac appendString:[[value substringWithRange:NSMakeRange(14, 2)] uppercaseString]];
        [mac appendString:@":"];
        [mac appendString:[[value substringWithRange:NSMakeRange(12, 2)] uppercaseString]];
        [mac appendString:@":"];
        [mac appendString:[[value substringWithRange:NSMakeRange(5, 2)] uppercaseString]];
        [mac appendString:@":"];
        [mac appendString:[[value substringWithRange:NSMakeRange(3, 2)] uppercaseString]];
        [mac appendString:@":"];
        [mac appendString:[[value substringWithRange:NSMakeRange(1, 2)] uppercaseString]];
        return mac;
    }
    return @"";
}

- (NSString *)dataToString {
    Byte *bytes = (Byte *)[self bytes];
    NSMutableString *string = [[NSMutableString alloc] init];
    for(int i = 0; i< [self length]; i++) {
        if (i == 0) {
            [string appendString:[NSString stringWithFormat:@"%hhu",bytes[i]]];
        }else {
            [string appendString:[NSString stringWithFormat:@",%hhu",bytes[i]]];
        }
    }
    return string;
}

- (NSData *)aes256EncryptWithKey:(NSString *)key {
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}

- (NSData *)aes256DecryptWithKey:(NSString *)key {
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}

@end
