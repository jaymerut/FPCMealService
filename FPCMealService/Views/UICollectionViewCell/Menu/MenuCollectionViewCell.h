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

// Classes - Controllers
#import "MenuSectionController.h"

// Class Extensions

// Definitions


@interface MenuCollectionViewCell : UICollectionViewCell


#pragma mark - Custom Delegates
@property (weak, nonatomic) id <MenuSectionControllerDelegate> delegate;

#pragma mark - Initialization


#pragma mark - Properties
@property (strong, nonatomic) MenuItem *menuItem;


#pragma mark - Public API
- (UILabel *)labelName;
- (UILabel *)labelPrice;
- (UILabel *)labelDescription;
- (UILabel *)labelQuantity;
- (UILabel *)labelSideTitle;
- (UILabel *)labelSides;

- (void)update;

@end
