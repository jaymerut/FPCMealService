//
//  IGListDiffableArray.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import <Foundation/Foundation.h>

// Delegates

// Utilities
#import <IGListKit/IGListDiffable.h>

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface IGListDiffableArray : NSObject <IGListDiffable>


#pragma mark - Custom Delegates


#pragma mark - Initialization
- (instancetype)initWithArray:(NSArray *)array;

#pragma mark - IBOutlets


#pragma mark - Properties
@property (strong, nonatomic) NSArray *array;

#pragma mark - Public API



@end

