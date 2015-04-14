//
//  NSDate+Helper.m
//
//  Created by Kevin Chen on 12/10/13.
//
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)

- (NSDate *)plusYears:(int)years {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = years;
    NSCalendar *calender = [NSCalendar currentCalendar];
    return [calender dateByAddingComponents:dateComponents toDate:self options:0];

}

- (NSDate *)minusYears:(int)years {
    return [self plusYears:-years];
}

- (NSDate *)plusMonths:(int)month {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = month;
    NSCalendar *calender = [NSCalendar currentCalendar];
    return [calender dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)minusMonths:(int)month {
    return [self plusMonths:-month];
}

- (NSDate *)plusDays:(int)days {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = days;
    NSCalendar *calender = [NSCalendar currentCalendar];
    return [calender dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)minusDays:(int)days {
    return [self plusDays:-days];
}

- (NSDate *)plusHours:(int)hours {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.hour = hours;
    NSCalendar *calender = [NSCalendar currentCalendar];
    return [calender dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)minusHours:(int)hours {
    return [self plusHours:-hours];
}

- (BOOL)before:(NSDate *)date {
    return [self timeIntervalSinceDate:date] < 0;
}

- (BOOL)after:(NSDate *)date {
    return [self timeIntervalSinceDate:date] > 0;
}

- (BOOL)isSameDay:(NSDate *)date {
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *a = [calender components:NSCalendarUnitEra | NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    NSDateComponents *b = [calender components:NSCalendarUnitEra | NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    
    return (a.era == b.era) && (a.year == b.year) && (a.month == b.month) && (a.day == b.day);
}

- (NSInteger)daysFromDate:(NSDate *)startDate {
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *startDateComponent = [calender components:NSCalendarUnitEra | NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay fromDate:startDate];
    NSDateComponents *endDateComponent = [calender components:NSCalendarUnitEra | NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    
    NSDate *cleanedStartDate = [calender dateFromComponents:startDateComponent];
    NSDate *cleanedEndDate = [calender dateFromComponents:endDateComponent];
    
    NSDateComponents *interval = [calender components:NSCalendarUnitDay fromDate:cleanedStartDate toDate:cleanedEndDate options:0];
    return [interval day];
}

+ (NSDate *)dateFromString:(NSString *)dateString pattern:(NSString *)pattern {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = pattern;
    return [dateFormatter dateFromString:dateString];
}

- (NSString *)stringWithPattern:(NSString *)pattern {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = pattern;
    return  [dateFormatter stringFromDate:self];
}

+ (NSString *)stringFromDate:(NSDate *)date pattern:(NSString *)pattern {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = pattern;
    return [dateFormatter stringFromDate:date];
}

- (NSDate *)beginDate {
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *dateComponent = [calender components:NSCalendarUnitEra | NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    return [calender dateFromComponents:dateComponent];
}

- (NSDate *)halfOfDate {
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *dateComponent = [calender components:NSCalendarUnitEra | NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    dateComponent.hour = 12;
    return [calender dateFromComponents:dateComponent];

}

- (NSDate *)beginMonth {
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *dateComponent = [calender components:NSCalendarUnitEra | NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    dateComponent.day = 1;
    return [calender dateFromComponents:dateComponent];
}

+ (BOOL)dateExistsYear:(int)year month:(int)month day:(int)day
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    
    NSString* inputString = [NSString stringWithFormat:@"%4d%02d%02d",
                             year,month,day];
    
    NSDate *date = [dateFormatter dateFromString:inputString];
    
    return nil != date;
}

+ (NSString *)titleWithWeekday:(NSInteger)weekday
{
    NSString *title;
    
    switch (weekday) {
        case 1:
            title = NSLocalizedString(@"sun", nil);
            break;
            
        case 2:
            title = NSLocalizedString(@"mon", nil);
            break;
            
        case 3:
            title = NSLocalizedString(@"tue", nil);
            break;
            
        case 4:
            title = NSLocalizedString(@"wed", nil);
            break;
            
        case 5:
            title = NSLocalizedString(@"thu", nil);
            break;
            
        case 6:
            title = NSLocalizedString(@"fri", nil);
            break;
            
        case 7:
            title = NSLocalizedString(@"sat", nil);
            break;
            
        default:
            break;
    }
    
    return title;
}

+ (NSString *)titleWithMonth:(NSInteger)month
{
    NSString *title;
    
    switch (month) {
        case 1:
            title = NSLocalizedString(@"jan", nil);
            break;
            
        case 2:
            title = NSLocalizedString(@"feb", nil);
            break;
            
        case 3:
            title = NSLocalizedString(@"mar", nil);
            break;
            
        case 4:
            title = NSLocalizedString(@"apr", nil);
            break;
            
        case 5:
            title = NSLocalizedString(@"may", nil);
            break;
            
        case 6:
            title = NSLocalizedString(@"jun", nil);
            break;
            
        case 7:
            title = NSLocalizedString(@"jul", nil);
            break;
            
        case 8:
            title = NSLocalizedString(@"aug", nil);
            break;
            
        case 9:
            title = NSLocalizedString(@"sep", nil);
            break;
            
        case 10:
            title = NSLocalizedString(@"oct", nil);
            break;
            
        case 11:
            title = NSLocalizedString(@"nov", nil);
            break;
            
        case 12:
            title = NSLocalizedString(@"dec", nil);
            break;
            
        default:
            break;
    }
    
    return title;
}

@end
