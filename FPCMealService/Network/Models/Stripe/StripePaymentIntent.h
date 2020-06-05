//
//  StripePaymentIntent.h
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


@interface StripePaymentIntent : NSObject


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - IBOutlets


#pragma mark - Properties
@property (strong, nonatomic) NSString *paymentID;
@property (strong, nonatomic) NSNumber *amountCapturable;
@property (strong, nonatomic) NSNumber *amountReceived;
@property (strong, nonatomic) NSString *currency;
@property (strong, nonatomic) NSString *clientSecret;
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSNumber *amount;

#pragma mark - Public API



@end
