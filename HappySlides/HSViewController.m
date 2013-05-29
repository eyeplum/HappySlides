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

@property (strong, nonatomic) IBOutlet UIImageView *heart;

- (IBAction)performPopAnimation:(id)sender;

@end


@implementation HSViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Perform Animations

- (IBAction)performPopAnimation:(id)sender {
    [self.heart popAnimationWithCompletion:^(BOOL finished) {
        NSLog(@"%@", finished?@"YES":@"NO");
    }];
}

@end
