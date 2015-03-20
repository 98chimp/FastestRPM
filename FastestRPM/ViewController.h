//
//  ViewController.h
//  FastestRPM
//
//  Created by Shahin on 2015-03-19.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NeedleRotation.h"

@interface ViewController : UIViewController<NeedleRotationDelegate> {
    CGPoint startLocation;
}

@property (weak, nonatomic) NeedleRotation *movementModel;

@property (strong, nonatomic) IBOutlet UIImageView *needle;
@property (strong, nonatomic) IBOutlet UIImageView *speedometer;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) double startAngle;

@end

