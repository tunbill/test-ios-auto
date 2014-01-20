//
//  ATProductViewController.m
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/16/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import "ATProductViewController.h"

@interface ATProductViewController ()

@end

@implementation ATProductViewController

@synthesize product, productName, productPrice, productRatingStar, productImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Go to here!");
    
    if( product != nil) {
        [[self productName] setText: [product name]];
        
        
        NSURL * url = [NSURL URLWithString: [NSString stringWithFormat:@"%@/images/products/%@", IMAGE_PATH, [product imageURL]]];
        
        [[self productImage] setImageWithURL:url key: nil placeholder:[UIImage imageNamed:@"arrow.png"] completionBlock:nil failureBlock:nil];
        
        [[self productPrice] setText: [NSString stringWithFormat:@"%.2f", [product price]]];
        
        switch ([product voteStar]) {
            case 1:
                [[self productRatingStar] setImage:[UIImage imageNamed:@"1Star.png"]];
                break;
            case 2:
                [[self productRatingStar] setImage:[UIImage imageNamed:@"2Stars.png"]];
                break;
            case 3:
                [[self productRatingStar] setImage:[UIImage imageNamed:@"3Stars.png"]];
                break;
            case 4:
                [[self productRatingStar] setImage:[UIImage imageNamed:@"4Stars.png"]];
                break;
            case 5:
                [[self productRatingStar] setImage:[UIImage imageNamed:@"5Stars.png"]];
                break;
                
            default:
                break;
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
