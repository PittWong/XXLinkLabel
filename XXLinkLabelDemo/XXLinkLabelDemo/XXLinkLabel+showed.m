//
//  XXLinkLabel+showed.m
//  XXLinkLabelDemo
//
//  Created by 王旭 on 2017/1/20.
//  Copyright © 2017年 王旭. All rights reserved.
//


#import "XXLinkLabel+showed.h"

@protocol heimofa <NSObject>

- (NSRange)glyphsRange;
- (CGPoint)glyphsOffset:(NSRange)range;

@property (nonatomic , strong ) NSLayoutManager *layoutManager;
@property (nonatomic , strong ) NSTextContainer *textContainer;


@end

@interface XXLinkLabel ()<heimofa>

@end

@implementation XXLinkLabel (showed)


- (NSInteger)getLastShowedChartIndex {
    
    NSRange glyphsRange = [self glyphsRange];
    CGPoint offset = [self glyphsOffset:glyphsRange];
    CGPoint location = CGPointMake(self.bounds.size.width - 1, self.bounds.size.height - 1);
    CGPoint point = CGPointMake(offset.x + location.x, offset.y + location.y);
    NSUInteger index = [self.layoutManager glyphIndexForPoint:point inTextContainer:self.textContainer];
    return index;
}

- (NSString *)replaceOverstepStringWithString:(NSString *)string {

    CGSize stringSize = [string sizeWithAttributes:@{NSFontAttributeName : self.font}];

    NSRange glyphsRange = [self glyphsRange];
    CGPoint offset = [self glyphsOffset:glyphsRange];
    CGPoint location = CGPointMake(self.bounds.size.width - stringSize.width, self.bounds.size.height - stringSize.height/2);
    CGPoint point = CGPointMake(offset.x + location.x, offset.y + location.y);
    NSUInteger index = [self.layoutManager glyphIndexForPoint:point inTextContainer:self.textContainer];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithAttributedString:[self.attributedText attributedSubstringFromRange:NSMakeRange(0, index)]];
    NSAttributedString *attString2 = [self.attributedText attributedSubstringFromRange:NSMakeRange(index, self.attributedText.length - index)];
    
    [attString appendAttributedString:[[NSAttributedString alloc]initWithString:string]];
    [attString appendAttributedString:attString2];
    
    [super setAttributedText:attString];
    [self setNeedsDisplay];
    
    return nil;
}

@end
