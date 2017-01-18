//
//  DemoTableViewCell.h
//  XXLinkLabelDemo
//
//  Created by 王旭 on 2017/1/18.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XXLinkLabelModel;


@protocol DemoTableViewCellDelegate <NSObject>

- (void)tabelViewCellChanged:(XXLinkLabelModel *)messageModel cellNumber:(NSInteger)cellNumber;

@end

@interface DemoTableViewCell : UITableViewCell {
    XXLinkLabelModel *_model;
}

@property (nonatomic ,weak) id <DemoTableViewCellDelegate> delegate;

@property (nonatomic ,strong) XXLinkLabelModel *model;

@property (nonatomic ,assign) NSInteger number;

@end
