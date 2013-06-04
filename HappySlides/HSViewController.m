//
//  HSViewController.m
//  HappySlides
//
//  Created by eyeplum on 5/29/13.
//  Copyright (c) 2013 eyeplum. All rights reserved.
//

#import "HSViewController.h"
#import "UIView+HSAnimation.h"
#import "HSView.h"


#define kMargin 20

@interface HSViewController ()

@property (strong, nonatomic) IBOutlet HSView *canvas;
@property (strong, nonatomic) IBOutlet UIImageView *heart;

@property (strong, nonatomic) IBOutlet UIView *menuContainer;

@property (assign, nonatomic) CGPoint previousPoint;

- (IBAction)canvasTapped:(id)sender;
- (IBAction)canvasPanned:(id)sender;
- (IBAction)heartTapped:(id)sender;
- (IBAction)backgroundDoubleTapped:(id)sender;

@end


@implementation HSViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Perform Animations

- (IBAction)canvasTapped:(id)sender {
    UITapGestureRecognizer *tapGestureRecognizer = sender;
    [self.heart animateCenterChange:[tapGestureRecognizer locationInView:self.canvas]];
}

- (IBAction)canvasPanned:(id)sender {
    UIPanGestureRecognizer *panGestureRecognizer = sender;

    CGPoint currentPoint = [panGestureRecognizer locationInView:self.canvas];
    CGPoint midPoint     = [self midPointOfPoint:self.previousPoint andPoint:currentPoint];

    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [self.canvas.drawingPath moveToPoint:currentPoint];
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        [self.canvas.drawingPath addQuadCurveToPoint:midPoint controlPoint:self.previousPoint];
    }

    self.previousPoint = currentPoint;
    [self.canvas setNeedsDisplay];
}


- (IBAction)heartTapped:(id)sender {
    [self.heart animateSizeChange:(self.heart.bounds.size.width == 100) ? CGSizeMake(180, 180) : CGSizeMake(100, 100)];
}


- (IBAction)backgroundDoubleTapped:(id)sender {
    if (self.menuContainer.frame.origin.x == self.view.bounds.size.width) {
        [self showMenu];
    } else {
        [self hideMenu];
    }
}


#pragma mark - Helper Methods

- (void)showMenu {
    [self.menuContainer animateCenterChange:CGPointMake(
            self.view.bounds.size.width - self.menuContainer.bounds.size.width/2,
            self.view.bounds.size.height/2)];

    CGFloat width  = self.view.bounds.size.width - self.menuContainer.bounds.size.width - kMargin*2;
    CGFloat height = self.canvas.bounds.size.height * (width / self.canvas.bounds.size.width);
    [CATransaction begin];
    [self.canvas animateCenterChange:CGPointMake(
            self.view.bounds.size.width/2 - self.menuContainer.bounds.size.width/2,
            self.view.bounds.size.height/2)
                        withFunction:CircularEaseOut];
    [self.canvas animateSizeChange:CGSizeMake(width, height)
                      withFunction:CircularEaseOut];
    [CATransaction commit];
}


- (void)hideMenu {
    [self.menuContainer animateCenterChange:CGPointMake(
            self.view.bounds.size.width + self.menuContainer.bounds.size.width/2,
            self.view.bounds.size.height/2)];

    [CATransaction begin];
    [self.canvas animateSizeChange:CGSizeMake(
            self.view.bounds.size.width - kMargin*8,
            self.view.bounds.size.height - kMargin*8)
                      withFunction:CircularEaseIn];
    [self.canvas animateCenterChange:CGPointMake(
            self.view.bounds.size.width/2,
            self.view.bounds.size.height/2)
                        withFunction:CircularEaseIn];
    [CATransaction commit];
}


- (CGPoint)midPointOfPoint:(CGPoint)p0 andPoint:(CGPoint)p1 {
    return (CGPoint) {
            (p0.x + p1.x) / 2.0,
            (p0.y + p1.y) / 2.0
    };
}

@end
