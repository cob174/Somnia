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

double currentMaxAccY;
double averageY;
double average;

@interface ViewController : UIViewController {
    NSTimer *timer;
    NSDate *baseDate;
    
    NSTimer *calibrateTimer;
    NSDate *calibrateDate;
}
@property (strong, nonatomic) IBOutlet UILabel *accY;
@property (strong, nonatomic) IBOutlet UILabel *maxAccY;
@property (strong, nonatomic) IBOutlet UILabel *avgAccY;
@property (strong, nonatomic) IBOutlet UIButton *timerButton;

@property (strong, nonatomic) CMMotionManager *motionManager;
@property (strong, nonatomic) CMMotionManager *calibrateMotionManager;

@end


