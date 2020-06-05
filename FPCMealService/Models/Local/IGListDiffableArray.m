//
//  IGListDiffableArray.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "IGListDiffableArray.h"

// Delegates

// Utilities

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface IGListDiffableArray ()

@property (strong, nonatomic) NSString *identifier;

@end



@implementation IGListDiffableArray



#pragma mark - Initialization
- (void)customInitIGListDiffableArray {
    self.identifier = NSUUID.UUID.UUIDString;
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitIGListDiffableArray];
        
    }
    return self;
}

- (instancetype)initWithArray:(NSArray *)array {
    if (self = [super init]) {
        [self customInitIGListDiffableArray];
        
        _array = array;
    }
    return self;
}



#pragma mark - IBOutlets



#pragma mark - Properties



#pragma mark - Private API



#pragma mark - Public API



#pragma mark - Delegate Methods

#pragma mark IGListDiffable
- (nonnull id<NSObject>)diffIdentifier {
    return self.identifier;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    return [((NSString *)self.diffIdentifier) isEqualToString:((NSString *)object.diffIdentifier)];
}


@end
