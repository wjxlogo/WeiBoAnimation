//
//  ItemModel.m
//  微博动画
//
//  Created by WJX on 16/8/16.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel
+ (instancetype )itemWithTitle:(NSString *)title image:(UIImage *)image{
    ItemModel *item = [[self alloc]init];
    item.title = title;
    item.image = image;

    return item;
}
@end
