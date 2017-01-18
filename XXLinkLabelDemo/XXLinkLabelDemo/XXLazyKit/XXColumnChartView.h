//
//  XXColumnChartView.h
//  ToolsApp
//
//  Created by 王旭 on 16/6/7.
//  Copyright © 2016年 新网聚联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXColumnChartView : UIView


- (instancetype)initWithValues:(NSArray *)values xTittles:(NSArray *)xTittles yTittleCount:(NSInteger)yTittleCount;
+ (instancetype)chartViewWithValues:(NSArray *)values xTittles:(NSArray *)xTittles yTittleCount:(NSInteger)yTittleCount;

@property (nonatomic, assign) NSInteger yTittleCount;
@property (nonatomic, strong) NSArray *xTittles;
@property (nonatomic, strong) NSArray *values;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *axisTitleColor;




@property (nonatomic, strong) UIColor *axisColor;
@property (nonatomic, strong) UIColor *backLineColor;
@property (nonatomic, strong) UIColor *circleColor;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIColor *downColor;


@end
