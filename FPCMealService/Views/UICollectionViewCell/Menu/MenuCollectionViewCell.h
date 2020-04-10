//
//  MenuCollectionViewCell.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import <UIKit/UIKit.h>

// Delegates

// Utilities

// Globals

// Classes

// Classes - Models
#import "MenuItem.h"

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface MenuCollectionViewCell : UICollectionViewCell


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - Properties
@property (strong, nonatomic) MenuItem *menuItem;


#pragma mark - Public API
- (void)update;
- (void)updateWithMenuItem:(MenuItem *)menuItem;

@end
