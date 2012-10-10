//
//  MOXSectionsController.m
//  MOXSectionsControllerExample
//
//  Created by Benoit Lefebvre on 2012-10-08.
//  Copyright (c) 2012 Benoit Lefebvre. All rights reserved.
//

#import "MOXSectionsController.h"

@interface MOXSectionsController ()

@end

@implementation MOXSectionsController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.numSelectedSection = [[NSNumber alloc] initWithInt:0];
        self.arraySectionsHeaders = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)layoutSubviews
{
    [self.arraySectionsHeaders removeAllObjects];
    
    for (UIView *viewToRemove in [self.view subviews]) {
        [viewToRemove removeFromSuperview];
    }
    
    [self setWantsFullScreenLayout:true];
    
    int intY = 0;
    int intSectionsCount = [self _getNumberOfSections];
    if (intSectionsCount == 0) {
        return;
    }
    
    int totalHeaderHeight = 0;
    for (int i = 0; i < intSectionsCount; i++) {
        UIView *viewSectionHeader = [self _getHeaderViewForSection:i];
        if (viewSectionHeader == nil) {
            break;
        }
        totalHeaderHeight += viewSectionHeader.frame.size.height;
    }
    
    int intSubviewHeight = (int)(self.view.bounds.size.height - totalHeaderHeight);
    
    for (int i = 0; i < intSectionsCount; i++) {
        UIView *viewSectionHeader = [self _getHeaderViewForSection:i];
        UIView *viewSection = [self _getViewForSection:i];
        
        if ((viewSectionHeader == nil) || (viewSection == nil)) {
            break;
        }
        
        CGRect rectSectionHeader = [viewSectionHeader frame];
        UIButton *btnSectionHeader = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnSectionHeader setFrame:CGRectMake(0, intY, self.view.frame.size.width, rectSectionHeader.size.height)];
        [btnSectionHeader addTarget:self action:@selector(sectionClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btnSectionHeader];
        [self.arraySectionsHeaders addObject:btnSectionHeader];
        
        intY += rectSectionHeader.size.height;
        
        [viewSection setFrame:CGRectMake(0, intY, self.view.frame.size.width, intSubviewHeight)];
        [self.view addSubview:viewSection];
        
        if ([self.numSelectedSection isEqualToNumber:[NSNumber numberWithInt:i]]) {
            intY += intSubviewHeight;
        }
    }
    [self goToSection:self.numSelectedSection animate:true];
}

- (void)sectionClicked:(id)sender
{
    for (int i = 0; i < [self.arraySectionsHeaders count]; i++) {
        if (sender == [self.arraySectionsHeaders objectAtIndex:i]) {
            if (![self.numSelectedSection isEqualToNumber:[NSNumber numberWithInt:i]]) {
                [self goToSection:[NSNumber numberWithInt:i] animate:true];
            }
        }
    }
}

- (void)goToSection:(NSNumber *)section animate:(BOOL)animate
{
    self.numSelectedSection = section;
    
    if (animate) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5f];
    }
    
    int intY = 0;
    int intSectionsCount = [self _getNumberOfSections];
    if (intSectionsCount == 0) {
        return;
    }
    
    int totalHeaderHeight = 0;
    for (int i = 0; i < intSectionsCount; i++) {
        UIView *viewSectionHeader = [self _getHeaderViewForSection:i];
        if (viewSectionHeader == nil) {
            break;
        }
        totalHeaderHeight += viewSectionHeader.frame.size.height;
    }
    
    int intSubviewHeight = (int)(self.view.bounds.size.height - totalHeaderHeight);

    for (int i = 0; i < intSectionsCount; i++) {
        UIView *viewSectionHeader = [self.arraySectionsHeaders objectAtIndex:i];
        UIView *viewSection = [self _getViewForSection:i];
        
        if ((viewSectionHeader == nil) || (viewSection == nil)) {
            break;
        }
        
        CGRect rectSectionHeader = [viewSectionHeader frame];
        [viewSectionHeader setFrame:CGRectMake(0, intY, self.view.frame.size.width, rectSectionHeader.size.height)];
        intY += rectSectionHeader.size.height;
        
        [viewSection setFrame:CGRectMake(0, intY, self.view.frame.size.width, intSubviewHeight)];
        
        for (UIView *viewToRemove in [[self.arraySectionsHeaders objectAtIndex:i] subviews]) {
            [viewToRemove removeFromSuperview];
        }
        
        UIView *btnView = [[UIView alloc] init];
        if ([self.numSelectedSection isEqualToNumber:[NSNumber numberWithInt:i]]) {
            intY += intSubviewHeight;
            btnView = [self _getHeaderViewForSelectedSection:i];
        } else {
            btnView = [self _getHeaderViewForSection:i];
        }
        [btnView setUserInteractionEnabled:false];
        [btnView setFrame:CGRectMake(0, 0, self.view.frame.size.width, rectSectionHeader.size.height)];
        [viewSectionHeader addSubview:btnView];
        
    }
    if (animate) {
        [UIView commitAnimations];
    }
}

- (NSInteger)_getNumberOfSections
{
    if ([delegate conformsToProtocol:@protocol(MOXSectionsControllerDelegate)] && [delegate respondsToSelector:@selector(numberOfSectionsInSectionsController:)]) {
        return [delegate numberOfSectionsInSectionsController:self];
    } else {
        return 0;
    }
}

- (UIView *)_getHeaderViewForSection:(NSInteger)section
{
    if ([delegate conformsToProtocol:@protocol(MOXSectionsControllerDelegate)] && [delegate respondsToSelector:@selector(sectionsController:viewForHeaderInSection:)]) {
        return [delegate sectionsController:self viewForHeaderInSection:section];
    } else {
        return nil;
    }
}

- (UIView *)_getHeaderViewForSelectedSection:(NSInteger)section
{
    if ([delegate conformsToProtocol:@protocol(MOXSectionsControllerDelegate)] && [delegate respondsToSelector:@selector(sectionsController:viewForSelectedHeaderInSection:)]) {
        return [delegate sectionsController:self viewForSelectedHeaderInSection:section];
    } else {
        return nil;
    }
}

- (UIView *)_getViewForSection:(NSInteger)section
{
    if ([delegate conformsToProtocol:@protocol(MOXSectionsControllerDelegate)] && [delegate respondsToSelector:@selector(sectionsController:viewForSection:)]) {
        return [delegate sectionsController:self viewForSection:section];
    } else {
        return nil;
    }
}

- (BOOL)shouldAutorotate
{
    return true;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)viewWillLayoutSubviews
{
    [self layoutSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self layoutSubviews];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
