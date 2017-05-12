//
//  XXLinkLabel.h
//  XXLinkLabel
//
//  Created by 王旭 on 2017/1/5.
//  Copyright © 2017年 PittWong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, XXLinkLabelRegularType) {
    XXLinkLabelRegularTypeNone      = 0,
    XXLinkLabelRegularTypeAboat     = 1 << 0,//@类型
    XXLinkLabelRegularTypeTopic     = 1 << 1,//##类型  话题
    XXLinkLabelRegularTypeUrl       = 1 << 2,//url类型
};

@class XXLinkLabel;
@class XXLinkLabelModel;
@protocol XXLinkLabelDelegate <NSObject>

//model图片被点击
- (void)labelImageClickLinkInfo:(XXLinkLabelModel *)linkInfo;

//http链接点击   model内设置链接的对应点击
- (void)labelLinkClickLinkInfo:(XXLinkLabelModel *)linkInfo linkUrl:(NSString *)linkUrl;

//http链接点击   model内设置链接的对应长按
- (void)labelLinkLongPressLinkInfo:(XXLinkLabelModel *)linkInfo linkUrl:(NSString *)linkUrl;

//正则文字点击
- (void)labelRegularLinkClickWithclickedString:(NSString *)clickedString;

//label自身被点击
- (void)labelClickedWithExtend:(id)extend;
@end




@interface XXLinkLabel : UILabel

@property (nonatomic ,strong) NSArray<XXLinkLabelModel *> *messageModels;
@property (nonatomic ,assign) XXLinkLabelRegularType regularType;

@property (nonatomic ,strong) UIColor *linkTextColor;
@property (nonatomic ,strong) UIColor *selectedBackgroudColor;
@property (nonatomic , weak ) id delegate;
@property (nonatomic ,strong) id extend;                //扩展参数提供传递任意类型属性

//model图片被点击
@property (nonatomic, copy) void (^imageClickBlock)(XXLinkLabelModel *linkInfo);
//http链接点击   model内设置链接的对应点击
@property (nonatomic, copy) void (^linkClickBlock)(XXLinkLabelModel *linkInfo, NSString *linkUrl);
//http链接长按   model内设置链接的对应长按
@property (nonatomic, copy) void (^linkLongPressBlock)(XXLinkLabelModel *linkInfo, NSString *linkUrl);
//正则文字点击
@property (nonatomic, copy) void (^regularLinkClickBlock)(NSString *clickedString);

@property (nonatomic, copy) void (^labelClickedBlock)(id extend);


//添加正则表达式规则
- (void)addRegularString:(NSString *)regularString;

@end



@interface XXLinkLabelModel : NSObject

@property (nonatomic , copy ) NSString *message;        //显示的文字

//用于添加图片
@property (nonatomic ,strong) UIImage *image;           //富文本图片
@property (nonatomic , copy ) NSString *imageName;      //富文本图片名称
@property (nonatomic ,assign) CGSize imageShowSize;    //富文本图片要显示的大小  默认17*17
@property (nonatomic , copy ) NSString *imageClickBackStr;           //图片点击反馈字符串


@property (nonatomic ,strong) id extend;                //扩展参数提供传递任意类型属性
- (void)replaceUrlWithString:(NSString *)string;        //替换网络链接为指定文案

@end

