//
//  BaseViewController.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/8/20.
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


@interface BaseViewController : UIViewController


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - Properties
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *viewHeader;
@property (strong, nonatomic) UIView *viewFooter;

@property (strong, nonatomic) UILabel *labelHeader;
@property (strong, nonatomic) UILabel *labelTotal;

@property (strong, nonatomic) NSNumber *total;
@property (strong, nonatomic) NSArray *menuItems;

#pragma mark - Public API



@end
