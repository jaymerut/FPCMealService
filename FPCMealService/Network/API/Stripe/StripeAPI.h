//
//  StripeAPI.h
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
#import "BaseAPI.h"

// Classes - Models
#import "StripePaymentIntent.h"

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface StripeAPI : BaseAPI


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - IBOutlets


#pragma mark - Properties


#pragma mark - Public API
- (void)getPaymentIntent:(NSString *)amount success:(void (^)(StripePaymentIntent *paymentIntent))success failure:(void (^)(NSError *error))failure;
- (void)confirmPayment:(NSString *)paymentID paymentMethod:(NSString *)paymentMethod success:(void (^)(StripePaymentIntent *paymentIntent))success failure:(void (^)(NSError *error))failure;

@end
