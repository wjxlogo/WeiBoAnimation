//
//  ViewController.m
//  微博动画
//
//  Created by WJX on 16/8/15.
//  Copyright © 2016年 wjx. All rights reserved.
//

#import "ViewController.h"
#import "UpItemViewController.h"
#import "ItemModel.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

#pragma mark - --- lift cycle 生命周期 ---
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton    *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.bounds = CGRectMake(0, 0, 64, 44);
    addButton.center = CGPointMake(ScreenW/2, ScreenH - 22);
    [addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];

    
}
#pragma mark - --- delegate 视图委托 ---

#pragma mark - --- event response 事件相应 ---
- (void)addButtonClick:(UIButton *)sender{
    ItemModel *item = [ItemModel itemWithTitle:@"点评" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    ItemModel *item1 =     [ItemModel itemWithTitle:@"签到" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    ItemModel *item2 = [ItemModel itemWithTitle:@"拍摄" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
    ItemModel *item3 = [ItemModel itemWithTitle:@"相册" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
    ItemModel *item4 = [ItemModel itemWithTitle:@"文字" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
    ItemModel *item5 =   [ItemModel itemWithTitle:@"更多" image:[UIImage imageNamed:@"tabbar_compose_more"]];



    UpItemViewController *VC = [UpItemViewController new ];
      VC.items = @[item,item1,item2,item3,item4,item5];

    [self presentViewController:VC animated:YES completion:nil];

}
#pragma mark - --- private methods 私有方法 ---

#pragma mark - --- getters and setters 属性 ---


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
