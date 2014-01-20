//
//  ATAppDelegate.m
//  Hoalucraft
//
//  Created by Ngo Van Chi on 1/11/14.
//  Copyright (c) 2014 Autosoft Vietnam. All rights reserved.
//

#import "ATAppDelegate.h"

@implementation ATAppDelegate

@synthesize window, navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*
    [[self window] makeKeyAndVisible];
    
    ATCategoryViewController * categoryController = [[self storyboard] instantiateViewControllerWithIdentifier:@"ATCategoryViewController"];
    
    //ATCategoryViewController *categoryController = [[ATCategoryViewController alloc] initWithNibName:@"ATCategoryViewController" bundle:nil];
    
    [[categoryController navigationItem] setTitle:@"Category view"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:categoryController];
    
    [self setNavController:nav];
    
    [window addSubview:[navController view]];
     */
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{

}
@end
