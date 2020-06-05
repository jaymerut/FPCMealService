//
//  StripeAPI.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/14/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "StripeAPI.h"

// Delegates

// Utilities

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface StripeAPI ()

@property (strong, nonatomic) NSString *baseURL;

@end



@implementation StripeAPI


#pragma mark - Initialization
- (void)customInitStripeAPI {
    
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitStripeAPI];
        
    }
    return self;
}



#pragma mark - IBOutlets



#pragma mark - Properties
- (NSString *)baseURL {
    if (!_baseURL) {
        _baseURL = @"https://api.stripe.com/v1";
    }
    return _baseURL;
}


#pragma mark - Private API
- (StripePaymentIntent *)convertJsonToPaymentIntent:(NSDictionary *)json {
    StripePaymentIntent *result = [StripePaymentIntent new];
    
    result.paymentID = [json objectForKey:@"id"];
    result.amountCapturable = [json objectForKey:@"amount_capturable"];
    result.amountReceived = [json objectForKey:@"amount_received"];
    result.currency = [json objectForKey:@"currency"];
    result.clientSecret = [json objectForKey:@"client_secret"];
    result.status = [json objectForKey:@"status"];
    result.amount = [json objectForKey:@"amount"];
    
    return result;
}


#pragma mark - Public API
- (void)getPaymentIntent:(NSString *)amount success:(void (^)(StripePaymentIntent *paymentIntent))success failure:(void (^)(NSError *error))failure {

    NSString *method = @"POST";
    NSString *url = [NSString stringWithFormat:@"%@/payment_intents", self.baseURL];
    NSDictionary *parameters = @{
        @"amount" : amount,
        @"currency" : @"usd",
        @"payment_method_types[]" : @"card"
    };
    
    [self request:url method:method parameters:parameters success:^(id object) {
        if (success != nil) {
            success([self convertJsonToPaymentIntent:object]);
        }
    } failure:failure];
}

- (void)confirmPayment:(NSString *)paymentID paymentMethod:(NSString *)paymentMethod success:(void (^)(StripePaymentIntent *paymentIntent))success failure:(void (^)(NSError *error))failure {
    
    NSString *method = @"POST";
    NSString *url = [NSString stringWithFormat:@"%@/payment_intents/%@/confirm", self.baseURL, paymentID];
    NSDictionary *parameters = @{
        @"payment_method" : paymentMethod
    };
    
    [self request:url method:method parameters:parameters success:^(id object) {
        if (success != nil) {
            success([self convertJsonToPaymentIntent:object]);
        }
    } failure:failure];
}

#pragma mark - Delegate Methods



@end
