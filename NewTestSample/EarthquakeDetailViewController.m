//
//  EarthquakeDetailViewController.m
//  NewTestSample
//
//  Created by Pivotal on 6/18/15.
//  Copyright © 2015 Pivotal. All rights reserved.
//

#import "EarthquakeDetailViewController.h"

@interface EarthquakeDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *earthquakeIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *magnitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *depthLabel;

@end

@implementation EarthquakeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    self.earthquakeIdLabel.text = self.earthquakeId;
    self.magnitudeLabel.text = [NSString stringWithFormat:@"%.01f", self.magnitude.doubleValue];
    self.depthLabel.text = [NSString stringWithFormat:@"%.02fm", self.depth.doubleValue];
}

@end
