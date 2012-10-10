//
//  ViewController1.m
//  MOXSectionsControllerExample
//
//  Created by Benoit Lefebvre on 2012-10-09.
//  Copyright (c) 2012 Benoit Lefebvre. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UILabel *lblTest = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 35)];
    [lblTest setText:@"This is a test"];
    [self.view addSubview:lblTest];
    
    UITextField *txtFieldTest = [[UITextField alloc] initWithFrame:CGRectMake(10, 55, 300, 35)];
    [txtFieldTest setText:@"weeee"];
    [self.view addSubview:txtFieldTest];
    
    [self.view setBackgroundColor:[UIColor viewFlipsideBackgroundColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
