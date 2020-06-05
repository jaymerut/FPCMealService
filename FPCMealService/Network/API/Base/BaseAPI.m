//
//  BaseAPI.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/14/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "BaseAPI.h"

// Delegates

// Utilities

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions
#define kAPIAuthenticationString @"sk_test_bd4WVVNxo04KxdIPhmchzSHi00Dphjvu6H"


@interface BaseAPI ()



@end



@implementation BaseAPI


#pragma mark - Initialization
- (void)customInitBaseAPI {
    
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitBaseAPI];
        
    }
    return self;
}



#pragma mark - IBOutlets



#pragma mark - Properties



#pragma mark - Private API
- (void)request:(NSURLRequest *)request success:(void (^)(NSData *responseData))success failure:(void (^)(NSError *error))failure {
    /*
    NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (response != nil) {
            NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
            if (success != nil && statusCode == 200) { success(data); }
        } else {
            if (failure != nil) { failure(error); }
        }
        
    }];
    
    [task resume];
     */
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (response != nil) {
            NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
            //if (success != nil && statusCode == 200) { success(data); }
            success(data);
        } else {
            if (failure != nil) { failure(error); }
        }
    }];
    [task resume];
}


#pragma mark - Public API
- (void)request:(NSString *)url method:(NSString *)method parameters:(NSDictionary *)parameters success:(void (^)(id object))success failure:(void (^)(NSError *error))failure {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    request.HTTPMethod = method;
    
    if([method.uppercaseString isEqual: @"POST"]) {
        [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        NSLog([NSString stringWithFormat:@"Bearer %@", kAPIAuthenticationString]);
        [request addValue:[NSString stringWithFormat:@"Bearer %@", kAPIAuthenticationString] forHTTPHeaderField:@"Authorization"];
        
        NSString *post;
        for (NSString *key in parameters) {
            if (post.length == 0) {
                post = [NSString stringWithFormat:@"%@=%@", key, [parameters objectForKey:key]];
            } else {
                post = [NSString stringWithFormat:@"%@&%@=%@", post, key, [parameters objectForKey:key]];
            }
        }
        [request setHTTPBody:[post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES]];
    }
    
    if([method.uppercaseString isEqual: @"GET"]) {
        NSString *query = nil;
        if (parameters != nil) {
            for (NSString *key in parameters) {
                if (query != nil) {
                    query = [NSString stringWithFormat:@"%@&%@", query, key];
                } else {
                    query = [NSString stringWithFormat:@"%@", key];
                }
            }
            
            url = [NSString stringWithFormat:@"%@?%@", url, query];
        }
    }
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLFragmentAllowedCharacterSet];
    request.URL = [NSURL URLWithString:url];
    
    [self request:request success:^(NSData *responseData) {
        NSError *error = nil;
        id json = [NSJSONSerialization JSONObjectWithData:responseData options:(NSJSONReadingAllowFragments) error:&error];
        if (error == nil) {
            if(success != nil) { success(json); }
        } else {
            if (failure != nil) { failure([NSError errorWithDomain:@"com.Sandhills.*" code:-1 userInfo:@{NSLocalizedDescriptionKey:@"There was an error deserializing."}]); }
        }
    } failure:^(NSError *error) {
        if (failure != nil) { failure(error); }
    }];
}


#pragma mark - Delegate Methods



@end
