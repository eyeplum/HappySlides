//
// Created by eyeplum on 5/29/13.
// Copyright (c) 2013 eyeplum. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <QuartzCore/QuartzCore.h>
#import "UIView+HSAnimation.h"
#import "CAKeyframeAnimation+AHEasing.h"


#define kDuration 0.5f
#define kPosition @"position"
#define kSize     @"bounds.size"


@implementation UIView (HSAnimation)

- (void)animateSizeChange:(CGSize)size {
    CAAnimation *boundsChange = [CAKeyframeAnimation animationWithKeyPath:kSize
                                                                 function:BackEaseOut
                                                                 fromSize:self.bounds.size
                                                                   toSize:size];
    [self performAnimation:boundsChange forKey:kSize];
    [self setBounds:CGRectMake(0, 0, size.width, size.height)];
}


- (void)animateCenterChange:(CGPoint)point {
    CAAnimation *centerChange = [CAKeyframeAnimation animationWithKeyPath:kPosition
                                                                 function:BounceEaseOut
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
        NSLog(@"Animation %@ complete.", key);
    }];

    [self.layer addAnimation:animation forKey:key];

    [CATransaction commit];
}


@end