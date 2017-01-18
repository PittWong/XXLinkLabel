//
//  XXLazySetView.h
//  XXKitDemo
//
//  Created by 王旭 on 16/5/17.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import <UIKit/UIKit.h>


//LazySetTableView
#define XXLazySetTableView(cellClass,reusedId,bgColor) \
self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;\
self.tableView.showsVerticalScrollIndicator = NO;\
self.tableView.bounces = NO;\
self.tableView.delegate = self;\
self.tableView.dataSource = self;\
if (bgColor) {self.tableView.backgroundColor = bgColor;}\
[self.tableView registerClass:cellClass forCellReuseIdentifier:reusedId];


//LazySetLabel
#define XXLazySetLabel(labelName,txtColor,fontSize,title,lines) \
self.labelName.textColor = txtColor;\
self.labelName.font = [UIFont systemFontOfSize:fontSize];\
self.labelName.text = title;\
self.labelName.numberOfLines = lines;


//LazySetButton title按钮
#define XXLazySetTitleButton(buttonName,target,tagNum,mothed,fontSize,titleColor,titleString) \
self.buttonName.tag = tagNum;\
if (fontSize) {self.buttonName.titleLabel.font = [UIFont systemFontOfSize:fontSize];}\
[self.buttonName setTitleColor:titleColor forState:UIControlStateNormal];\
[self.buttonName addTarget:target action:@selector(mothed) forControlEvents:UIControlEventTouchUpInside];\
if (titleString) {[self.buttonName setTitle:titleString forState:UIControlStateNormal];}\

//图片按钮
#define XXLazySetImageButton(buttonName,target,tagNum,mothed,normalImage,highImage) \
self.buttonName.tag = tagNum;\
[self.buttonName addTarget:target action:@selector(mothed) forControlEvents:UIControlEventTouchUpInside];\
if (normalImage) {[self.buttonName setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];}\
if (highImage) {[self.buttonName setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];}


//BorderAndCorner 圆角view
#define XXLazySetViewBorderAndCorner(viewName,radius,bordColor,bgColor) \
self.viewName.layer.cornerRadius = radius;\
self.viewName.layer.masksToBounds = YES;\
self.viewName.layer.borderWidth = 1;\
self.viewName.layer.borderColor = bordColor.CGColor;\
self.viewName.backgroundColor = bgColor;



//懒加载控件
//leftButtonItem
#define XXLazySetLeftItemWithImage(imageName,mothed) \
UIButton * leftImageButton = [[UIButton alloc]init];\
leftImageButton.frame = CGRectMake(0,0,35,35);\
[leftImageButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];\
[leftImageButton addTarget:self action:@selector(mothed) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem*leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftImageButton];\
self.navigationItem.leftBarButtonItem = leftItem;


//rightButtonItem

#define XXLazySetRightItemWithImage(imageName,mothed) \
UIButton * rightImageButton = [[UIButton alloc]init];\
rightImageButton.frame = CGRectMake(0,0,35,35);\
[rightImageButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];\
[rightImageButton addTarget:self action:@selector(mothed) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightImageButton];\
self.navigationItem.rightBarButtonItem = rightItem;


//rightButtonItem
#define XXLazySetRightItemWithTitle(title,mothed) \
UIButton * rightTitleButton = [[UIButton alloc]init];\
[rightTitleButton setTitle:title forState:UIControlStateNormal];\
[rightTitleButton addTarget:self action:@selector(mothed) forControlEvents:UIControlEventTouchUpInside];\
rightTitleButton.frame = CGRectMake(0, 0, 20 * title.length, 30);\
rightTitleButton.titleLabel.textAlignment = NSTextAlignmentRight;\
rightTitleButton.titleLabel.font = [UIFont kdxButtonFont];\
UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightTitleButton];\
self.navigationItem.rightBarButtonItem = rightItem;\

//设置cell被选择背景颜色
#define XXLazySetCellSelectedColor \
cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];\
cell.selectedBackgroundView.backgroundColor = [UIColor kdxCellSelectedBackgroundColor];


//MARK:设置cell阴影
#define XXLazySetCellShadow \
cell.layer.shadowOffset = CGSizeMake(0, 1);\
cell.layer.shadowColor = [UIColor grayColor].CGColor;\
cell.layer.shadowRadius = 1;\
cell.layer.shadowOpacity = .5f;\
CGRect shadowFrame = cell.layer.bounds;\
CGPathRef shadowPath = [UIBezierPath\
bezierPathWithRect:shadowFrame].CGPath;\
cell.layer.shadowPath = shadowPath;

@interface XXLazySetView : UIViewController

@end
