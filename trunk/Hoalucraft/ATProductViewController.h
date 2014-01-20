//
//  ATProductViewController.h
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/16/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATProduct.h"
#import "ATHoalucraft.h"
#import "JMImageCache.h"

@interface ATProductViewController : UIViewController
@property (strong, nonatomic) ATProduct *product;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *productRatingStar;
- (IBAction)backAction:(id)sender;

@end
