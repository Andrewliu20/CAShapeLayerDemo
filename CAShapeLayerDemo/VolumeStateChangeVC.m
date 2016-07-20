//
//  VolumeStateChangeVC.m
//  CAShapeLayerDemo
//
//  Created by andrewliu on 16/7/19.
//  Copyright © 2016年 andrewliu. All rights reserved.
//

#import "VolumeStateChangeVC.h"

@interface VolumeStateChangeVC ()

@property (nonatomic,strong)  UIView *dynamicView;
@property (nonatomic,strong)  CAShapeLayer *indicateLayer;

@end

@implementation VolumeStateChangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
   

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _dynamicView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 100)];
    _dynamicView.backgroundColor = [UIColor clearColor];
    
    _dynamicView.layer.cornerRadius = 26;
    _dynamicView.layer.borderWidth = 5.0;
    _dynamicView.layer.masksToBounds = YES;
    _dynamicView.layer.borderColor = [UIColor grayColor].CGColor;
    _dynamicView.clipsToBounds = YES;
    
    [self.view addSubview:_dynamicView];
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
//    view.backgroundColor = [UIColor greenColor];
    _indicateLayer = [CAShapeLayer layer];
    _indicateLayer.frame = CGRectMake(0, 0, 50, 100);
//    stepper.center = CGPointMake(160,240);
    
    _indicateLayer.backgroundColor = [UIColor redColor].CGColor;
    [_dynamicView.layer addSublayer: _indicateLayer];
    
    
    
    //实现音量效果的添加和减少
    [self refreshUIWithVoicePower:50];
    UIStepper *stepper = [[UIStepper alloc] init];
    
    stepper.value = 50;
    
    stepper.stepValue = 10;
    

    stepper.minimumValue = 0;
    
    stepper.maximumValue = 100;
    
    stepper.center
    
    = CGPointMake(160, 240);
    
    [stepper addTarget:self action:@selector(stepperClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:stepper];
    
    
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backClick)];
    
    self.navigationItem.leftBarButtonItem = back;
    
    
}


-(void)stepperClick:(UIStepper *)stepper{
    
    
    [self refreshUIWithVoicePower:stepper.value];
    
//    NSLog(@"%d",stepper.value);
    
    [self.view reloadInputViews];
}

- (void)refreshUIWithVoicePower : (NSInteger)voicePower{
    CGFloat height = (voicePower)*(CGRectGetHeight(_dynamicView.frame)/100);
    
    
    [_indicateLayer removeFromSuperlayer];
    _indicateLayer = nil;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, CGRectGetHeight(_dynamicView.frame)-height, CGRectGetWidth(_dynamicView.frame), height) cornerRadius:0];
    _indicateLayer = [CAShapeLayer layer];
    _indicateLayer.path = path.CGPath;
    _indicateLayer.fillColor = [UIColor redColor].CGColor;
    [_dynamicView.layer addSublayer:_indicateLayer];
}
- (void)backClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
