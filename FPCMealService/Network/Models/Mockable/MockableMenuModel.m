//
//  MockableMenuModel.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 6/3/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "MockableMenuModel.h"

// Delegates

// Utilities

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface MockableMenuModel ()



@end



@implementation MockableMenuModel


#pragma mark - Initialization
- (void)customInitMockableMenuModel {
    
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitMockableMenuModel];
        
    }
    return self;
}



#pragma mark - IBOutlets



#pragma mark - Properties
- (NSMutableArray *)menuItemList {
    if (!_menuItemList) {
        _menuItemList = [NSMutableArray new];
    }
    return _menuItemList;
}


#pragma mark - Private API



#pragma mark - Public API



#pragma mark - Delegate Methods



@end
