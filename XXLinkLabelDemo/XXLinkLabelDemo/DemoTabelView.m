//
//  DemoTabelView.m
//  XXLinkLabelDemo
//
//  Created by 王旭 on 2017/1/18.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "DemoTabelView.h"
#import "DemoTableViewCell.h"
#import "XXLinkLabel.h"

@interface DemoTabelView ()<UITableViewDelegate,UITableViewDataSource,DemoTableViewCellDelegate>

@property (nonatomic ,strong) NSMutableArray *messageModels;

@end

@implementation DemoTabelView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self registerClass:[DemoTableViewCell class] forCellReuseIdentifier:@"cell"];
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (void)tabelViewCellChanged:(XXLinkLabelModel *)messageModel cellNumber:(NSInteger)cellNumber {
    
    messageModel.extend = @(cellNumber);
    NSInteger count = self.messageModels.count;
    for (int i = 0; i < count; i++) {
        XXLinkLabelModel *model = self.messageModels[i];
        if ([model.extend integerValue] == cellNumber) {
            self.messageModels[i] = messageModel;
            [self messageChanged];
            return;
        }
        if ([model.extend integerValue] > cellNumber) {
            [self.messageModels insertObject:messageModel atIndex:i];
            [self messageChanged];
            return;
        }
    }
    [self.messageModels addObject:messageModel];
    [self messageChanged];
}

- (void)messageChanged {
    if ([self.demoDelegate respondsToSelector:@selector(tabelViewMessageDidChanged:)]) {
        [self.demoDelegate tabelViewMessageDidChanged:self.messageModels];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    cell.userInteractionEnabled = indexPath.row != 0;
    cell.number = indexPath.row;
    cell.delegate = self;

    return cell;
}

- (NSMutableArray *)messageModels {
    if (!_messageModels) {
        _messageModels = [NSMutableArray array];
    }
    return _messageModels;
}
@end
