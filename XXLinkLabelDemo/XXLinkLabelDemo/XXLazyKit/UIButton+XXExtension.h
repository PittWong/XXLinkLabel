//
//  UIButton+XXExtension.h
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XXExtension)

+(instancetype)buttonWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end
