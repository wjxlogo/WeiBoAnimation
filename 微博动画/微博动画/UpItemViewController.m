//
//  UpItemViewController.m
//  微博动画
//
//  Created by WJX on 16/8/16.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "UpItemViewController.h"
#import "ItemModel.h"
#import "UpItem.h"

@interface UpItemViewController ()
/** obj*/
@property (nonatomic, strong, nullable) NSMutableArray  *itemButtons;

/** obj*/
@property (nonatomic, assign) int   btnIndex;

/** obj*/
@property (nonatomic, strong, nullable) NSTimer  *timer;

/** obj*/
@property (nonatomic, strong, nullable) UIImageView     *imageButton;

/** obj*/
@property (nonatomic, assign) BOOL  isUp;

/** obj*/
@property (nonatomic, strong, nullable) UIImageView  *sloganImageView;


@end

@implementation UpItemViewController

#pragma mark - --- lift cycle 生命周期 ---
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];

    [self.view addSubview:self.sloganImageView];
//    添加按钮
    [self setupAllButton];
    self.isUp = YES;

    self.timer =  [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeChage) userInfo:nil repeats:YES];

}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.5 animations:^{
        CAReplicatorLayer *layer = (CAReplicatorLayer *)self.imageButton.layer;
        CATransform3D tranform = CATransform3DMakeTranslation(0, 0, 0);
        tranform  = CATransform3DRotate(tranform, M_PI_4, 0, 0, 1);
        layer.transform = tranform;
    }];

}

#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---

- (void)tap:(UITapGestureRecognizer *)tap{
    self.isUp = NO;
    self.btnIndex = 0;
    //开启定时器
    [_timer setFireDate:[NSDate distantPast]];

    [UIView animateWithDuration:0.5 animations:^{
               self.imageButton.transform = CGAffineTransformIdentity;
        }];

}

- (void)btnClickDown:(UpItem *)item{
    [UIView animateWithDuration:0.1 animations:^{
            item.transform = CGAffineTransformMakeScale(1.1, 1.1);
    }];

}

- (void)btnClickUpInside:(UpItem *)item{
    [UIView animateWithDuration:0.2 animations:^{
          item.transform = CGAffineTransformMakeScale(1.9, 1.9);
          item.alpha = 0.3;
    } completion:^(BOOL finished) {


        if (item.tag ==  self.itemButtons.count) {

        }else{
             [item removeFromSuperview];	
        }
    }];
}
#pragma mark - --- private methods 私有方法 ---
- (void)setupAllButton{

//    下面叉号按钮
    UIView  * downBackView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 40, [UIScreen mainScreen].bounds.size.width, 40)];
    downBackView.backgroundColor = [UIColor lightGrayColor];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [downBackView addGestureRecognizer:tap];
    [self.view addSubview:downBackView];
    [downBackView addSubview:self.imageButton];


    int cols = 3;
    int col = 0;
    int row = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat wh = 100;
    CGFloat oriY = 300;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - cols *wh)/(cols +1);
    for (int i = 0 ; i <_items.count; i++) {
        UpItem *btn = [UpItem buttonWithType:UIButtonTypeCustom];
        col = i%cols;
        row = i/cols;
        x = margin + col *(margin + wh);
        y = row *(margin +wh)+oriY;

        ItemModel *model = _items[i];
        btn.tag = i+1;
        [btn setImage:model.image forState:UIControlStateNormal];
        [btn setTitle:model.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        btn.frame = CGRectMake(x, y, wh, wh);
        //        偏移到底部之下
        btn.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height - oriY);

        [btn addTarget:self action:@selector(btnClickDown:) forControlEvents:UIControlEventTouchDown];
        [btn addTarget:self action:@selector(btnClickUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [self.itemButtons addObject:btn];
        [self.view addSubview:btn];
    }
    
}


- (void)setupOneBtnAnimtion:(UpItem *)item{

    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
             item.transform = CGAffineTransformIdentity;
         } completion:nil];
}
- (void)setdownOneBtnAnimtion:(UpItem *)item{

    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{

        item.transform = CGAffineTransformMakeTranslation(0, self.view.bounds.size.height - 300);;

    } completion:nil];
}
//按钮按顺序的从下往上平移
- (void)timeChage{

    if (self.isUp == YES) {
        if (_btnIndex == self.itemButtons.count) {
            //            [_timer invalidate];
            //关闭定时器
            [_timer     setFireDate:[NSDate distantFuture]];
            return;
        }
        UpItem *item = _itemButtons[_btnIndex];
        [self setupOneBtnAnimtion:item];
        _btnIndex++;
    }else{
        if (_btnIndex == self.itemButtons.count) {
            //            [_timer invalidate];
            //关闭定时器
            [_timer     setFireDate:[NSDate distantFuture]];
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }
        NSArray * itemBtn = [[self.itemButtons reverseObjectEnumerator] allObjects];
        UpItem *item = itemBtn[_btnIndex];
        [self setdownOneBtnAnimtion:item];
        _btnIndex++;

    }


}


#pragma mark - --- getters and setters 属性 ---
- (NSMutableArray *)itemButtons{
    if (!_itemButtons) {
        _itemButtons = [NSMutableArray array];
    }
    return _itemButtons;
}
- (UIImageView *)imageButton{
    if (!_imageButton) {
        self.imageButton = [[UIImageView alloc]init];
        self.imageButton.bounds = CGRectMake(0, 0, 40, 40);
        self.imageButton.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 20);
        self.imageButton.image =[UIImage imageNamed:@"tabbar_compose_background_icon_close"] ;
    }
    return _imageButton;
}
- (UIImageView *)sloganImageView{
    if (!_sloganImageView) {
        _sloganImageView = [[UIImageView alloc]init];
        _sloganImageView.image = [UIImage imageNamed:@"compose_slogan"];
        CGFloat width = self.view.bounds.size.width;
        _sloganImageView.frame =  CGRectMake(0, 0,154, 48);
        _sloganImageView.center = CGPointMake(width/2, 150);
    }
    return _sloganImageView;

}


@end
