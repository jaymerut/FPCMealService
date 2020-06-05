//
//  MockableAPI.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 6/2/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "BaseAPI.h"

// Delegates

// Utilities

// Globals

// Classes

// Classes - Models
#import "MockableMenuModel.h"

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface MockableAPI : BaseAPI


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - IBOutlets


#pragma mark - Properties


#pragma mark - Public API
- (void)getMenuItems:(void (^)(MockableMenuModel *menuModel))success failure:(void (^)(NSError *error))failure;


@end
