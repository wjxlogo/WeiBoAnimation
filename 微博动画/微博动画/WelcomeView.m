//
//  WelcomeView.m
//  微博动画
//
//  Created by WJX on 16/8/15.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "WelcomeView.h"
@interface WelcomeView ()

/** obj*/
@property (nonatomic, strong, nullable) UIImageView  *backImageView;

/** obj*/
@property (nonatomic, strong, nullable) UIImageView  *iconView;

/** obj*/
@property (nonatomic, strong, nullable) UILabel  *textLabel;

/** obj*/
@property (nonatomic, strong, nullable) UIImageView  *sloganImageView;

@end

@implementation WelcomeView
#pragma mark - --- init 视图初始化 ---
+(instancetype)welcome{
    return  [[self alloc]init];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    [self addSubview:self.backImageView];
    [self addSubview:self.sloganImageView];
    [self addSubview:self.iconView];
    [self addSubview:self.textLabel];

}
#pragma mark - --- delegate 视图委托 ---

- (void)layoutSubviews{
     CGFloat width = self.bounds.size.width;
     CGFloat height = self.bounds.size.height;

    _backImageView.frame   = CGRectMake(0, 0, width, height);

    _sloganImageView.frame =  CGRectMake(0, 0,154, 48);
    _sloganImageView.center =  CGPointMake( width/2,  width/2);
    _iconView.frame =CGRectMake(0, 0, width/4, width/4);
    _iconView.center =  CGPointMake( width/2,  width/2);
    _textLabel.frame = CGRectMake(0, 0,width/4 , 30);
    _textLabel.center =  CGPointMake( width/2,  width/2 +width/2 *2/5 );

}
//视图加到父视图上 调用
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
//    设置头像偏移
    _iconView.transform = CGAffineTransformMakeTranslation(0, 30);

    [UIView animateWithDuration:1 animations:^{

//        文字图片逐渐消失
        _sloganImageView.alpha = 0;


    } completion:^(BOOL finished) {

//        头像显示
        _iconView.hidden = NO;
        [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            
            _iconView.transform  = CGAffineTransformIdentity;


        } completion:^(BOOL finished) {

              _textLabel.alpha = 0;
             _textLabel.hidden = NO;



            [UIView animateWithDuration:0.5 animations:^{
//                显示文字
                _textLabel.alpha = 1;
            } completion:^(BOOL finished) {
//                移除视图
                [self removeFromSuperview];
            }];

        }];
    }];
}
#pragma mark - --- event response 事件相应 ---

#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- setters 属性 ---

#pragma mark - --- getters 属性 —--
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
- (UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]init];
        _backImageView.image = [UIImage imageNamed:@"ad_background"];

    }
    return _backImageView;
}


- (UIImageView *)sloganImageView{
    if (!_sloganImageView) {
        _sloganImageView = [[UIImageView alloc]init];
        _sloganImageView.image = [UIImage imageNamed:@"compose_slogan"];
    }
    return _sloganImageView;

}

- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [[UIImageView alloc]init];
        _iconView.layer.cornerRadius = ScreenW/8;
        _iconView.layer.masksToBounds = YES;
        _iconView.image = [UIImage imageNamed:@"doubi"];
        _iconView.hidden     = YES;

    }
    return _iconView;
}
- (UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel   alloc]init];
        _textLabel.text = @"欢迎回来";
        _textLabel.font = [UIFont systemFontOfSize:19];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor = [UIColor lightGrayColor];
        _textLabel.hidden     = YES;

    }
    return _textLabel;
}


@end
