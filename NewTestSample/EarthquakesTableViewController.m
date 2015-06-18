//
//  EarthquakesTableViewController.m
//  NewTestSample
//
//  Created by Pivotal on 6/18/15.
//  Copyright © 2015 Pivotal. All rights reserved.
//

#import "EarthquakesTableViewController.h"
#import "EarthquakeDetailViewController.h"

static NSString *const EARTHQUAKES_API_URL = @"http://api.geonames.org/earthquakesJSON?north=44.2&south=-9.9&east=-22.4&west=55.2&username=nstreet";

@interface EarthquakesTableViewController ()

@property (nonatomic, strong) NSArray *earthquakes;

@end

@implementation EarthquakesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self refreshEarthquakes];
}

- (void)refreshEarthquakes
{
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:EARTHQUAKES_API_URL]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                self.earthquakes = json[@"earthquakes"];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }] resume];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.earthquakes == nil ? 0 : self.earthquakes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EarthquakeCell"];
    
    cell.textLabel.text = self.earthquakes[indexPath.row][@"eqid"];
    double magnitude = [self.earthquakes[indexPath.row][@"magnitude"] doubleValue];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.01f", magnitude];
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    EarthquakeDetailViewController *viewController = (EarthquakeDetailViewController *) segue.destinationViewController;
    viewController.earthquakeId = self.earthquakes[indexPath.row][@"eqid"];
    viewController.magnitude = self.earthquakes[indexPath.row][@"magnitude"];
    viewController.depth = self.earthquakes[indexPath.row][@"depth"];
}

@end
