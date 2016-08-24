//
//  ItemModel.h
//  微博动画
//
//  Created by WJX on 16/8/16.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ItemModel : NSObject
/** obj*/
@property (nonatomic, copy, nullable) NSString  *title;
/** obj*/
@property (nonatomic, strong, nullable) UIImage*image;
+ (nullable instancetype )itemWithTitle:(nullable NSString *)title image:(nullable UIImage *)image;
@end
