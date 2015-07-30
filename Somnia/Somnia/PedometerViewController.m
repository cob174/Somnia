//
//  PedometerViewController.m
//  Somnia
//
//  Created by michael chiong on 7/26/15.
//  Copyright (c) 2015 psychoSoma. All rights reserved.
//

#import "PedometerViewController.h"
#import <CoreMotion/CoreMotion.h>
#import <AVFoundation/AVFoundation.h>

@interface PedometerViewController ()

@property (strong, nonatomic) NSArray *serviceArray;
@property (strong, nonatomic) CMPedometer *pedometer;
@property (weak, nonatomic) IBOutlet UILabel *stepsLabel;
@property (strong, nonatomic) CMMotionActivityManager *cmManager;
@property (strong, nonatomic) NSOperationQueue *motionActivityQueue;
@property NSDate *startDate;

@end

@implementation PedometerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stepsLabel.text = @"";
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)stringWithObject:(id)obj {
    return [NSString stringWithFormat:@"%@", obj];
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
