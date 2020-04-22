//
//  MenuSectionController.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import <IGListKit/IGListKit.h>

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

@protocol MenuSectionControllerDelegate <NSObject>

- (void)didAddOrder:(MenuItem *)item;
- (void)didRemoveOrder:(MenuItem *)item;

@end

@interface MenuSectionController : IGListSectionController


#pragma mark - Custom Delegates
@property (weak, nonatomic) id <MenuSectionControllerDelegate> delegate;


#pragma mark - Initialization
- (instancetype)initWithDelegate:(id <MenuSectionControllerDelegate>)delegate;

+ (instancetype)controllerWithDelegate:(id <MenuSectionControllerDelegate>)delegate;

#pragma mark - IBOutlets


#pragma mark - Properties
@property (strong, nonatomic) NSArray *menuItems;


#pragma mark - Public API



@end
