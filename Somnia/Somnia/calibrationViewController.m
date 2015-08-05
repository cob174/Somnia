//
//  calibrationViewController.m
//  Somnia
//
//  Created by michael chiong on 8/4/15.
//  Copyright (c) 2015 psychoSoma. All rights reserved.
//

#import "calibrationViewController.h"

@interface calibrationViewController ()

@end

@implementation calibrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calibrateButtonPressed:(id)sender {
    baseDate = [NSDate date];
    timer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(showCalibrateActivity) userInfo:nil repeats:NO];
}

-(void)showCalibrateActivity {
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 1;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (average == 0) {
                average = accelerometerData.acceleration.y;
            }
            self.restingHeight.text = [NSString stringWithFormat:@" %f", average];
            if (error) {
                NSLog(@"%@",error);
            }
        });
    }];
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
