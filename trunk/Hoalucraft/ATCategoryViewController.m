//
//  ATCategoryViewController.m
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/12/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import "ATCategoryViewController.h"

@interface ATCategoryViewController ()

@end

@implementation ATCategoryViewController
@synthesize model;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.model = [[ATCategoryModel alloc] init];
    [[self model] getAll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [model count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ATCategory * category = [[self model] getCategoryAt:[indexPath row]];
    [[cell textLabel] setText: [category name]];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ATCategory * category = [model getCategoryAt:[indexPath row]];
    if( category != nil) {
        
        UINavigationController *navigationController = [[self storyboard] instantiateViewControllerWithIdentifier:@"ProductListNavigatorViewController"];
        
        [navigationController.viewControllers[0] setCategory:category];
        
        [self presentViewController:navigationController animated:YES completion:nil];
    }
}
@end
