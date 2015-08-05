//
//  calibrationViewController.h
//  Somnia
//
//  Created by michael chiong on 8/4/15.
//  Copyright (c) 2015 psychoSoma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "SWRevealViewController.h"

@interface calibrationViewController : UIViewController {
    double average;
    NSTimer *timer;
    NSDate *baseDate;
}
@property (strong, nonatomic) IBOutlet UILabel *restingHeight;
@property (strong, nonatomic) CMMotionManager *motionManager;
@end
