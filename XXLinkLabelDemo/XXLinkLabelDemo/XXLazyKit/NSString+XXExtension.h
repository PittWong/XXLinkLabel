//
//  NSString+XXExtension.h
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XXExtension)
/**
 *  秒数转换成时间格式
 *
 *  @param intSecTime        秒数时间(主要用在剩余时间)
 *
 *  @return 字符串
 */
+ (instancetype)timeStringWithIntSecTime:(int)intSecTime;
/**
 *  分钟数转换成时间格式
 *
 *  @param intMinTime        分钟数时间(主要用在剩余时间)
 *
 *  @return 字符串
 */
+ (instancetype)timeStringWithIntMinTime:(int)intMinTime;
/**
 *  字符串是否是int或者float类型
 *
 *  @return BOOL
 */
- (BOOL)isIntOrFloat;


- (NSString *)md5String;

- (NSString *)MD5UpperString;

- (NSString *)MD5LowerString;

- (BOOL)isHaveString;

- (NSString *)pinyinString;

+ (instancetype)pinyinStringWithSting:(NSString *)string;

//删除aString和bString之间内容 包括aString和bString
- (NSString *)removeStringBetweenString:(NSString *)aString andString:(NSString *)bString;
@end
