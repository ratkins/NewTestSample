//
//  MultiselectTableViewController.m
//  NewTestSample
//
//  Created by Pivotal on 6/18/15.
//  Copyright © 2015 Pivotal. All rights reserved.
//

#import "MultiselectTableViewController.h"

@interface Item : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL selected;

@end

@implementation Item

+ (Item *)itemWithName:(NSString *)name {
    Item *item = [[Item alloc] init];
    item.name = name;
    item.selected = NO;
    return item;
}

@end

@interface MultiselectTableViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation MultiselectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = @[
                   [Item itemWithName:@"Nervous Energy"],
                   [Item itemWithName:@"Prosthetic Consience"],
                   [Item itemWithName:@"Bora Horza Gobuchul"],
                   [Item itemWithName:@"Determinist"],
                   [Item itemWithName:@"Eschatologist"],
                   [Item itemWithName:@"Irregular Apocolypse"],
                   [Item itemWithName:@"No More Mr Nice Guy"],
                   [Item itemWithName:@"Profit Margin"],
                   [Item itemWithName:@"Revisionist"],
                   [Item itemWithName:@"Trade Surplus"],
                   [Item itemWithName:@"The Ends Of Invention"],
                   [Item itemWithName:@"Clear Air Turbulence"],
                   [Item itemWithName:@"The Hand of God 137"],
    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MultiselectCell" forIndexPath:indexPath];
    
    Item *item = self.items[indexPath.row];
    cell.textLabel.text = item.name;
    cell.accessoryType = item.selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    cell.selected = item.selected;
    cell.backgroundColor = item.selected ? [[UIColor greenColor] colorWithAlphaComponent:0.25] : [UIColor clearColor];

    return cell;
}

-(void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    Item *item = self.items[indexPath.row];
    item.selected = !item.selected;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
