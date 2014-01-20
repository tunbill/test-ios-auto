//
//  ATCategoryViewController.h
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/12/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATCategoryModel.h"
#import "ATCategory.h"
#import "ATProductListViewController.h"

@interface ATCategoryViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic)ATCategoryModel *model;

@end
