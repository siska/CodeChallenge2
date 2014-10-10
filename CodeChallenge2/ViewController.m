//
//  ViewController.m
//  CodeChallenge2
//
//  Created by S on 10/10/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSIndexPath *indexPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //stopped on step 4 - trying to create a method and delegate for city to send the site to the WebViewController

    City *sanfran = [[City alloc] init];
    sanfran.name = @"San Francisco";
    sanfran.state = @"California";
    sanfran.site = @"http://en.wikipedia.org/wiki/San_Francisco";
    City *boston = [[City alloc] init];
    boston.name = @"Boston";
    boston.state = @"Massachusetts";
    boston.site = @"http://en.wikipedia.org/wiki/Boston";
    City *nashville = [[City alloc] init];
    nashville.name = @"Nashville";
    nashville.state = @"Tennessee";
    nashville.site = @"http://en.wikipedia.org/wiki/Nashville,_Tennessee";
    City *neworleans = [[City alloc] init];
    neworleans.name = @"New Orleans";
    neworleans.state = @"Louisiana";
    neworleans.site = @"http://en.wikipedia.org/wiki/New_Orleans";

    self.cities = [[NSMutableArray alloc] initWithObjects:sanfran, boston, nashville, neworleans, nil];

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{
    if ([self.tableView isEditing])
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onEditButtonPressed:)];
        [self.tableView setEditing: NO animated: YES];

    }
    else if (![self.tableView isEditing])
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onEditButtonPressed:)];
        [self.tableView setEditing:YES animated:YES];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {

    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    City *cities = [self.cities objectAtIndex:indexPath.row];
    CityViewController *cityViewController = [segue destinationViewController];

    cityViewController.citySeg = cities;
}


//trying to use to delete
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm" message:@"Are you sure you want to delete?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete", nil];
        [alert show];

        self.indexPath = indexPath;
    }
}

#pragma mark - UIAlertView Delegate
// also trying to use to initialize delete
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [alertView cancelButtonIndex])
    {
        [self.cities removeObjectAtIndex:self.indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[self.indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        self.indexPath = nil;
    }
}

#pragma mark - TableView DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID" forIndexPath:indexPath];
    City *city = [self.cities objectAtIndex:indexPath.row];
    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}
@end
