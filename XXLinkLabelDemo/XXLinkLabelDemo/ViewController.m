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



@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test];
    
}
- (void)textViewDidChange:(UITextView *)textView {
    self.showLabel.text = textView.text;
}

- (void)labelImageClickLinkInfo:(XXLinkLabelModel *)linkInfo {
    NSLog(@"点击了图片对应的文字-------%@",linkInfo.message);
}

- (void)labelLinkClickLinkInfo:(XXLinkLabelModel *)linkInfo linkUrl:(NSString *)linkUrl {
    
    NSLog(@"点击了链接,链接地址为-------%@",linkUrl);
}

- (void)labelLinkLongPressLinkInfo:(XXLinkLabelModel *)linkInfo linkUrl:(NSString *)linkUrl {
    
    NSLog(@"长按了(点击)-----%@",linkUrl);
}

- (void)labelRegexLinkClickWithclickedString:(NSString *)clickedString {
    
    NSLog(@"点击了文字-------%@",clickedString);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];;
}

- (void)tabelViewMessageDidChanged:(NSArray<XXLinkLabelModel *> *)messageModels {
    self.showLabel.messageModels = messageModels;
}

- (void)test {
    
    self.textView.backgroundColor = [UIColor yellowColor];
    self.segment.backgroundColor = [UIColor whiteColor];
    
    [self.tabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.textView);
    }];
    self.tabelView.hidden = YES;
    self.tabelView.demoDelegate = self;
    
    NSArray *arr = @[@"随便的一点文字",@"https://www.syswin.com http://192.168.1.1",@"不知道高点啥abc:994",@"就这么牛逼吧",@"can get the demo project. Follow @PittWong to get more information"];
    XXLinkLabel *label = [[XXLinkLabel alloc]init];
    label.backgroundColor = [UIColor redColor];
    NSMutableArray *models = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        XXLinkLabelModel *messageModel = [[XXLinkLabelModel alloc]init];
        NSInteger number = i % 4;
        messageModel.message = number == 0 ? @"照片" : number == 1 ? @"地图" : arr[random() % 5];
        if ([messageModel.message isEqualToString:@"照片"]) {
            messageModel.imageName = @"111.jpg";
        }else if ([messageModel.message isEqualToString:@"地图"]) {
            messageModel.imageName = @"222.jpg";
            
        }
        [models addObject:messageModel];
    }
    
    label.text = @"#KINGLabel#This is a @KINGLabel Demo, access http://github.com/PittWong/KINGLabel can get the demo project. Follow @PittWong to get more information. 地lala图那时候is回家覅都是解放路口的设计方老师音乐hjkhjkdhshfdsfdskfdshjfkdsjkfjdsklfsd";
    label.font = [UIFont systemFontOfSize:15];
    label.messageModels = models;
    label.delegate = self;
    
    label.imageClickBlock = ^(XXLinkLabelModel *linkInfo) {
        NSLog(@"block点击了图片对应的文字-------%@",linkInfo.message);
    };
    label.linkClickBlock = ^(XXLinkLabelModel *linkInfo, NSString *linkUrl) {
        NSLog(@"block点击了链接,链接地址为-------%@",linkUrl);
    };
    label.linkLongPressBlock = ^(XXLinkLabelModel *linkInfo, NSString *linkUrl) {
        NSLog(@"block长按了(点击)-----%@",linkUrl);
    };
    label.regularLinkClickBlock = ^(NSString *clickedString) {
        NSLog(@"block点击了文字-------%@",clickedString);
    };
    label.regularType = XXLinkLabelRegularTypeAboat | XXLinkLabelRegularTypeTopic | XXLinkLabelRegularTypeUrl;
    self.showLabel = label;
    [self.view addSubview:label];
    
    [label setPreferredMaxLayoutWidth:[UIScreen mainScreen].bounds.size.width - 20];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:nil views:@{@"label": label}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:200]];
    label.numberOfLines = 0;
    
    
    
    
}

- (void)segmentClick:(UISegmentedControl *)segment {
    if (segment.selectedSegmentIndex == 0) {
        self.textView.hidden = NO;
        self.tabelView.hidden = YES;
    }else {
        self.textView.hidden = YES;
        self.tabelView.hidden = NO;
    };
}


- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]init];
        [self.view addSubview:_textView];
        _textView.delegate = self;
        _textView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_textView]-10-|" options:0 metrics:nil views:@{@"_textView": _textView}]];
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[_textView(==100)]" options:0 metrics:nil views:@{@"_textView": _textView}]];
    }
    return _textView;
}


- (UISegmentedControl *)segment {
    if (!_segment) {
        _segment = [[UISegmentedControl alloc]initWithItems:@[@"文本方式",@"model方式"]];
        [_segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
        _segment.selectedSegmentIndex = 0;
        [self.view addSubview:_segment];
        
        _segment.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[_segment]-40-|" options:0 metrics:nil views:@{@"_segment": _segment}]];
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[_segment(==30)]" options:0 metrics:nil views:@{@"_segment": _segment}]];
    }
    return _segment;
}

XXLazyAnyView(DemoTabelView, tabelView, self.view)

@end
