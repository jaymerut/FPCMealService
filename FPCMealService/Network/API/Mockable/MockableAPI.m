//
//  MockableAPI.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 6/2/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "MockableAPI.h"

// Delegates

// Utilities

// Globals

// Classes

// Classes - Models
#import "MenuItem.h"
#import "MockableDayMenu.h"

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface MockableAPI ()

@property (strong, nonatomic) NSString *baseURL;

@end



@implementation MockableAPI


#pragma mark - Initialization
- (void)customInitMockableAPI {
    
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitMockableAPI];
        
    }
    return self;
}



#pragma mark - IBOutlets



#pragma mark - Properties
- (NSString *)baseURL {
    if (!_baseURL) {
        _baseURL = @"http://demo5081936.mockable.io/";
    }
    return _baseURL;
}


#pragma mark - Private API
- (MockableMenuModel *)convertJsonToMockableMenuModel:(NSDictionary *)json {
    MockableMenuModel *result = [MockableMenuModel new];
    NSArray *menuItemList = [NSArray new];
    
    menuItemList = [json objectForKey:@"MenuItemList"];
    for (NSDictionary *element in menuItemList) {
        [result.menuItemList addObject:[self convertJsonToMockableDayMenu:element]];
    }
    
    return result;
}
- (MockableDayMenu *)convertJsonToMockableDayMenu:(NSDictionary *)json {
    MockableDayMenu *result = [MockableDayMenu new];
    NSArray *menuItems = [NSArray new];
    
    result.day = [json objectForKey:@"Day"];
    menuItems = [json objectForKey:@"MenuItems"];
    for (NSDictionary *element in menuItems) {
        [result.menuItems addObject:[self convertJsonToMenuItem:element]];
    }
    
    return result;
}
- (MenuItem *)convertJsonToMenuItem:(NSDictionary *)json {
    MenuItem *result = [MenuItem new];
    
    result.name = [json objectForKey:@"Name"];
    result.price = [json objectForKey:@"Price"];
    result.priceValue = [json objectForKey:@"PriceValue"];
    result.itemDescription = [json objectForKey:@"ItemDescription"];
    result.sides = [json objectForKey:@"Sides"];
    result.quantity = @0;
    
    return result;
}


#pragma mark - Public API
- (void)getMenuItems:(void (^)(MockableMenuModel *menuModel))success failure:(void (^)(NSError *error))failure {
    
    NSString *method = @"GET";
    NSString *url = [NSString stringWithFormat:@"%@/FPCMealService/Menu", self.baseURL];
    NSDictionary *parameters = @{};
    
    [self request:url method:method parameters:parameters success:^(id object) {
        if (success != nil) {
            success([self convertJsonToMockableMenuModel:object]);
        }
    } failure:failure];
}


#pragma mark - Delegate Methods



@end
