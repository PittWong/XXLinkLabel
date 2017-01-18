//
//  UIColor+XXExtension.m
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "UIColor+XXExtension.h"

@implementation UIColor (XXExtension)
#pragma mark 16进制颜色转换
// color = #FFFFFF 或者 0xFFFFFF
+ (UIColor *)colorWithHexString:(NSString *)color {
    return [self colorWithHexString:color Alpha:1];
}

+ (UIColor *) colorWithHexString: (NSString *)color Alpha:(CGFloat)alpha
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return Nil;
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return Nil;
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}


+ (UIColor *)randomColor {
    NSInteger r = random() % 256;
    NSInteger g = random() % 256;
    NSInteger b = random() % 256;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
    
}

+(UIColor *)xxLineColor {
    return [UIColor colorWithHexString:@"e5e5e5"];
}

+ (UIColor *)xxTextColor333333 {
    return [UIColor colorWithHexString:@"333333"];
}//333333
+ (UIColor *)xxTextColor666666 {
    return [UIColor colorWithHexString:@"666666"];
}//666666
+ (UIColor *)xxTextColor7c7c7c {
    return [UIColor colorWithHexString:@"7c7c7c"];
}//7c7c7c
+ (UIColor *)xxTextColor999999 {
    return [UIColor colorWithHexString:@"999999"];
}//999999
+ (UIColor *)xxTextColoraaaaaa {
    return [UIColor colorWithHexString:@"aaaaaa"];
}//aaaaaa
@end