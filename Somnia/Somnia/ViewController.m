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
    // Do any additional setup after loading the view.
    
    currentMaxAccY = 0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        [self outputAccelerationData:accelerometerData.acceleration];
        if (error) {
            NSLog(@"%@",error);
        }
    }];
    
}

- (void)outputAccelerationData:(CMAcceleration)acceleration
{
    self.accY.text = [NSString stringWithFormat:@" %.2fg", acceleration.y];
    if (fabs(acceleration.y) > fabs(currentMaxAccY)) {
        currentMaxAccY = acceleration.y;
    }
    
    self.maxAccY.text = [NSString stringWithFormat:@" %.2fg", currentMaxAccY];
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
