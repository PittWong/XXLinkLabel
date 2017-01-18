//
//  NSDate+XXExtension.m
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "NSDate+XXExtension.h"

@implementation NSDate (XXExtension)
+(NSDate *)dateWithString:(NSString *)dateString dateFormatter:(NSString *)dateFormatterString{
    NSDateFormatter * dateFormatter = [[self class]getDateFormatter:dateFormatterString];
    NSDate * date = [dateFormatter dateFromString:dateString];
    return date;
}
+(NSString *)stringWithDate:(NSDate *)date dateFormatter:(NSString *)dateFormatterString{
    NSDateFormatter * dateFormatter = [[self class]getDateFormatter:dateFormatterString];
    NSString * dateString = [dateFormatter stringFromDate:date];
    return dateString;
}
+(NSDateFormatter *)getDateFormatter:(NSString *)formatter{
    /** formatter
     G:公元时代，例如AD公元
     yy:年的后2位
     yyyy:完整年
     MM:月，显示为1-12
     MMM:月，显示为英文月份简写,如Jan
     MMMM:月，显示为英文月份全称，如Janualy
     dd:日，2位数表示，如02
     d:日，1-2位显示，如2
     EEE:简写星期几，如Sun
     EEEE:全写星期几，如Sunday
     aa:上下午，AM/PM
     H:时，24小时制，0-23
     K：时，12小时制，0-11
     m:分，1-2位
     mm:分，2位
     s:秒，1-2位
     ss:秒，2位
     S:毫秒
     */
    NSDateFormatter * dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:formatter];
    return dateFormatter;
}

+ (NSString *)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Beijing"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}
@end
