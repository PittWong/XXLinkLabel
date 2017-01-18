//
//  XXLineChartView.m
//  NewTest
//
//  Created by 王旭 on 16/5/31.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "XXLineChartView.h"

@interface XXLineChartView ()



@property (nonatomic, strong) NSArray *yTittles;

@end

@implementation XXLineChartView

+ (instancetype)chartViewWithValues:(NSArray *)values xTittles:(NSArray *)xTittles yTittleCount:(NSInteger)yTittleCount {
    return [[self alloc]initWithValues:values xTittles:xTittles yTittleCount:yTittleCount];
}
- (instancetype)initWithValues:(NSArray *)values xTittles:(NSArray *)xTittles yTittleCount:(NSInteger)yTittleCount {
    self = [self init];
    if (self) {
        self.values = values;
        self.xTittles = xTittles;
        self.yTittleCount = yTittleCount;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.yTittleCount = 4;
        self.xTittles = @[@"标题1",@"标题2",@"标题3",@"标题4",@"标题5",@"标题6",@"标题7"];
        self.values = @[@5.6,@7.8,@6,@8.5,@3,@7,@8.9];
        self.tintColor = [UIColor blueColor];
        self.axisTitleColor = [UIColor blackColor];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
    self.axisColor = tintColor;
    self.backLineColor = [tintColor colorWithAlphaComponent:0.1];
    self.circleColor = tintColor;
    self.lineColor = [tintColor colorWithAlphaComponent:0.7];
    self.downColor = [tintColor colorWithAlphaComponent:0.05];
}
- (void)setValues:(NSArray *)values {
    _values = values;
    NSInteger maxNum = [values[0] integerValue];
    for (NSNumber *number in values) {
        if (maxNum < number.integerValue) {
            maxNum = number.integerValue;
        }
    }
    NSInteger marginYTittleNum = 0;
    for (int i = 1; maxNum/self.yTittleCount/i >= 1 ; i *=10) {
        if (maxNum % (i *self.yTittleCount) == 0) {
            marginYTittleNum = (maxNum / self.yTittleCount/i)*i;
        }else {
            marginYTittleNum = (maxNum / self.yTittleCount/i)*i + i;
        }
    }

    NSMutableArray *yTittles = [NSMutableArray array];
    for (NSInteger i = self.yTittleCount; i > 0; i--) {
        NSString *yTittle = [NSString stringWithFormat:@"%tu",marginYTittleNum * i];
        [yTittles addObject:yTittle];
    }
    self.yTittles = yTittles;
}

#pragma mark - 动画

/**
 *  填充动画过程
 *
 *  @return CABasicAnimation
 */
- (CABasicAnimation *)animation{
    CABasicAnimation * fillAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    fillAnimation.duration = 2;
    fillAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    fillAnimation.fillMode = kCAFillModeForwards;
    fillAnimation.removedOnCompletion = NO;
    fillAnimation.fromValue = @(0.f);
    fillAnimation.toValue = @(1.f);
    
    return fillAnimation;
}

- (void)drawRect:(CGRect)rect {
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    //画轴线
    [self.axisColor set];
    CGFloat xAxisX = 0.1*width;
    CGFloat xAxisY = 0.8*height;
    CGFloat xAxisWidth = 0.8*width;
    UIBezierPath *xAxis = [UIBezierPath bezierPath];
    [xAxis moveToPoint:CGPointMake(xAxisX , xAxisY)];
    [xAxis addLineToPoint:CGPointMake(xAxisX + xAxisWidth, xAxisY)];
    xAxis.lineWidth = 1;
    [xAxis stroke];
    
    CGFloat yAxisX = 0.15*width;
    CGFloat yAxisY = 0.1*height;
    CGFloat yAxisY2 = xAxisY + 15;
    UIBezierPath *yAxis = [UIBezierPath bezierPath];
    [yAxis moveToPoint:CGPointMake(yAxisX, yAxisY)];
    [yAxis addLineToPoint:CGPointMake(yAxisX, yAxisY2)];
    yAxis.lineWidth = 1;
    [yAxis stroke];
    
    UIBezierPath *yAxisArraw = [UIBezierPath bezierPath];
    [yAxisArraw moveToPoint:CGPointMake(yAxisX, yAxisY)];
    [yAxisArraw addLineToPoint:CGPointMake(yAxisX + 3, yAxisY + 10)];
    [yAxisArraw addLineToPoint:CGPointMake(yAxisX - 3, yAxisY + 10)];
    [yAxisArraw fill];
    

    CGFloat yTittleMargin = (xAxisY - yAxisY)/(self.yTittleCount + 1);
    for (int i = 0; i < self.yTittleCount; i++) {
        //绘制背景横线
        [self.backLineColor setStroke];//设置背景网格颜色
        CGFloat x = yAxisX;
        CGFloat y = yTittleMargin * (i + 1) + yAxisY;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(x, y)];
        [path addLineToPoint:CGPointMake(xAxisX + xAxisWidth, y)];
        path.lineWidth = 1;
        [path stroke];
        
        //y轴标题
        NSString *str = self.yTittles[i];
//        CGSize strSize = [str sizeWithFont:[UIFont systemFontOfSize:10]];
        CGSize strSize = [str sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]}];
        [str drawInRect:CGRectMake(yAxisX - strSize.width - 3, y - strSize.height/2, strSize.width, strSize.height)
         withAttributes:@{NSForegroundColorAttributeName : self.axisTitleColor,
                          NSFontAttributeName            : [UIFont systemFontOfSize:10]}];
    }
    
    
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    CGFloat margin = 10;
    CGFloat xTittleMargin = (xAxisX + xAxisWidth - yAxisX - 2 * margin)/(self.xTittles.count - 1);

    [self.xTittles enumerateObjectsUsingBlock:^(NSString *xTittle, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //绘制背景纵线
        [self.backLineColor set];
        CGFloat x = yAxisX + margin + xTittleMargin * idx;
        CGFloat backLineY = (xAxisY - yAxisY)/(self.yTittleCount + 1) + yAxisY - margin;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(x, backLineY)];
        [path addLineToPoint:CGPointMake(x, xAxisY)];
        path.lineWidth = 1;
        [path stroke];
        
        //x轴标题
        //        CGSize strSize = [xTittle sizeWithFont:[UIFont systemFontOfSize:10]];
        CGSize strSize = [xTittle sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]}];
        CGFloat xTittleLeftMargin = strSize.width / 2 > margin? strSize.width/2 - margin + 1 : 0;
        
        [xTittle drawInRect:CGRectMake(x - strSize.width/2 + xTittleLeftMargin, xAxisY + 3, strSize.width, 20)
             withAttributes:@{NSForegroundColorAttributeName  : self.axisTitleColor,
                              NSFontAttributeName             : [UIFont systemFontOfSize:10]}];
        
        if (idx < self.values.count) {
            //画圆
            NSNumber *number = self.values[idx];
            CGFloat y = xAxisY - (number.floatValue / [self.yTittles[0] integerValue] * yTittleMargin * self.yTittleCount);
            
            [self.circleColor set];//圆的颜色
            UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x - 2.5, y - 2.5, 5, 5)];
            [circle fill];
            
            //设置line关键节点
            if (idx == 0) {
                [linePath moveToPoint:CGPointMake(x , y)];
            }else {
                [linePath addLineToPoint:CGPointMake(x , y)];
            }
            
            //最近一个显示数值
            if (idx == self.values.count - 1) {
                NSString *lastNumString = [NSString stringWithFormat:@"%.02f",[self.values[idx] floatValue]];
//                CGSize strSize = [lastNumString sizeWithFont:[UIFont systemFontOfSize:10]];
                CGSize strSize = [lastNumString sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]}];
                CGRect backRect = CGRectMake(x - strSize.width-10, y - strSize.height-1-2, strSize.width+10, strSize.height+2);
                CGRect lastNumStringRect = CGRectMake(x - strSize.width-5, y - strSize.height-1-1, strSize.width, strSize.height);

                UIBezierPath *clip = [UIBezierPath bezierPathWithRoundedRect:backRect cornerRadius:strSize.height/2];
                [self.axisColor setFill];
                [clip fill];
                
                [lastNumString drawInRect:lastNumStringRect
                           withAttributes:@{NSForegroundColorAttributeName    : [UIColor whiteColor],
                                            NSFontAttributeName               : [UIFont systemFontOfSize:10]}];
            }
        }
    }];
    linePath.lineJoinStyle = kCGLineJoinRound;
    [self.lineColor set];//线的颜色
    [linePath stroke];
    
    [linePath addLineToPoint:CGPointMake(yAxisX + margin + (self.values.count - 1) * xTittleMargin , xAxisY)];
    [linePath addLineToPoint:CGPointMake(yAxisX + margin, xAxisY)];
    [self.downColor set];//线下阴影颜色
    [linePath fill];
 
}




@end
