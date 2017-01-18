//
//  XXLazyCreateView.m
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "XXLazyCreateView.h"

@interface XXLazyCreateView ()

@property (nonatomic ,weak) UIView *testview;
@property (nonatomic ,weak) UILabel *label;
@property (nonatomic ,weak) UIButton *button;
@property (nonatomic ,weak) UIImageView *imageView;
@property (nonatomic ,weak) UITextField *textField;
@property (nonatomic ,weak) UITextView *textView;
@property (nonatomic ,weak) UITableView *tabelView;

@end

//@implementation XXLazyCreateView
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//}
//- (UIView *)testview {
//    if (_testview == nil) {
//        UIView *view = [[UIView alloc]init];
//        [self.view addSubview:view];
//        _testview = view;
//    }
//    return _testview;
//}
//- (UILabel *)label {
//    if (_label == nil) {
//        UILabel *label = [[UILabel alloc]init];
//        [self.view addSubview:label];
//        _label = label;
//    }
//    return _label;
//}
//- (UIButton *)button {
//    if (_button == nil) {
//        UIButton *button = [[UIButton alloc]init];
//        [self.view addSubview:button];
//        _button = button;
//    }
//    return _button;
//}
//- (UIImageView *)imageView {
//    if (_imageView == nil) {
//        UIImageView *imageView = [[UIImageView alloc]init];
//        [self.view addSubview:imageView];
//        _imageView = imageView;
//    }
//    return _imageView;
//}
//- (UITextField *)textField {
//    if (_textField == nil) {
//        UITextField *textField = [[UITextField alloc]init];
//        [self.view addSubview:textField];
//        _textField = textField;
//    }
//    return _textField;
//}
//- (UITextView *)textView {
//    if (_textView == nil) {
//        UITextView *textView = [[UITextView alloc]init];
//        [self.view addSubview:textView];
//        _textView = textView;
//    }
//    return _textView;
//}
//
//- (UITableView *)tabelView {
//    if (_tabelView == nil) {
//        UITableView *tableView = [[UITableView alloc]init];
//        [self.view addSubview:tableView];
//        _tabelView = tableView;
//        
//    }
//    return _tabelView;
//    
//    
//}
//
//@end
