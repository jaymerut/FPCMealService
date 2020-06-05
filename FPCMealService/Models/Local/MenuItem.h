//
//  MenuItem.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
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


@interface MenuItem : NSObject


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - IBOutlets


#pragma mark - Properties
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSNumber *priceValue;
@property (strong, nonatomic) NSString *itemDescription;
@property (strong, nonatomic) NSArray *sides;
@property (strong, nonatomic) NSNumber *quantity;
@property (nonatomic) BOOL showButton;


#pragma mark - Public API



@end
