//
//  XXButtonLikeCell.h
//  Demo
//
//  Created by 王旭 on 16/5/25.
//  Copyright © 2016年 Pitt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XXButtonLikeCellMessageSide) {               //信息框对齐模式 default is XXButtonLikeCellMessageSideLeft
    XXButtonLikeCellMessageSideLeft,
    XXButtonLikeCellMessageSideRight,
    XXButtonLikeCellMessageSideCenter
};
typedef NS_ENUM(NSInteger, XXButtonLikeCellAccessoryType) {             //右侧附加类型
    XXButtonLikeCellAccessoryNone,                                      // don't show any accessory view
    XXButtonLikeCellAccessoryIndicator,                                 // regular chevron. doesn't track  right arrow
    XXButtonLikeCellAccessorySwitch                                      //swich .doesn't track
};
@interface XXButtonLikeCell : UIButton

@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *message;
@property (nonatomic ,copy) NSString *keyMark;

@property (nonatomic) XXButtonLikeCellAccessoryType accessoryType;       // default is UITableViewCellAccessoryNone. use to set standard type
@property (nonatomic, strong) UIView *accessoryView;                  // if set, use custom view. ignore accessoryType. tracks if enabled can calls accessory action
@property (nonatomic ,assign) BOOL switchOn;                //当选择了XXButtonLikeCellAccessorySwitch后有意义
@property (nonatomic ,assign) BOOL lineHidden;
@property (nonatomic) XXButtonLikeCellMessageSide messageSide;

- (void)addTarget:(id)target action:(SEL)action messageSide:(XXButtonLikeCellMessageSide)messageSide Title:(NSString *)title Tag:(NSInteger)tag ;
- (void)setQuickEditWithKeyboardType:(UIKeyboardType) keyboardType;    //需要编辑时设置此项

- (void)setQuickEditWithKeyboardType:(UIKeyboardType) keyboardType isPlaceHolder:(BOOL)isPlaceHolder;    //需要编辑时设置此项

- (void)setQuickEditWithKeyboardType:(UIKeyboardType) keyboardType minLength:(NSInteger)minLength maxLength:(NSInteger)maxLength;    //需要编辑时设置此项

@end
