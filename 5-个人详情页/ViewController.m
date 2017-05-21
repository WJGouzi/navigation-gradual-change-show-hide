//
//  ViewController.m
//  5-个人详情页
//
//  Created by gouzi on 2017/5/21.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+imgaeWithColor.h"

#define oriOfftY -244
#define oriHeight 200

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;

@end

@implementation ViewController

static NSString *iden = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self wjNavigationSettings];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:iden];
    //当调用contentInset会自动调用scrollViewDidScroll
    self.tableView.contentInset = UIEdgeInsetsMake(244, 0, 0, 0);
}

#pragma mark - navigation settings
- (void)wjNavigationSettings {
    // 设置导航栏的背景
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 取消掉底部的那根线
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];

    //设置标题
    UILabel *title = [[UILabel alloc] init];
    title.text = @"个人主页";
    [title sizeToFit];
    // 开始的时候看不见，所以alpha值为0
    title.textColor = [UIColor colorWithWhite:0 alpha:0];
    
    self.navigationItem.titleView = title;
}




#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    cell.textLabel.text = @"wj";
    return cell;
}


#pragma mark - scrollview
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f", scrollView.contentOffset.y);
    CGFloat offset = scrollView.contentOffset.y - oriOfftY;
    
    CGFloat imgH = oriHeight - offset;
    if (imgH < 64) {
        imgH = 64;
    }
    self.imageHeight.constant = imgH;
    
    //根据透明度来生成图片
    //找最大值/
    CGFloat alpha = offset * 1 / 136.0;   // (200 - 64) / 136.0f
    if (alpha >= 1) {
        alpha = 0.99;
    }

    //拿到标题 标题文字的随着移动高度的变化而变化
    UILabel *titleL = (UILabel *)self.navigationItem.titleView;
    titleL.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    
    //把颜色生成图片
    UIColor *alphaColor = [UIColor colorWithWhite:1 alpha:alpha];
    //把颜色生成图片
    UIImage *alphaImage = [UIImage imageWithColor:alphaColor];
    //修改导航条背景图片
    [self.navigationController.navigationBar setBackgroundImage:alphaImage forBarMetrics:UIBarMetricsDefault];
    
}




@end
