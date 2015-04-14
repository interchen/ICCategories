//
//  NSString+Validator.h
//  PR_iPad
//
//  Created by Kevin Chen on 12/18/13.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Helper)

+ (NSString *)stringWithBytes:(const char *)bytes length:(NSUInteger)length;

- (BOOL)isInteger;
- (BOOL)isFloat;
- (BOOL)isEmptyString;

- (NSString *)trim;

- (char *)convertToCharString:(char *)destination;

/**
 *  计算中英文混输的字符串长度，基于UTF8计算，一个中文字符占三个字节
 *
 *  @return 字符串长度
 */
- (int)convertToInt;

#pragma mark - MD5
/**
 *  获取32位MD5加密字符串
 *
 *  @return 加密后的字符串
 */
- (NSString *)getMd5_32Bit;

/**
 *  获取16位MD5加密字符串
 *
 *  @return 加密后的字符串
 */
- (NSString *)getMd5_16Bit;

- (BOOL)isValidateEmail;
- (BOOL)isValidateMobile;
- (BOOL)isValidateCarNo;

/**
 *  生成字母+数字的随机字符串
 *
 *  @param maxLength 最长多少位
 *
 *  @return 字符串
 */
+ (NSString *)randomString:(int)maxLength;
@end
