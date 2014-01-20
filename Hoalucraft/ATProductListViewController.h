//
//  ATProductListViewController.h
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/14/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATHoalucraft.h"
#import "ATCategory.h"
#import "ATProductListModel.h"
#import "ATCategory.h"
#import "ATProductTableViewCell.h"

#import "JMImageCache.h"
#include "ATProductViewController.h"

@interface ATProductListViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>
- (IBAction)backAction:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *productTableview;

@property (strong, nonatomic)ATProductListModel *model;
@property (nonatomic, readonly) bool isLoading;

-(void) setCategory: (ATCategory *)category;
@end
