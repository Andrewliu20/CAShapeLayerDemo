//
//  ViewController.m
//  CAShapeLayerDemo
//
//  Created by andrewliu on 16/7/19.
//  Copyright © 2016年 andrewliu. All rights reserved.
//

#import "ViewController.h"
#import "ViewCover.h"
#import "CricleProgressVC.h"
#import "VolumeStateChangeVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    //view的遮盖物效果的跳转
    UIButton *viewCorverButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, 50)];

    [viewCorverButton setTitle:@"view的遮罩效果" forState:UIControlStateNormal];
    
    [viewCorverButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [viewCorverButton addTarget:self action:@selector(viewCorverClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:viewCorverButton];
    
    
    //音量大小动态改变的控件的跳转
    
    UIButton *volumeStateChange = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 50)];
    [volumeStateChange setTitle:@"音量大小动态改变的控件" forState:UIControlStateNormal];
    
    [volumeStateChange setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [volumeStateChange addTarget:self action:@selector(volumeStateChangeClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:volumeStateChange];
    
    
    //圆形进度条
    UIButton *circleProgress = [[UIButton alloc] initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 100, 50)];
    [circleProgress setTitle:@"圆形进度条" forState:UIControlStateNormal];
    
    [circleProgress setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [circleProgress addTarget:self action:@selector(circleProgressClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:circleProgress];
    
    
    
    
}

- (void)circleProgressClick{
   
    CricleProgressVC *cricleProgressVC = [CricleProgressVC new];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cricleProgressVC];
    
    
    
    [self presentViewController:nav animated:YES completion:nil];}


- (void)volumeStateChangeClick{
    
    VolumeStateChangeVC *volumeState = [[VolumeStateChangeVC alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:volumeState];
    
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)viewCorverClick{
    
    ViewCover *viewCorver = [[ViewCover alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewCorver];
    
    
    [ self presentViewController:nav animated: YES completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
