//
//  ATProductListViewController.m
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/14/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import "ATProductListViewController.h"

@interface ATProductListViewController ()
@property (nonatomic, readwrite) bool isLoading;
@end

@implementation ATProductListViewController {
}

@synthesize model;
@synthesize isLoading;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setIsLoading:false];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) setCategory: (ATCategory *)category {
    if( [self model] != nil) {
        [[self model] setCategory:category];
    } else {
        self.model = [[ATProductListModel alloc]initWithATCategory:category];
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return model != nil && [model products] != nil ? [[model products] count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ProductPrototypeCell";
    ATProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ATProduct * product = [model getProductAt:[indexPath row]];
    if( product != nil) {
        [[cell name] setText:[product name]];
        [[cell price] setText: [NSString stringWithFormat:@"%.2f$", [product price]]];
        [[cell detail] setImage: [UIImage imageNamed:@"arrow.png"]];
        
        
        NSURL * url = [NSURL URLWithString: [NSString stringWithFormat:@"%@/images/products/%@", IMAGE_PATH, [product imageURL]]];
     
        [[cell image] setImageWithURL:url key: nil placeholder:[UIImage imageNamed:@"arrow.png"] completionBlock:nil failureBlock:nil];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ATProduct * product = [[self model] getProductAt: [indexPath row]];
    if( product != nil) {
          UINavigationController *navigationController = [[self storyboard] instantiateViewControllerWithIdentifier:@"ProductNavigatorViewController"];
        if( navigationController != nil) {
            [navigationController.viewControllers[0] setProduct:product];
            [self presentViewController:navigationController animated:YES completion:nil];
        }
    }
}

/*
-(void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"scrollViewWillEndDragging");
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Last cell is viewing.... %d", [indexPath row]);
}
 */

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
    NSLog(@"Rows %d", [indexPath row]);
    if( [model count] > ( [model products] != nil ? [[model products] count] : 0)) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 20)];
        [label setText:@"Loading...."];
        UIView *footerView = [[UIView alloc] initWithFrame: CGRectMake(0, 10, 50, 20)];
        [footerView setBackgroundColor:[UIColor orangeColor]];
        [footerView addSubview: label];
        self.productTableview.tableFooterView = footerView;
        NSLog(@"Is loading: %d", [self isLoading]);
        
        if( [indexPath row] == [[self productTableview] numberOfRowsInSection:0]-1) {
            if( isLoading == false) {
                isLoading = true;
                //[[self model] next];
                //[[self productTableview] reloadData];
                isLoading = false;
            }
        }
    } else {
        self.productTableview.tableFooterView = nil;
    }
     */
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
    if( [model count] > ( [model products] != nil ? [[model products] count] : 0)) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 20)];
        [label setText:@"Loading...."];
        UIView *footerView = [[UIView alloc] initWithFrame: CGRectMake(0, 10, 50, 20)];
        [footerView setBackgroundColor:[UIColor orangeColor]];
        [footerView addSubview: label];
        self.productTableview.tableFooterView = footerView;
        
        [[self model] next];
        [[self productTableview] reloadData];
        
        NSLog(@"Size of data: %d", [[[self model] products] count]);
    } else {
        self.productTableview.tableFooterView = nil;
    }

}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
