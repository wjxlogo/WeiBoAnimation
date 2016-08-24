//
//  UpItem.m
//  微博动画
//
//  Created by WJX on 16/8/16.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "UpItem.h"
#define KImageRatio  0.8

@implementation UpItem
#pragma mark - --- init 视图初始化 ---
- (void)awakeFromNib{
    [self setUp];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        [self setUp];
    }
    return self;
}
#pragma mark - --- delegate 视图委托 ---
- (void)setUp{
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
// 以后如果通过代码设置子控件的位置，一般都是在layoutSubviews里去写
// 只要父视图 frame发生改变时  就会调用layoutSubviews  ，重新布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    //    设置image的位置
    CGFloat imageX = 0 ;
    CGFloat imageY = 0 ;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height *KImageRatio;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    //    设置title的位置
    CGFloat labelY = imageH ;
    CGFloat labelH = self.bounds.size.height -imageH;
    self.titleLabel.frame = CGRectMake(imageX, labelY, imageW, labelH);
}
#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- setters 属性 ---
//干掉高亮状态
- (void)setHighlighted:(BOOL)highlighted{}
#pragma mark - --- getters 属性 —--




@end
