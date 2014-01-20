//
//  ATProductTableViewCell.h
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/16/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATProductTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *detail;

@end
