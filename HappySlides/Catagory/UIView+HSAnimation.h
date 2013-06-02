//
// Created by eyeplum on 5/29/13.
// Copyright (c) 2013 eyeplum. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "CAKeyframeAnimation+AHEasing.h"


@interface UIView (HSAnimation)

- (void)animateSizeChange:(CGSize)size;
- (void)animateSizeChange:(CGSize)size withFunction:(AHEasingFunction)function;

- (void)animateCenterChange:(CGPoint)point;
- (void)animateCenterChange:(CGPoint)point withFunction:(AHEasingFunction)function;

@end