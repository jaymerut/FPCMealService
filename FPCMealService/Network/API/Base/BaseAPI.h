//
//  BaseAPI.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/14/20.
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


@interface BaseAPI : NSObject


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - IBOutlets


#pragma mark - Properties


#pragma mark - Public API
- (void)request:(NSString *)url method:(NSString *)method parameters:(NSDictionary *)parameters success:(void (^)(id object))success failure:(void (^)(NSError *error))failure;


@end
