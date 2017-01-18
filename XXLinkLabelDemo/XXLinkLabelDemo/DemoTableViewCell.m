//
//  DemoTableViewCell.m
//  XXLinkLabelDemo
//
//  Created by 王旭 on 2017/1/18.
//  Copyright © 2017年 王旭. All rights reserved.
//

//@property (nonatomic , copy ) NSString *message;        //显示的文字
//
////用于添加图片
//@property (nonatomic ,strong) UIImage *image;           //富文本图片
//@property (nonatomic , copy ) NSString *imageName;      //富文本图片名称
//@property (nonatomic ,assign) CGSize imageShowSize;    //富文本图片要显示的大小  默认17*17
//
//@property (nonatomic ,strong) id extend;                //扩展参数提供传递任意类型属性
//- (void)replaceUrlWithString:(NSString *)string;        //替换网络链接为指定文案

#import "DemoTableViewCell.h"
#import "Masonry.h"
#import "XXLazyKitHeader.h"
@interface DemoTableViewCell ()

@property (nonatomic ,strong) UILabel *numberLabel;
@property (nonatomic ,strong) UITextField *messageTextField;
@property (nonatomic ,strong) UITextField *imageTextField;
@property (nonatomic ,strong) UITextField *imageSizeXTextField;
@property (nonatomic ,strong) UITextField *imageSizeYTextField;
@property (nonatomic ,strong) UITextField *replaceUrlTextField;

@end


@implementation DemoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
XXLazyLabel(numberLabel,self)
XXLazyTextField(messageTextField,self)
@end
