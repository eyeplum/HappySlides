//
// Created by eyeplum on 5/29/13.
// Copyright (c) 2013 eyeplum. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <QuartzCore/QuartzCore.h>
#import "UIView+HSAnimation.h"


#define kDuration 0.5f
#define kPosition @"position"
#define kSize     @"bounds.size"


@implementation UIView (HSAnimation)

#pragma mark - Size Change Animations

- (void)animateSizeChange:(CGSize)size {
    [self animateSizeChange:size withFunction:BackEaseOut];
}


- (void)animateSizeChange:(CGSize)size withFunction:(AHEasingFunction)function {
    CAAnimation *boundsChange = [CAKeyframeAnimation animationWithKeyPath:kSize
                                                                 function:function
                                                                 fromSize:self.bounds.size
                                                                   toSize:size];
    [self performAnimation:boundsChange forKey:kSize];
    [self setBounds:CGRectMake(0, 0, size.width, size.height)];
}


#pragma mark - Center Change Animations

- (void)animateCenterChange:(CGPoint)point {
    [self animateCenterChange:point withFunction:BounceEaseOut];
}


- (void)animateCenterChange:(CGPoint)point withFunction:(AHEasingFunction)function {
    CAAnimation *centerChange = [CAKeyframeAnimation animationWithKeyPath:kPosition
                                                                 function:function
                                                                fromPoint:self.center
                                                                  toPoint:point];
    [self performAnimation:centerChange forKey:kPosition];
    [self setCenter:point];
}


#pragma mark - Helper Methods

- (void)performAnimation:(CAAnimation *)animation forKey:(NSString *)key {
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:kDuration] forKey:kCATransactionAnimationDuration];
    [CATransaction setCompletionBlock:^{
        //...
    }];

    [self.layer addAnimation:animation forKey:key];

    [CATransaction commit];
}


@end