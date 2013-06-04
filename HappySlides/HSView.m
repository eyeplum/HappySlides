//
// Created by eyeplum on 6/4/13.
// Copyright (c) 2013 eyeplum. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "HSView.h"


@implementation HSView

#pragma mark - Initializer

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _drawingPath = [UIBezierPath bezierPath];
    }

    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _drawingPath = [UIBezierPath bezierPath];
    }

    return self;
}


#pragma mark - DrawRect

- (void)drawRect:(CGRect)rect {
    [[UIColor blackColor] setStroke];
    [self.drawingPath stroke];
}

@end