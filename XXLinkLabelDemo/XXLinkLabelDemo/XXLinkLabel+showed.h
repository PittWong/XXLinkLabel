//
//  XXLinkLabel+showed.h
//  XXLinkLabelDemo
//
//  Created by 王旭 on 2017/1/20.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "XXLinkLabel.h"

@interface XXLinkLabel (showed)

@property (nonatomic, readonly) NSString *visibleString;  //可见的文字
- (NSInteger)getLastShowedChartIndex;                     //最后一个可见文字坐标
- (NSString *)replaceOverstepStringWithString:(NSString *)string;  //替换可见区域内后面部分文字

@end
