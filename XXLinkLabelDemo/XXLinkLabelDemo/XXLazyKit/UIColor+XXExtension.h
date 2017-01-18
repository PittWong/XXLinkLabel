//
//  UIColor+XXExtension.h
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XXExtension)

+ (UIColor *) colorWithHexString: (NSString *)color;

+ (UIColor *) colorWithHexString: (NSString *)color Alpha:(CGFloat)alpha;

+ (UIColor *) randomColor;

+ (UIColor *) xxLineColor;                //e5e5e5
+ (UIColor *) xxTextColor333333;          //333333
+ (UIColor *) xxTextColor666666;          //666666
+ (UIColor *) xxTextColor7c7c7c;          //7c7c7c
+ (UIColor *) xxTextColor999999;          //999999
+ (UIColor *) xxTextColoraaaaaa;          //aaaaaa

@end
