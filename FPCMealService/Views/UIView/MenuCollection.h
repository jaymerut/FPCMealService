//
//  MenuCollection.h
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

// Classes - Views

// Classes - View Controllers

// Classes - Controllers
#import "MenuSectionController.h"

// Class Extensions

// Definitions


@interface MenuCollection : UIView


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - Properties
@property (weak, nonatomic) id<MenuSectionControllerDelegate> viewController;

@property (strong, nonatomic) NSArray *menuItems;


#pragma mark - Public API



@end
