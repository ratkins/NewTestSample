//
//  EarthquakeDetailViewController.h
//  NewTestSample
//
//  Created by Pivotal on 6/18/15.
//  Copyright © 2015 Pivotal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EarthquakeDetailViewController : UIViewController

@property (nonatomic, strong) NSString *earthquakeId;
@property (nonatomic, strong) NSNumber *magnitude;
@property (nonatomic, strong) NSNumber *depth;

@end
