//
//  ViewController.m
//  BeautifulCities
//
//  Created by Christopher on 10/10/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityViewController.h"



@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *cities;
@property NSIndexPath *deleteIndexPath;
@property NSMutableArray *selectedRow;
@property BOOL isEditable;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cities = [NSMutableArray new];
    self.selectedRow = [NSMutableArray new];

    City *chicagoCity = [[City alloc]init];
    chicagoCity.city = @"Chicago";
    chicagoCity.state = @"IL";
//    chicagoCity.image = @"Chicago";
    City *tokyoCity = [[City alloc]init];
    tokyoCity.city = @"Tokyo";
    tokyoCity.state = @"Tokyo";
//    tokyoCity.image = @"Tokyo";
    City *vancouverCity = [[City alloc]init];
    vancouverCity.city  = @"Vancouver";
    vancouverCity.state = @"British Columbia";
//    vancouverCity.image = @"Vancouver";
    City *sanfranciscoCity = [[City alloc]init];
    sanfranciscoCity.city = @"San Francisco";
    sanfranciscoCity.state = @"California";
//    sanfranciscoCity.image = @"San Francisco";

    self.cities = [NSMutableArray arrayWithObjects: chicagoCity, tokyoCity, vancouverCity, sanfranciscoCity, nil];

    self.isEditable = NO;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// establishes TableView & cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];

    City *oneCity = [self.cities objectAtIndex:indexPath.row];

    cell.textLabel.text = oneCity.city;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
//    cell.showsReorderControl = YES;
    return cell;;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;
}


// Deleting methods



//- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {


//- (IBAction) onEditButtonPressed:(UIBarButtonItem *) sender {
//
//    if (self.isEditable == YES) {
//        sender.title = @"Edit";
//        [self.tableView setEditing:NO animated: YES];
//
//    }  else  {
//        sender.title = @"Done";
//        [self.tableView setEditing:YES animated:YES];
//    }
//    self.isEditable = !self.isEditable;
//}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"HEY WERE'RE HERE");

    if (buttonIndex == 0) {
        [self.cities removeObjectAtIndex:self.deleteIndexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: self.deleteIndexPath] withRowAnimation:YES];
        [self.tableView reloadData];
    }
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    self.deleteIndexPath = indexPath;
    UIAlertView *alertView = [[UIAlertView alloc]init];
    alertView.delegate =  self;
    alertView.title = @"Are you sure?";
    [alertView addButtonWithTitle:@"Delete"];
    [alertView addButtonWithTitle:@"Cancel"];
    [alertView show];
    
}

// Prepare for segue - pass data via segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CityViewController *cityController = segue.destinationViewController; // instantiate Controller and attach to desitination view controller segue

    NSIndexPath *ip = [self.tableView indexPathForSelectedRow]; // grabs index path that was touched

    cityController.thisCity = [self.cities objectAtIndex:ip.row]; // grab creature using row number as index, and pass to mcreature forward

}

@end
