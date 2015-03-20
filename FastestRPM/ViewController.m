//
//  ViewController.m
//  FastestRPM
//
//  Created by Shahin on 2015-03-19.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
    
    [self.view addGestureRecognizer:panGesture];
    
    NeedleRotation *movementModel = [[NeedleRotation alloc] init];
    self.movementModel.delegate = self;
    self.startAngle = (5 * M_PI / 180);
    
    self.needle.transform = CGAffineTransformMakeRotation(self.startAngle);
//    self.needle.layer.anchorPoint = CGPointMake(self.needle.frame.size.width/2.0, self.needle.frame.size.height/2.0);
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSTimer *) timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:0.01 target:self selector:@selector(decrementNeedle) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)didPan:(UIPanGestureRecognizer *)sender {
    CGFloat velocity = 0.0;
    CGFloat rotationAngle = 0.0;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        startLocation = [sender locationInView:self.view];
    }
    else if (sender.state == UIGestureRecognizerStateChanged) {
        CGFloat xVelocity = [sender velocityInView:self.view].x;
        CGFloat yVelocity = [sender velocityInView:self.view].y;
        velocity = sqrt(pow(xVelocity, 2) + pow(yVelocity, 2));
        NSLog(@"xVelocity = %f", xVelocity);
        NSLog(@"yVelocity = %f", yVelocity);
        NSLog(@"velocity is = %f", velocity);
        rotationAngle = (velocity / 50) * (M_PI / 180);
        self.needle.transform = CGAffineTransformMakeRotation(rotationAngle);
    }
    else if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateKeyframesWithDuration:1.0 delay:0.5 options:0 animations:^{
            self.needle.transform = CGAffineTransformMakeRotation(self.startAngle);
        } completion:nil];
    }
        NSLog(@"End");
}

- (void) decrementNeedle{
    
}


@end

