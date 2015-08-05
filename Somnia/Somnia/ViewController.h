//
//  ViewController.h
//  Somnia
//
//  Created by michael chiong on 7/26/15.
//  Copyright (c) 2015 psychoSoma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "SWRevealViewController.h"

@interface ViewController : UIViewController {
    NSTimer *timer;
    NSDate *baseDate;

    double currentMaxAccY;
    double average;
    double calories;
    double isCalibrated;
}
@property (strong, nonatomic) IBOutlet UILabel *accY;
@property (strong, nonatomic) IBOutlet UILabel *theCalories;
@property (strong, nonatomic) IBOutlet UILabel *avgAccY;

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) CMMotionManager *calibrationMotionManager;

@end


