//
//  MOXSectionsController.h
//  MOXSectionsControllerExample
//
//  Created by Benoit Lefebvre on 2012-10-08.
//  Copyright (c) 2012 Benoit Lefebvre. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MOXSectionsController;

@protocol MOXSectionsControllerDelegate <NSObject>
@required
- (NSInteger)numberOfSectionsInSectionsController:(MOXSectionsController *)sectionsController;
- (UIView *)sectionsController:(MOXSectionsController *)sectionsController viewForSection:(NSInteger)section;
- (UIView *)sectionsController:(MOXSectionsController *)sectionsController viewForHeaderInSection:(NSInteger)section;
- (UIView *)sectionsController:(MOXSectionsController *)sectionsController viewForSelectedHeaderInSection:(NSInteger)section;
@optional
@end

@interface MOXSectionsController : UIViewController

@property (strong, nonatomic) id<MOXSectionsControllerDelegate> delegate;
@property (retain, nonatomic) NSNumber *numSelectedSection;
@property (retain, nonatomic) NSMutableArray *arraySectionsHeaders;

@end
