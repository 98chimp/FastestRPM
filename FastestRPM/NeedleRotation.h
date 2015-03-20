//
//  NeedleRotation.h
//  FastestRPM
//
//  Created by Shahin on 2015-03-19.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NeedleRotationDelegate <NSObject>

-(void)rotateNeele:(float)rotationAngle;

@end


@interface NeedleRotation : NSObject

@property (weak, nonatomic) id<NeedleRotationDelegate> delegate;
@property (nonatomic, assign) float needleVelocity;
@property (nonatomic, assign) float rotationAngle;

@end
