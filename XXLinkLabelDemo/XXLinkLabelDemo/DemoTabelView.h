//
//  DemoTabelView.h
//  XXLinkLabelDemo
//
//  Created by 王旭 on 2017/1/18.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XXLinkLabelModel;

@protocol DemoTabelViewDelegate <NSObject>

- (void)tabelViewMessageDidChanged:(NSArray <XXLinkLabelModel *> *)messageModels;

@end


@interface DemoTabelView : UITableView

@property (nonatomic , weak ) id <DemoTabelViewDelegate> demoDelegate;

@end
