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
    NSData *initVector = [kInitVector dataUsingEncoding:NSUTF8StringEncoding];
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          initVector.bytes,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
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
    NSData *initVector = [kInitVector dataUsingEncoding:NSUTF8StringEncoding];
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          initVector.bytes,
                                          [self bytes],
                                          dataLength,
                                          buffer,
                                          bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    free(buffer);
    return nil;
}

/**
 获取公钥

 @param der public_key.der
 @return 公钥
 */
- (SecKeyRef)publicKeyWithCertificate:(NSString *)der {
    if (!der) {
        return nil;
    }
    NSString *keyPath = [[NSBundle mainBundle] pathForResource:der ofType:nil];
    NSData *derData = [NSData dataWithContentsOfFile:keyPath];
    if (!derData) {
        return nil;
    }
    SecCertificateRef cert = SecCertificateCreateWithData(NULL, (CFDataRef)derData);
    SecKeyRef key = nil;
    SecTrustRef trust = nil;
    SecPolicyRef policy = nil;
    if (cert != NULL) {
        policy = SecPolicyCreateBasicX509();
        if (policy) {
            if (SecTrustCreateWithCertificates((CFTypeRef)cert, policy, &trust) == noErr) {
                SecTrustResultType result;
                if (SecTrustEvaluate(trust, &result) == noErr) {
                    key = SecTrustCopyPublicKey(trust);
                }
            }
        }
    }
    if (policy) {
        CFRelease(policy);
    }
    if (trust) {
        CFRelease(trust);
    }
    if (cert) {
        CFRelease(cert);
    }
    return key;
}

/**
 获取私钥
 
 @param p12 private_key.p12
 @return 私钥
 */
- (SecKeyRef)privateKeyWithCertificate:(NSString *)p12 certificatePWD:(NSString *)pwd {
    if (!p12) {
        return nil;
    }
    NSString *keyPath = [[NSBundle mainBundle] pathForResource:p12 ofType:nil];
    NSData *p12Data = [NSData dataWithContentsOfFile:keyPath];
    if (!p12Data) {
        return nil;
    }
    if (!pwd) {
        pwd = @"";
    }
    SecKeyRef key = NULL;
    NSMutableDictionary * options = [[NSMutableDictionary alloc] init];
    [options setObject:pwd forKey:(__bridge id)kSecImportExportPassphrase];
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    OSStatus status = SecPKCS12Import((__bridge CFDataRef) p12Data, (__bridge CFDictionaryRef)options, &items);
    if (status == noErr && CFArrayGetCount(items) > 0) {
        CFDictionaryRef identityDict = CFArrayGetValueAtIndex(items, 0);
        SecIdentityRef identityApp = (SecIdentityRef)CFDictionaryGetValue(identityDict, kSecImportItemIdentity);
        status = SecIdentityCopyPrivateKey(identityApp, &key);
        if (status != noErr) {
            key = NULL;
        }
    }
    if (items) {
        CFRelease(items);
    }
    return key;
}

- (NSData *)rsaEncryptWithKeyRef:(SecKeyRef)keyRef{
    NSData *data = self;
    
    const uint8_t *srcbuf = (const uint8_t *)[data bytes];
    size_t srclen = (size_t)data.length;
    
    size_t block_size = SecKeyGetBlockSize(keyRef) * sizeof(uint8_t);
    void *outbuf = malloc(block_size);
    size_t src_block_size = block_size - 11;
    
    NSMutableData *ret = [[NSMutableData alloc] init];
    for(int idx=0; idx<srclen; idx+=src_block_size){
        //NSLog(@"%d/%d block_size: %d", idx, (int)srclen, (int)block_size);
        size_t data_len = srclen - idx;
        if(data_len > src_block_size){
            data_len = src_block_size;
        }
        
        size_t outlen = block_size;
        OSStatus status = SecKeyEncrypt(keyRef,
                               kSecPaddingPKCS1,
                               srcbuf + idx,
                               data_len,
                               outbuf,
                               &outlen
                               );
        if (status != 0) {
            NSLog(@"SecKeyEncrypt fail. Error Code: %d", status);
            ret = nil;
            break;
        }else{
            [ret appendBytes:outbuf length:outlen];
        }
    }
    
    free(outbuf);
    CFRelease(keyRef);
    return ret;
}

- (NSData *)rsaDecryptWithKeyRef:(SecKeyRef)keyRef {
    NSData *data = self;
    
    const uint8_t *srcbuf = (const uint8_t *)[data bytes];
    size_t srclen = (size_t)data.length;
    
    size_t block_size = SecKeyGetBlockSize(keyRef) * sizeof(uint8_t);
    UInt8 *outbuf = malloc(block_size);
    size_t src_block_size = block_size;
    
    NSMutableData *ret = [[NSMutableData alloc] init];
    for(int idx=0; idx<srclen; idx+=src_block_size){
        //NSLog(@"%d/%d block_size: %d", idx, (int)srclen, (int)block_size);
        size_t data_len = srclen - idx;
        if(data_len > src_block_size){
            data_len = src_block_size;
        }
        
        size_t outlen = block_size;
        OSStatus status = SecKeyDecrypt(keyRef,
                               kSecPaddingNone,
                               srcbuf + idx,
                               data_len,
                               outbuf,
                               &outlen
                               );
        if (status != 0) {
            NSLog(@"SecKeyEncrypt fail. Error Code: %d", status);
            ret = nil;
            break;
        }else{
            //the actual decrypted data is in the middle, locate it!
            int idxFirstZero = -1;
            int idxNextZero = (int)outlen;
            for ( int i = 0; i < outlen; i++ ) {
                if ( outbuf[i] == 0 ) {
                    if ( idxFirstZero < 0 ) {
                        idxFirstZero = i;
                    } else {
                        idxNextZero = i;
                        break;
                    }
                }
            }
            
            [ret appendBytes:&outbuf[idxFirstZero+1] length:idxNextZero-idxFirstZero-1];
        }
    }
    
    free(outbuf);
    CFRelease(keyRef);
    return ret;
}

/**
 RSA 公钥加密

 @param der public_key.der
 @return 公钥加密密文
 */
- (NSData *)rsaEncryptWithPublicKey:(NSString *)der {
    SecKeyRef keyRef = [self publicKeyWithCertificate:der];
    if(!keyRef){
        return nil;
    }
    return [self rsaEncryptWithKeyRef:keyRef];
}

/**
 RSA 私钥加密
 
 @param p12 private_key.p12
 @return 私钥加密密文
 */
- (NSData *)rsaEncryptWithPrivateKey:(NSString *)p12 PWD:(NSString *)pwd {
    SecKeyRef keyRef = [self privateKeyWithCertificate:p12 certificatePWD:pwd];
    if(!keyRef){
        return nil;
    }
    return [self rsaEncryptWithKeyRef:keyRef];
}

/**
 RSA 公钥解密
 
 @param der public_key.der
 @return 公钥解密明文
 */
- (NSData *)rsaDecryptWithPublicKey:(NSString *)der {
    SecKeyRef keyRef = [self publicKeyWithCertificate:der];
    if(!keyRef){
        return nil;
    }
    return [self rsaDecryptWithKeyRef:keyRef];
}

/**
 RSA 私钥加密
 
 @param p12 private_key.p12
 @return 私钥解密明文
 */
- (NSData *)rsaDecryptWithPrivateKey:(NSString *)p12 PWD:(NSString *)pwd {
    SecKeyRef keyRef = [self privateKeyWithCertificate:p12 certificatePWD:pwd];
    if(!keyRef){
        return nil;
    }
    return [self rsaDecryptWithKeyRef:keyRef];
}
@end
