//
//  NSString+Validator.m
//
//  Created by 陈颜俊 on 12/18/13.
//
//

#import "NSString+Helper.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Helper)

+ (NSString *)stringWithBytes:(const char *)bytes length:(NSUInteger)length
{
    return [[NSString alloc] initWithBytes:bytes length:length encoding:NSUTF8StringEncoding];
}

- (BOOL)isInteger {
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSInteger val;
    return [scanner scanInteger:&val] && [scanner isAtEnd];
}

- (BOOL)isFloat {
    NSScanner *scanner = [NSScanner scannerWithString:self];
    float val;
    return [scanner scanFloat:&val] && [scanner isAtEnd];
}

- (BOOL)isEmptyString {
    if (!self) {
        return YES;
    }
    
    if (self && [[self trim] isEqualToString:@""]) {
        return YES;
    }
    
    return NO;

}

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (char *)convertToCharString:(char *)destination
{
    if (self) {
        return strcpy(destination, [self cStringUsingEncoding:NSUTF8StringEncoding]);
    } else {
        return destination;
    }
}

- (int)convertToInt
{
    if (!self) {
        return 0;
    }
    
    int strlength = 0;
    char* p = (char*)[self cStringUsingEncoding:NSUTF8StringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
        
    }
    return strlength;
}

#pragma mark - MD5
- (NSString *)getMd5_32Bit {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest );
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}

- (NSString *)getMd5_16Bit {
    //提取32位MD5散列的中间16位
    NSString *md5_32Bit_String=[self getMd5_32Bit];
    NSString *result = [[md5_32Bit_String substringToIndex:24] substringFromIndex:8];//即9～25位
    return result;
}

+ (NSString *)randomString:(int)maxLength
{
    NSString *stringBuilder = @"";
    
    for (int i = 0; i < maxLength; i++) {
        BOOL genNumber = arc4random() % 2;//决定随机生成字母还是数字
        if (genNumber) {
            int number = arc4random() % 10;//随机生成0-9的数字
            stringBuilder = [NSString stringWithFormat:@"%@%d", stringBuilder, number];
        } else {
            char letter = arc4random() % 25 + 'A';
            stringBuilder = [NSString stringWithFormat:@"%@%c", stringBuilder, letter];
        }
    }
    
    return stringBuilder;
}

#pragma mark - reg
- (BOOL)isValidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidateMobile
{
    //手机号以13，14，15，17，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)isValidateCarNo
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:self];
}
@end
