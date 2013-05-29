//
// Created by eyeplum on 5/29/13.
// Copyright (c) 2013 eyeplum. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <QuartzCore/QuartzCore.h>
#import "UIView+HSAnimation.h"


@implementation UIView (HSAnimation)

- (void)popAnimationWithCompletion:(void (^)(BOOL))completion {
    [UIView animateWithDuration:0.3 animations:^{
        self.layer.transform = CATransform3DMakeScale(1.2, 1.2, 1.0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.layer.transform = CATransform3DIdentity;
        } completion:^(BOOL isFinished) {
            if (completion) {
                completion(isFinished);
            }
        }];
    }];
}

@end