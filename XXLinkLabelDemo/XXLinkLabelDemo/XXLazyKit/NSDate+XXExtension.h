//
//  NSDate+XXExtension.h
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XXExtension)
/**
 *  字串转时间
 *
 *  @param string        时间字串
 *  @param dateFormatter 时间格式（Define定义了部分常用格式）
 *
 *  @return 时间
 */
+(NSDate *)dateWithString:(NSString *)dateString dateFormatter:(NSString *)dateFormatterString;
/**
 *  时间转字串
 *
 *  @param date                时间
 *  @param dateFormatterString 时间格式（Define定义了部分常用格式）
 *
 *  @return 时间字串
 */
+(NSString *)stringWithDate:(NSDate *)date dateFormatter:(NSString *)dateFormatterString;


+(NSString *)weekdayStringFromDate:(NSDate*)inputDate;
@end
