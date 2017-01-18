//
//  UIView+XXExtension.m
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "UIView+XXExtension.h"

@implementation UIView (XXExtension)


- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}
- (CGRect)frameInsetFromEdge:(CGFloat)left :(CGFloat)top :(CGFloat)right :(CGFloat)bottom {
    return CGRectMake(left, top, self.width - left - right, self.height - top - bottom);
}

+ (instancetype)viewWithUpImage:(UIImage *)image downTitle:(NSString *)title {
    return [[self alloc]initWithUpImage:image downTitle:title];
}

- (instancetype)initWithUpImage:(UIImage *)image downTitle:(NSString *)title {
    if (self = [self init]) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = image;
        [self addSubview:imageView];
        UILabel *label = [[UILabel alloc]init];
        label.text = title;
        [self addSubview:label];
        label.font = [UIFont systemFontOfSize:12];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.frame = CGRectMake(0, 0, self.height*0.6, self.height*0.6);
            imageView.x = self.width/2-imageView.width/2;
            imageView.y = 0.15*self.height;
            
            label.frame = self.bounds;
            label.y = imageView.y + imageView.height;
            label.height = self.height - label.y;
            label.textAlignment = NSTextAlignmentCenter;
        });
    }
    return self;
}


@end
