//
//  PedometerViewController.m
//  Somnia
//
//  Created by michael chiong on 7/26/15.
//  Copyright (c) 2015 psychoSoma. All rights reserved.
//

#import "PedometerViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface PedometerViewController ()
@property (strong, nonatomic) CMPedometer *pedometer;
@property (weak, nonatomic) IBOutlet UILabel *stepsLabel;
@property NSDate *startDate;

@end

@implementation PedometerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stepsLabel.text = @"";
    // Do any additional setup after loading the view.
    if ([CMPedometer isStepCountingAvailable]) {
        
        self.pedometer = [[CMPedometer alloc] init];
        _startDate = [NSDate date];
        
    } else {
        NSLog(@"step count not available");
    }
    
    [self.pedometer startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData *pedometerData, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"data:%@, error:%@", pedometerData, error);
        });
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)stringWithObject:(id)obj {
    return [NSString stringWithFormat:@"%@", obj];
}

- (void)queryDateFrom:(NSDate *)startDate toDate:(NSDate *)endDate {
    [self.pedometer queryPedometerDataFromDate:startDate
                                        toDate:endDate
                                   withHandler:^(CMPedometerData *pedometerData, NSError *error) {
                                       NSLog(@"data:%@, error:%@", pedometerData, error);
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                           if (error) {
                                               NSLog(@"error");
                                           } else {
                                               self.stepsLabel.text = [self stringWithObject:pedometerData.numberOfSteps];
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
- (IBAction)queryButtonTapped:(id)sender {
    NSDate *to = [NSDate date];
    [self queryDateFrom:_startDate toDate:to];
}


@end
