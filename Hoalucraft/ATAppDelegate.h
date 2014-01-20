//
//  ATAppDelegate.h
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/11/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATCategoryViewController.h"

@interface ATAppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController * navController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@end
