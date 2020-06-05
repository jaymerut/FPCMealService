//
//  MockableDayMenu.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 6/3/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import <Foundation/Foundation.h>

// Delegates

// Utilities

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface MockableDayMenu : NSObject


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - IBOutlets


#pragma mark - Properties
@property (strong, nonatomic) NSString *day;
@property (strong, nonatomic) NSMutableArray *menuItems;
@property (strong, nonatomic) NSNumber *isCurrentDay;


#pragma mark - Public API



@end
