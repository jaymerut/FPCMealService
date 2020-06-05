//
//  MockableDayMenu.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 6/3/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "MockableDayMenu.h"

// Delegates

// Utilities

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface MockableDayMenu ()



@end



@implementation MockableDayMenu


#pragma mark - Initialization
- (void)customInitMockableDayMenu {
    
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitMockableDayMenu];
        
    }
    return self;
}



#pragma mark - IBOutlets



#pragma mark - Properties
- (NSMutableArray *)menuItems {
    if (!_menuItems) {
        _menuItems = [NSMutableArray new];
    }
    return _menuItems;
}


#pragma mark - Private API



#pragma mark - Public API



#pragma mark - Delegate Methods



@end
