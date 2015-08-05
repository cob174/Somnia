//
//  ViewController.m
//  Somnia
//
//  Created by michael chiong on 7/26/15.
//  Copyright (c) 2015 psychoSoma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    // Do any additional setup after loading the view.
    
    currentMaxAccY = 0;
    calories = 0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 1;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self outputAccelerationData:accelerometerData.acceleration];
            
            if (error) {
                NSLog(@"%@",error);
            }
        });
    }];

    [timer invalidate];
    baseDate = [NSDate date];
    timer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(showTimedActivity) userInfo:nil repeats:YES];
 

}

- (void)outputAccelerationData:(CMAcceleration)acceleration
{
    self.accY.text = [NSString stringWithFormat:@" %f", acceleration.y];
    if (isCalibrated == 1) {
        if (acceleration.y>average-.05 && acceleration.y<average+.05) {
            calories=calories+4.8;
        } else
            calories=calories+9.6;
    }
    
    if (fabs(acceleration.y) > fabs(currentMaxAccY)) {
        currentMaxAccY = acceleration.y;
    }
    
    self.theCalories.text = [NSString stringWithFormat:@" %f", calories];
}

-(void)showTimedActivity {
    NSTimeInterval interval = [baseDate timeIntervalSinceNow];
    double intpart;
    double fractional = modf(interval, &intpart);
    NSUInteger hundredth = ABS((int)(fractional*100));
    NSUInteger seconds = ABS((int)interval);
    NSUInteger minutes = seconds/60;
    NSUInteger hours = minutes/60;
    
    //time since start
    //self.avgAccY.text = [NSString stringWithFormat:@"%02d:%02d:%02d:%02d", hours, minutes%60, seconds%60, hundredth];
    
    /*
    if (fabs(interval) < 20) {
        self.avgAccY.text = [NSString stringWithFormat:@"%f", fabs(interval)];
    } else
        self.avgAccY.text = [NSString stringWithFormat:@"complete"];
     */
}

- (IBAction)calibrateButtonPressed:(id)sender {
    baseDate = [NSDate date];
    timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(showCalibrateActivity) userInfo:nil repeats:NO];
}

-(void)showCalibrateActivity {
    self.calibrationMotionManager = [[CMMotionManager alloc] init];
    self.calibrationMotionManager.accelerometerUpdateInterval = 1;
    
    [self.calibrationMotionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (average == 0) {
                average = accelerometerData.acceleration.y;
            }
            self.avgAccY.text = [NSString stringWithFormat:@" %f", average];
            if (error) {
                NSLog(@"%@",error);
            }
        });
    }];
    isCalibrated = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
