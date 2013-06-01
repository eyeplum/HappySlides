//
//  HSViewController.m
//  HappySlides
//
//  Created by eyeplum on 5/29/13.
//  Copyright (c) 2013 eyeplum. All rights reserved.
//

#import "HSViewController.h"
#import "UIView+HSAnimation.h"


@interface HSViewController ()

@property (strong, nonatomic) IBOutlet UIView *canvas;
@property (strong, nonatomic) IBOutlet UIImageView *heart;

- (IBAction)canvasTapped:(id)sender;
- (IBAction)heartTapped:(id)sender;

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

- (IBAction)heartTapped:(id)sender {
    [self.heart animateSizeChange:(self.heart.bounds.size.width == 100) ? CGSizeMake(180, 180) : CGSizeMake(100, 100)];
}

@end
