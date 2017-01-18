//
//  DemoTableViewCell.m
//  XXLinkLabelDemo
//
//  Created by 王旭 on 2017/1/18.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "DemoTableViewCell.h"
#import "Masonry.h"
#import "XXLazyKitHeader.h"
#import "XXLinkLabel.h"
@interface DemoTableViewCell ()<UITextFieldDelegate>

@property (nonatomic ,weak) UILabel *numberLabel;
@property (nonatomic ,weak) UITextField *messageTextField;
@property (nonatomic ,weak) UITextField *imageTextField;
@property (nonatomic ,weak) UITextField *imageSizeXTextField;
@property (nonatomic ,weak) UITextField *imageSizeYTextField;
@property (nonatomic ,weak) UITextField *replaceUrlTextField;
@property (nonatomic ,weak) UIView *bottomLine;


@end


@implementation DemoTableViewCell

- (void)setModel:(XXLinkLabelModel *)model {
    
    _model = model;
    self.messageTextField.text = self.model.message;
    self.imageTextField.text = self.model.imageName;
    self.imageSizeXTextField.text = self.model.imageShowSize.width > 0 ? @(self.model.imageShowSize.width).stringValue : @"";
    self.imageSizeYTextField.text = self.model.imageShowSize.height > 0 ? @(self.model.imageShowSize.height).stringValue : @"";
    self.replaceUrlTextField.text = [(NSDictionary *)self.model.extend valueForKey:@"replaceString"];
}


- (void)setNumber:(NSInteger)number {
    _number = number;
    [self setupProperty];
    [self setupUI];
    self.numberLabel.text = @(number).stringValue;
    if (number == 0) {
        self.numberLabel.text = @"序号";
        self.messageTextField.text = @"显示的文字";
        self.imageTextField.text = @"图片名称";
        self.imageSizeXTextField.text = @"图片宽";
        self.imageSizeYTextField.text = @"图片高";
        self.replaceUrlTextField.text = @"替换链接";
        
        self.messageTextField.textAlignment = NSTextAlignmentCenter;
        self.imageTextField.textAlignment = NSTextAlignmentCenter;
        self.imageSizeXTextField.textAlignment = NSTextAlignmentCenter;
        self.imageSizeYTextField.textAlignment = NSTextAlignmentCenter;
        self.replaceUrlTextField.textAlignment = NSTextAlignmentCenter;
    }else {
        self.messageTextField.textAlignment = NSTextAlignmentLeft;
        self.imageTextField.textAlignment = NSTextAlignmentLeft;
        self.imageSizeXTextField.textAlignment = NSTextAlignmentLeft;
        self.imageSizeYTextField.textAlignment = NSTextAlignmentLeft;
        self.replaceUrlTextField.textAlignment = NSTextAlignmentLeft;
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    self.model.message = self.messageTextField.text;
    self.model.imageName = self.imageTextField.text;
    self.model.imageShowSize = CGSizeMake(self.imageSizeXTextField.text.floatValue, self.imageSizeYTextField.text.floatValue);
    [self.model replaceUrlWithString:self.replaceUrlTextField.text];
    self.model.extend = @{@"number"         : @(self.number),
                          @"replaceString"  : self.replaceUrlTextField.text};

    if ([self.delegate respondsToSelector:@selector(tabelViewCellChanged:cellNumber:)]) {
        [self.delegate tabelViewCellChanged:self.model cellNumber:self.number];
    }
}

- (void)setupProperty {
    
    self.numberLabel.backgroundColor = [UIColor whiteColor];
    self.messageTextField.backgroundColor = [UIColor whiteColor];
    self.imageTextField.backgroundColor = [UIColor whiteColor];
    self.imageSizeXTextField.backgroundColor = [UIColor whiteColor];
    self.imageSizeYTextField.backgroundColor = [UIColor whiteColor];
    self.replaceUrlTextField.backgroundColor = [UIColor whiteColor];
    self.bottomLine.backgroundColor = [UIColor blackColor];
    
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    
    NSInteger fontSize = 10;
    self.numberLabel.font = [UIFont systemFontOfSize:fontSize];
    self.messageTextField.font = [UIFont systemFontOfSize:fontSize];
    self.imageTextField.font = [UIFont systemFontOfSize:fontSize];
    self.imageSizeXTextField.font = [UIFont systemFontOfSize:fontSize];
    self.imageSizeYTextField.font = [UIFont systemFontOfSize:fontSize];
    self.replaceUrlTextField.font = [UIFont systemFontOfSize:fontSize];
    
    self.messageTextField.delegate = self;
    self.imageTextField.delegate = self;
    self.imageSizeXTextField.delegate = self;
    self.imageSizeYTextField.delegate = self;
    self.replaceUrlTextField.delegate = self;

}

- (void)setupUI {
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0.5);
        make.top.equalTo(@[self.contentView,self.messageTextField,self.imageTextField,self.imageSizeXTextField,self.imageSizeYTextField,self.replaceUrlTextField]);
        make.bottom.equalTo(@[self.contentView,self.messageTextField,self.imageTextField,self.imageSizeXTextField,self.imageSizeYTextField,self.replaceUrlTextField]);
        make.width.equalTo(@30);
    }];
    
    [self.messageTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numberLabel.mas_right).offset(0.5);
    }];
    
    [self.imageTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.messageTextField.mas_right).offset(0.5);
        make.width.equalTo(@42);
    }];
    
    [self.imageSizeXTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageTextField.mas_right).offset(0.5);
        make.width.equalTo(@32);
    }];
    
    [self.imageSizeYTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageSizeXTextField.mas_right).offset(0.5);
        make.width.equalTo(@32);
    }];
    
    [self.replaceUrlTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageSizeYTextField.mas_right).offset(0.5);
        make.width.equalTo(@42);
        make.right.equalTo(self.contentView).offset(-0.5);
    }];
    
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView);
        make.height.equalTo(@0.5);
        make.right.equalTo(self.contentView);
    }];
    
}

- (XXLinkLabelModel *)model {
    if (!_model) {
        _model = [[XXLinkLabelModel alloc]init];
    }
    return _model;
    
}

XXLazyLabel(numberLabel,self.contentView)
XXLazyTextField(messageTextField,self.contentView)
XXLazyTextField(imageTextField,self.contentView)
XXLazyTextField(imageSizeXTextField,self.contentView)
XXLazyTextField(imageSizeYTextField,self.contentView)
XXLazyTextField(replaceUrlTextField,self.contentView)
XXLazyView(bottomLine, self.contentView)

@end
