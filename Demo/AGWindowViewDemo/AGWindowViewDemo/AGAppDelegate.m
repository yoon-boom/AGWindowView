//
//  AGAppDelegate.m
//  AGWindowViewDemo
//
//  Created by Håvard Fossli on 11.04.13.
//  Copyright (c) 2013 Håvard Fossli. All rights reserved.
//

#import "AGAppDelegate.h"
#import "AGFirstViewController.h"
#import "AGSecondViewController.h"

@interface AGAppDelegate () <UITabBarControllerDelegate>

@end

@implementation AGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1, *viewController2;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewController1 = [[AGFirstViewController alloc] initWithNibName:@"AGFirstViewController_iPhone" bundle:nil];
        viewController2 = [[AGSecondViewController alloc] initWithNibName:@"AGSecondViewController_iPhone" bundle:nil];
    } else {
        viewController1 = [[AGFirstViewController alloc] initWithNibName:@"AGFirstViewController_iPad" bundle:nil];
        viewController2 = [[AGSecondViewController alloc] initWithNibName:@"AGSecondViewController_iPad" bundle:nil];
    }
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[viewController1, viewController2];
    self.tabBarController.delegate = self;
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (NSUInteger)tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)tabBarController
{
    return [self.tabBarController.selectedViewController supportedInterfaceOrientations];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
