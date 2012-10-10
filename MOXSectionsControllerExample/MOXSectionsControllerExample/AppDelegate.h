//
//  AppDelegate.h
//  MOXSectionsControllerExample
//
//  Created by Benoit Lefebvre on 2012-10-08.
//  Copyright (c) 2012 Benoit Lefebvre. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MOXSectionsController.h"

@class TableViewController1;
@class TableViewController2;
@class ViewController1;

@interface AppDelegate : UIResponder <UIApplicationDelegate, MOXSectionsControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UISplitViewController *splitViewController;

@property (strong, nonatomic) MOXSectionsController *masterSectionsController;
@property (strong, nonatomic) TableViewController2 *tblView1;
@property (strong, nonatomic) TableViewController1 *tblView2;
@property (strong, nonatomic) ViewController1 *view3;
@property (strong, nonatomic) TableViewController1 *tblView4;
@property (strong, nonatomic) TableViewController1 *tblView5;

@end
