//
//  CAShapeLayer+ViewMask.h
//  ViewCoverDemo
//
//  Created by andrewliu on 16/7/19.
//  Copyright © 2016年 andrewliu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
@interface CAShapeLayer (ViewMask)

+(instancetype)createMaskLayerWithView:(UIView *)view;
@end
