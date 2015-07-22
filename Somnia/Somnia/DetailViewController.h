//
//  DetailViewController.h
//  Somnia
//
//  Created by michael chiong on 7/22/15.
//  Copyright (c) 2015 psychoSoma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

