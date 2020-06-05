//
//  PayNowTableViewCell.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/20/20.
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


@interface PayNowTableViewCell : UITableViewCell


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - Properties
@property (strong, nonatomic) MenuItem *item;

#pragma mark - Public API
- (void)updateWithItem:(MenuItem *)item;


@end
