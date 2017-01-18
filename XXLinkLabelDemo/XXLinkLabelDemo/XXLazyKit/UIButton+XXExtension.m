//
//  UIButton+XXExtension.m
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "UIButton+XXExtension.h"
#import "UIView+XXExtension.h"

@implementation UIButton (XXExtension)

+ (instancetype)buttonWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    if (highImage) {
        [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    }
    // 设置尺寸
    CGFloat Screen_scale = [UIScreen mainScreen].scale;
    CGSize size = btn.currentBackgroundImage.size;
    btn.size = CGSizeMake(size.width / Screen_scale, size.height / Screen_scale);
    
    return btn;
}

@end
