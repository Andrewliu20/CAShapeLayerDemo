//
//  ViewCover.m
//  CAShapeLayerDemo
//
//  Created by andrewliu on 16/7/19.
//  Copyright © 2016年 andrewliu. All rights reserved.
//

#import "ViewCover.h"
#import "CAShapeLayer+ViewMask.h"
@interface ViewCover ()

@end

@implementation ViewCover

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 50, 200, 300)];
    
    
    //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40, 50, 200, 300)];
    //    view.backgroundColor = [UIColor greenColor];
    //    [self.view addSubview:view];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 100, 250, 400)];
    
    imageView.image = [UIImage imageNamed:@"美女13.jpg"];
    
    [self.view addSubview:imageView];
    
    CAShapeLayer *layer = [CAShapeLayer createMaskLayerWithView:imageView];
    
    imageView.layer.mask = layer;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backClick)];
    
    
    
    self.navigationItem.leftBarButtonItem = back;
    
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
