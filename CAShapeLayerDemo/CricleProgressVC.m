//
//  CricleProgressVC.m
//  CAShapeLayerDemo
//
//  Created by andrewliu on 16/7/19.
//  Copyright © 2016年 andrewliu. All rights reserved.
//

#import "CricleProgressVC.h"

@interface CricleProgressVC ()

@property (nonatomic,strong) UIView *demoView;

@property (nonatomic,strong) UIView *circleProgressView;

@end

@implementation CricleProgressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //绘画圆形
    
    [self loadCircledemo];
    
    //圆形进度条
    
    [self loadCircleProgress];
    
    
    /*返回*/
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backClick)];
    
    self.navigationItem.leftBarButtonItem = back;
}

- (void)loadCircleProgress{
    
    _circleProgressView = [[UIView alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
    
    
    [self.view addSubview:_circleProgressView];
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = _circleProgressView.bounds;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:_circleProgressView.bounds];
    
    layer.path = path.CGPath;
    
    layer.fillColor = [UIColor clearColor].CGColor;
    
    layer.lineWidth = 2.0f;
    
    layer.strokeColor = [UIColor redColor].CGColor;
    
    [_circleProgressView.layer addSublayer:layer];

    
    
    //添加进度动画效果
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    //动画的时长
    animation.duration = 3.0f;
    /*
        控制动画的显示节奏
     kCAMediaTimingFunctionLinear 线性动画
     kCAMediaTimingFunctionEaseIn 先慢后快（慢进快出）
     kCAMediaTimingFunctionEaseOut 先快后慢（快进慢出）
     kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
     kCAMediaTimingFunctionDefault 默认，也属于中间比较快
     
     */
    
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    animation.fromValue  = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:1.1f];
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.removedOnCompletion = NO;
    
    animation.repeatCount = 20;
    
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
}

- (void)loadCircledemo{

    _demoView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    
    [self.view addSubview:_demoView];
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = _demoView.bounds;
    layer.strokeEnd = 0.7f;
    layer.strokeStart = 0.1f;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:_demoView.bounds];
    
    layer.path = path.CGPath;
    
    layer.fillColor = [UIColor clearColor].CGColor;
    
    layer.lineWidth = 2.0f;
    
    layer.strokeColor = [UIColor redColor].CGColor;
    
    [_demoView.layer addSublayer:layer];
}

- (void)backClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
