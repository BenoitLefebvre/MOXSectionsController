//
//  DetailViewController.h
//  MOXSectionsControllerExample
//
//  Created by Benoit Lefebvre on 2012-10-08.
//  Copyright (c) 2012 Benoit Lefebvre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
