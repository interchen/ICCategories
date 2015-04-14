//
//  NSDate+Helper.h
//
//  Created by Chen Yanjun on 12/10/13.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Helper)

/**
 *  在当前时间上增加年份
 *
 *  @param years 增加的年份
 *
 *  @return
 */
- (NSDate *)plusYears:(int)years;
- (NSDate *)minusYears:(int)years;

/**
 *  在当前时间上增加月份
 *
 *  @param month 增加的月份
 *
 *  @return
 */
- (NSDate *)plusMonths:(int)month;
- (NSDate *)minusMonths:(int)month;

/**
 *  在当前时间上增加天数
 *
 *  @param days 增加的天数
 *
 *  @return
 */
- (NSDate *)plusDays:(int)days;
- (NSDate *)minusDays:(int)days;

/**
 *  在当前时间上增加小时数
 *
 *  @param hours 增加的小时数
 *
 *  @return
 */
- (NSDate *)plusHours:(int)hours;
- (NSDate *)minusHours:(int)hours;

/**
 *  判断当前时间是否早于比较时间
 *
 *  @param date 比较时间
 *
 *  @return YES / NO
 */
- (BOOL)before:(NSDate *)date;

/**
 *  判断当前时间是否晚于比较时间
 *
 *  @param date 比较时间
 *
 *  @return YES / NO
 */
- (BOOL)after:(NSDate *)date;

/**
 *  判断是否是同一天
 *
 *  @param date 比较事件
 *
 *  @return YES / NO
 */
- (BOOL)isSameDay:(NSDate *)date;

/**
 *  计算从参数时间到self时间的天数间隔，只考虑日期，不考虑具体时分秒
 *
 *  @param startDate 起始时间
 *
 *  @return 天数间隔，可以为负
 */
- (NSInteger)daysFromDate:(NSDate *)startDate;

/**
 *  快速字符串转NSDate方法
 *
 *  @param dateString 时间字符串
 *  @param pattern    字符串格式
 *
 *  @return NSDate
 */
+ (NSDate *)dateFromString:(NSString *)dateString pattern:(NSString *)pattern;

/**
 *  根据pattern返回时间字符串
 *
 *  @param pattern 字符串格式
 *
 *  @return 
 */
- (NSString *)stringWithPattern:(NSString *)pattern;

/**
 *  快速NSDate转字符串方法
 *
 *  @param date        时间
 *  @param pattern    字符串格式
 *
 *  @return NSString
 */
+ (NSString *)stringFromDate:(NSDate *)date pattern:(NSString *)pattern;

/**
 *  清楚时间格式的分时秒 2013-01-01 00:00:00
 *
 *  @return
 */
- (NSDate *)beginDate;

/**
 *  返回当前时间中午12点 2013-01-01 12:00:00
 *
 *  @return 
 */
- (NSDate *)halfOfDate;

/**
 *  返回本月的第一天
 *
 *  @return
 */
- (NSDate *)beginMonth;

+ (BOOL)dateExistsYear:(int)year month:(int)month day:(int)day;

+ (NSString *)titleWithWeekday:(NSInteger)weekday;
+ (NSString *)titleWithMonth:(NSInteger)month;

@end
