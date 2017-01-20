//
//  ViewController.m
//  XXLinkLabelDemo
//
//  Created by 王旭 on 2017/1/17.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "ViewController.h"
#import "XXLinkLabel.h"
#import "DemoTabelView.h"
#import "Masonry.h"
#import "XXLazyKitHeader.h"

@interface ViewController ()<UITextViewDelegate,DemoTabelViewDelegate>

@property (nonatomic , strong ) UITextView *textView;
@property (nonatomic , strong ) DemoTabelView *tabelView;
@property (nonatomic , strong ) UISegmentedControl *segment;
@property (nonatomic , strong ) XXLinkLabel *showLabel;
@property (nonatomic , strong ) UILabel *showClickTextLabel;
@property (nonatomic , strong ) NSMutableArray *regulerButtons;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self segmentClick:self.segment];
    });
    
}


- (void)test {
    
    self.textView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    self.segment.backgroundColor = [UIColor whiteColor];
    
    
    self.tabelView.hidden = YES;
    self.tabelView.demoDelegate = self;
    self.tabelView.messageModels = [[self getTestMessages] mutableCopy];
    
    [self addColorButtons];
    [self addRegulerButtons];
    [self setupUI];
    
    
    _showLabel.numberOfLines = 0;
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.tabelView endEditing:YES];
    [self.textView endEditing:YES];
}

- (void)tabelViewMessageDidChanged:(NSArray<XXLinkLabelModel *> *)messageModels {
    self.showLabel.messageModels = messageModels;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.showLabel.text = textView.text;
}

- (void)buttonClick:(UIButton *)button {
    if (button.tag) {
        button.selected = !button.selected;
        self.showLabel.regularType = self.showLabel.regularType ^ button.tag;
    }else {
        self.showLabel.linkTextColor = button.backgroundColor;
        for (UIButton *btn in self.regulerButtons) {
            [btn setTitleColor:button.backgroundColor forState:UIControlStateSelected];
        }
        self.showClickTextLabel.textColor = button.backgroundColor;
    }
    
    if (self.tabelView.hidden) {
        self.showLabel.text = self.textView.text;
    }else {
        self.showLabel.messageModels = self.tabelView.messageModels;
    }
}

- (void)segmentClick:(UISegmentedControl *)segment {
    if (segment.selectedSegmentIndex == 0) {
        self.textView.hidden = NO;
        self.tabelView.hidden = YES;
        self.showLabel.text = self.textView.text;
    }else {
        self.textView.hidden = YES;
        self.tabelView.hidden = NO;
        self.showLabel.messageModels = self.tabelView.messageModels;
    };
}


- (void)labelImageClickLinkInfo:(XXLinkLabelModel *)linkInfo {
    self.showClickTextLabel.text = [NSString stringWithFormat:@"点击了图片对应的文字\n--------------\n%@",linkInfo.message];
    NSLog(@"点击了图片对应的文字\n--------------\n%@",linkInfo.message);
}

- (void)labelLinkClickLinkInfo:(XXLinkLabelModel *)linkInfo linkUrl:(NSString *)linkUrl {
    self.showClickTextLabel.text = [NSString stringWithFormat:@"点击了链接,链接地址为\n--------------\n%@",linkUrl];
    NSLog(@"点击了链接,链接地址为\n--------------\n%@",linkUrl);
}

- (void)labelLinkLongPressLinkInfo:(XXLinkLabelModel *)linkInfo linkUrl:(NSString *)linkUrl {
    self.showClickTextLabel.text = [NSString stringWithFormat:@"长按了(点击)\n-----\n%@",linkUrl];
    NSLog(@"长按了(点击)\n-----\n%@",linkUrl);
}

- (void)labelRegexLinkClickWithclickedString:(NSString *)clickedString {
    self.showClickTextLabel.text = [NSString stringWithFormat:@"点击了文字\n--------------\n%@",clickedString];
    NSLog(@"点击了文字\n--------------\n%@",clickedString);
}


- (void)setupUI {
    
    self.segment.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[_segment]-40-|" options:0 metrics:nil views:@{@"_segment": _segment}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[_segment(==30)]" options:0 metrics:nil views:@{@"_segment": _segment}]];
    
    
    self.textView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_textView]-10-|" options:0 metrics:nil views:@{@"_textView": _textView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[_textView(==80)]" options:0 metrics:nil views:@{@"_textView": _textView}]];
    
    [self.tabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.textView);
    }];
    
//    [self.showLabel setPreferredMaxLayoutWidth:[UIScreen mainScreen].bounds.size.width - 20];
    self.showLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_showLabel]-10-|" options:0 metrics:nil views:@{@"_showLabel": _showLabel}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_showLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:240]];
    
}



- (void)addColorButtons {
    NSArray *colors = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor]];
    NSInteger count = colors.count;
    for (int i = 0; i < count; i++) {
        UIColor *color = colors[i];
        UIButton *button = [[UIButton alloc]init];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.backgroundColor = color;
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(25);
            make.width.equalTo(@20);
            make.top.equalTo(self.view).offset(80 + 20 * i);
            make.height.equalTo(@18);
        }];
        if (i == count - 1) {
            [self buttonClick:button];
        }
    }
}

- (void)addRegulerButtons {
    NSArray *regulers = @[@"@xxx",@"#xxx#",@"http://"];
    NSInteger count = regulers.count;
    self.regulerButtons = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSString *reguler = regulers[i];
        UIButton *button = [[UIButton alloc]init];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.tag = 1<<i;
        [button setTitle:reguler forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithWhite:0.8 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(60);
            make.width.equalTo(@50);
            make.top.equalTo(self.view).offset(80 + 20 * i);
            make.height.equalTo(@18);
        }];
        if (random() % 2 == 0) {
            [self buttonClick:button];
        }
        if (i == 0) {
            [self.showClickTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(button.mas_right).offset(20);
                make.right.equalTo(self.view).offset(-20);
                make.top.equalTo(button);
            }];
        }else if (i == count - 1) {
            [self.showClickTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(button);
            }];
            self.showClickTextLabel.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
            self.showClickTextLabel.font = [UIFont systemFontOfSize:12];
            self.showClickTextLabel.numberOfLines = 0;
            self.showClickTextLabel.textAlignment = NSTextAlignmentCenter;
        }
        [self.regulerButtons addObject:button];
    }
}


- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]init];
        [self.view addSubview:_textView];
        _textView.delegate = self;
        _textView.text = @"#XXLinkLabel# This is a @XXLinkLabel Demo, access https://github.com/PittWong/XXLinkLabel can get the demo project. Follow @PittWong to get more information. 部分思路借鉴于@FFLabel,在此向大神致敬";
    }
    return _textView;
}


- (UISegmentedControl *)segment {
    if (!_segment) {
        _segment = [[UISegmentedControl alloc]initWithItems:@[@"文本方式",@"model方式"]];
        [_segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
        _segment.selectedSegmentIndex = 0;
        [self.view addSubview:_segment];
        
    }
    return _segment;
}
- (XXLinkLabel *)showLabel {
    if (!_showLabel) {
        XXLinkLabel *label = [[XXLinkLabel alloc]init];
        label.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];

        label.font = [UIFont systemFontOfSize:12];
        label.delegate = self;
        
        label.imageClickBlock = ^(XXLinkLabelModel *linkInfo) {
            self.showClickTextLabel.text = [NSString stringWithFormat:@"点击了图片对应的文字\n--------------\n%@",linkInfo.message];
            NSLog(@"block点击了图片对应的文字\n--------------\n%@",linkInfo.message);
        };
        label.linkClickBlock = ^(XXLinkLabelModel *linkInfo, NSString *linkUrl) {
            self.showClickTextLabel.text = [NSString stringWithFormat:@"点击了链接,链接地址为\n--------------\n%@",linkUrl];
            NSLog(@"block点击了链接,链接地址为\n--------------\n%@",linkUrl);
        };
        label.linkLongPressBlock = ^(XXLinkLabelModel *linkInfo, NSString *linkUrl) {
            self.showClickTextLabel.text = [NSString stringWithFormat:@"长按了\n-----\n%@",linkUrl];
            NSLog(@"block长按了(点击)\n-----\n%@",linkUrl);
        };
        label.regularLinkClickBlock = ^(NSString *clickedString) {
            self.showClickTextLabel.text = [NSString stringWithFormat:@"点击了文字\n--------------\n%@",clickedString];
            NSLog(@"block点击了文字\n--------------\n%@",clickedString);
        };
//        label.regularType = XXLinkLabelRegularTypeAboat | XXLinkLabelRegularTypeTopic | XXLinkLabelRegularTypeUrl;
        _showLabel = label;
        [self.view addSubview:label];
    }
    return _showLabel;
}
XXLazyAnyView(DemoTabelView, tabelView, self.view)
XXLazyLabel(showClickTextLabel, self.view);

- (NSArray *)getTestMessages {
    NSArray *arr = @[@"@PittWong 与xx相关",@"https://github.com 网络链接",@"#XXLinkLabel# 话题",@"can get the demo project. Follow @PittWong to get more information"];
    
    NSMutableArray *models = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        XXLinkLabelModel *messageModel = [[XXLinkLabelModel alloc]init];
        NSInteger number = i % 4;
        messageModel.message = number == 0 ? @"照片" : number == 1 ? @"地图" : arr[random() % 4];
        if ([messageModel.message isEqualToString:@"照片"]) {
            messageModel.imageName = i % 3 == 1 ? @"222.jpg" : @"111.jpg";
            messageModel.imageShowSize = i % 3 == 0 ? CGSizeMake(20, 25) : CGSizeZero;
        }else if ([messageModel.message isEqualToString:@"地图"]) {
            messageModel.imageName = i % 3 == 1 ? @"地图2.jpg" : @"地图1.jpg";
            messageModel.imageShowSize = i % 3 == 0 ? CGSizeMake(10, 10) : CGSizeZero;
            
        }
        messageModel.extend = @{@"number"         : @(i + 1),
                                @"replaceString"  : @""};
        [models addObject:messageModel];
    }
    return models;
}

@end
