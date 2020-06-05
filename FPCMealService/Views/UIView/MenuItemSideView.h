//
//  MenuItemSideView.h
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

// Class Extensions

// Definitions


@interface MenuItemSideView : UIView


#pragma mark - Custom Delegates


#pragma mark - Initialization
- (instancetype)initWithTitle:(NSString *)title;

#pragma mark - Properties
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UILabel *labelTitle;

#pragma mark - Public API



@end
