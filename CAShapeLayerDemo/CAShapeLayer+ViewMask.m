//
//  CAShapeLayer+ViewMask.m
//  ViewCoverDemo
//
//  Created by andrewliu on 16/7/19.
//  Copyright © 2016年 andrewliu. All rights reserved.
//

#import "CAShapeLayer+ViewMask.h"

@implementation CAShapeLayer (ViewMask)


+(instancetype)createMaskLayerWithView:(UIView *)view{

    
    //view的高和宽
    CGFloat viewWith = CGRectGetWidth(view.frame);
    CGFloat viewHeight = CGRectGetHeight(view.frame);
    
    //不规则部分的大小
    CGFloat rightSpace = 40;
    CGFloat topSpace = 50;
    
    //添加遮盖的几个重要的点
    CGPoint point1 = CGPointMake(0, 0);
    CGPoint point2 = CGPointMake(viewWith - rightSpace, 0);
    CGPoint point3 = CGPointMake(viewWith - rightSpace, topSpace);
    CGPoint point4 = CGPointMake(viewWith, topSpace);
    CGPoint point5 = CGPointMake(viewWith -rightSpace, topSpace + 40);
    CGPoint point6 = CGPointMake(viewWith - rightSpace, viewHeight);
    CGPoint point7 = CGPointMake(0, viewHeight);
    
    UIBezierPath *path  = [UIBezierPath bezierPath];
    
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    
    [path closePath];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    
    
    return layer;

}

@end
