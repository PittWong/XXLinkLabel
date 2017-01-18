//
//  UIView+XXExtension.h
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XXExtension)

#define XXMarginFontLeft        15
#define XXMarginFontRight       -15


@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


- (CGRect)frameInsetFromEdge:(CGFloat)left :(CGFloat)top :(CGFloat)right :(CGFloat)bottom;

+ (instancetype)viewWithUpImage:(UIImage *)image downTitle:(NSString *)title;

- (instancetype)initWithUpImage:(UIImage *)image downTitle:(NSString *)title;

@end
