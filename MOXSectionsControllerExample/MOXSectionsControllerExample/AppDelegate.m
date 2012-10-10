//
//  AppDelegate.m
//  MOXSectionsControllerExample
//
//  Created by Benoit Lefebvre on 2012-10-08.
//  Copyright (c) 2012 Benoit Lefebvre. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "MOXSectionsController.h"

#import "TableViewController1.h"
#import "TableViewController2.h"
#import "ViewController1.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.tblView1 = [[TableViewController2 alloc] initWithStyle:UITableViewStyleGrouped];
    self.tblView2 = [[TableViewController1 alloc] initWithStyle:UITableViewStylePlain];
    self.view3 = [[ViewController1 alloc] initWithNibName:nil bundle:nil];
    self.tblView4 = [[TableViewController1 alloc] initWithStyle:UITableViewStylePlain];
    self.tblView5 = [[TableViewController1 alloc] initWithStyle:UITableViewStylePlain];
    
    self.masterSectionsController = [[MOXSectionsController alloc] initWithNibName:nil bundle:nil];
    [self.masterSectionsController setDelegate:self];

    UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:self.masterSectionsController];

    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];

    self.splitViewController = [[UISplitViewController alloc] init];
    self.splitViewController.delegate = detailViewController;
    self.splitViewController.viewControllers = @[masterNavigationController, detailNavigationController];
    self.window.rootViewController = self.splitViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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

#pragma mark - MOXSectionsControllerDelegate Methods

- (NSInteger)numberOfSectionsInSectionsController:(MOXSectionsController *)sectionsController
{
    return 5;
}

- (UIView *)sectionsController:(MOXSectionsController *)sectionsController viewForSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return self.tblView1.view;
            break;
            
        case 1:
            return self.tblView2.view;
            break;
            
        case 2:
            return self.view3.view;
            break;
            
        case 3:
            return self.tblView4.view;
            break;
            
        case 4:
            return self.tblView5.view;
            break;
            
        default:
            break;
    }
    return nil;
}

- (UIView *)sectionsController:(MOXSectionsController *)sectionsController viewForHeaderInSection:(NSInteger)section
{
    UIView *viewSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [viewSection setBackgroundColor:[UIColor lightGrayColor]];
    
    UILabel *lblSectionHeader = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
    [lblSectionHeader setBackgroundColor:[UIColor clearColor]];
    [lblSectionHeader setText:[NSString stringWithFormat:@"Section %i", section]];
    [lblSectionHeader setTextColor:[UIColor darkGrayColor]];
    
    [viewSection addSubview:lblSectionHeader];
    
    return viewSection;
}

- (UIView *)sectionsController:(MOXSectionsController *)sectionsController viewForSelectedHeaderInSection:(NSInteger)section
{
    UIView *viewSection = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [viewSection setBackgroundColor:[UIColor blueColor]];
    
    UILabel *lblSectionHeader = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
    [lblSectionHeader setBackgroundColor:[UIColor clearColor]];
    [lblSectionHeader setText:[NSString stringWithFormat:@"Section %i", section]];
    [lblSectionHeader setTextColor:[UIColor whiteColor]];
    
    [viewSection addSubview:lblSectionHeader];
    
    return viewSection;
}

@end
