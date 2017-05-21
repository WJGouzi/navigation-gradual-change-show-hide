//
//  UIImage+imgaeWithColor.m
//  5-个人详情页
//
//  Created by gouzi on 2017/5/21.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "UIImage+imgaeWithColor.h"

@implementation UIImage (imgaeWithColor)


+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 开启上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(ref, color.CGColor);
    // 渲染上下文
    CGContextFillRect(ref, rect);
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return image;
}


@end
