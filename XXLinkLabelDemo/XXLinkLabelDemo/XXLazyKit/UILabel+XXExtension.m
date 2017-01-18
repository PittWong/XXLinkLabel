//
//  UILabel+XXExtension.m
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "UILabel+XXExtension.h"
#import "NSString+XXExtension.h"

@implementation UILabel (XXExtension)

- (void) textLeftTopAlign: (NSString *)desc
{
    if (![desc isHaveString]) {
        return;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = 10;// 字体的行间距
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 NSForegroundColorAttributeName:
                                     [UIColor colorWithRed:76/255.0 green:76/255.0 blue:76/255.0 alpha:1]
                                 };
    
    self.attributedText = [[NSAttributedString alloc] initWithString:desc attributes:attributes];
    
}


+ (instancetype)circleLabel {
    
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.masksToBounds = YES;
    label.layer.borderColor = [UIColor lightGrayColor].CGColor;
    label.layer.borderWidth = 1;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        label.layer.cornerRadius = label.frame.size.height / 2;
    });
    
    
    return label;
}
@end
