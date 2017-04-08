//
//  NSString+Extension.m
//  JLExtension
//
//  Created by 刘靖 on 2017/3/31.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import "NSString+Extension.h"
#import "NSData+Extension.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension)

- (NSString *)md5Encrypt {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", result[i]];
    
    return  output;
}

- (NSString *)desEncryptWithKey:(NSString *)key {
    NSString *ciphertext = nil;
    const char *textBytes = [self UTF8String];
    NSUInteger dataLength = [self length];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    Byte iv[] = {1,2,3,4,5,6,7,8};
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          textBytes, dataLength,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        
        ciphertext = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    return ciphertext;
}

- (NSString *)desDecryptWithKey:(NSString*)key {
    NSData* cipherData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    Byte iv[] = {1,2,3,4,5,6,7,8};
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}

- (NSString *)aes256EncryptWithKey:(NSString *)key {
    NSData* cipherData = [self dataUsingEncoding:NSUTF8StringEncoding];
    cipherData = [cipherData aes256EncryptWithKey:key];
    if (cipherData) {
        return [cipherData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    return nil;
}

- (NSString *)aes256DecryptWithKey:(NSString *)key {
    NSData* cipherData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    cipherData = [cipherData aes256DecryptWithKey:key];
    if (cipherData) {
        return [[NSString alloc] initWithData:cipherData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (UIImage *)base64ToUIImage {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self
                                                      options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

- (NSUInteger)textLength {
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < self.length; i++) {
        unichar uc = [self characterAtIndex:i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    return asciiLength;
}

- (UIColor *)hexStringToColor {
    NSString *cString = [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

- (NSString *)hexToDecimal {
    return [NSString stringWithFormat:@"%lu",strtoul([self UTF8String],0,16)];
}

- (NSString *)decimalToHex {
    long long int tmpid = [self intValue];
    NSString *nLetterValue;
    NSString *str = @"";
    long long int ttmpig;
    for (int i = 0; i < 9; i++) {
        ttmpig = tmpid % 16;
        tmpid = tmpid / 16;
        switch (ttmpig) {
            case 10:
                nLetterValue = @"A";
                break;
            case 11:
                nLetterValue = @"B";
                break;
            case 12:
                nLetterValue = @"C";
                break;
            case 13:
                nLetterValue = @"D";
                break;
            case 14:
                nLetterValue = @"E";
                break;
            case 15:
                nLetterValue = @"F";
                break;
            default:
                nLetterValue = [[NSString alloc]initWithFormat:@"%lli", ttmpig];
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
    }
    return str;
}

- (NSString *)binaryToDecimal {
    int ll = 0 ;
    int  temp = 0 ;
    for (int i = 0; i < self.length; i ++) {
        temp = [[self substringWithRange:NSMakeRange(i, 1)] intValue];
        temp = temp * powf(2, self.length - i - 1);
        ll += temp;
    }
    NSString * result = [NSString stringWithFormat:@"%d",ll];
    return result;
}

- (NSString *)decimalToBinary {
    NSInteger num = [self integerValue];
    NSInteger remainder = 0;      //余数
    NSInteger divisor = 0;        //除数
    NSString * prepare = @"";
    
    while (true) {
        remainder = num%2;
        divisor = num/2;
        num = divisor;
        prepare = [prepare stringByAppendingFormat:@"%d",(int)remainder];
        
        if (divisor == 0) {
            break;
        }
    }
    
    NSString * result = @"";
    for (NSInteger i = prepare.length - 1; i >= 0; i --) {
        result = [result stringByAppendingFormat:@"%@",
                  [prepare substringWithRange:NSMakeRange(i , 1)]];
    }
    return [NSString stringWithFormat:@"%08d",[result intValue]];
}
@end
