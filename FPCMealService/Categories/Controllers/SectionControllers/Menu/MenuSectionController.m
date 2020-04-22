//
//  MenuSectionController.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "MenuSectionController.h"

// Delegates

// Utilities
#import <Masonry/Masonry.h>

// Globals

// Classes

// Classes - Models
#import "IGListDiffableArray.h"
#import "MenuItem.h"

// Classes - Views
#import "MenuCollectionViewCell.h"

// Classes - View Controllers

// Class Extensions
#import "UIColor+ExtensionMethods.h"

// Definitions


@interface MenuSectionController ()



@end



@implementation MenuSectionController


#pragma mark - Initialization
- (void)customInitMenuSectionController {
    
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitMenuSectionController];
        
    }
    return self;
}

- (instancetype)initWithDelegate:(id <MenuSectionControllerDelegate>)delegate {
    if (self = [super init]) {
        [self customInitMenuSectionController];
        
        _delegate = delegate;
    }
    return self;
}

+ (instancetype)controllerWithDelegate:(id <MenuSectionControllerDelegate>)delegate {
    return [[MenuSectionController alloc] initWithDelegate:delegate];
}


#pragma mark - IBOutlets



#pragma mark - Properties



#pragma mark - Private API
#pragma mark IGListSectionController
- (NSInteger)numberOfItems {
    return self.menuItems.count;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {
    return CGSizeMake(self.collectionContext.containerSize.width, 160.0);
}
- (__kindof UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    
    MenuCollectionViewCell *cell = (MenuCollectionViewCell *)[self.collectionContext dequeueReusableCellOfClass:[MenuCollectionViewCell class] forSectionController:self atIndex:index];
    
    MenuItem *menuItem = [self.menuItems objectAtIndex:index];
    
    cell.labelName.text = menuItem.name;
    cell.labelPrice.text = menuItem.price;
    cell.labelDescription.text = menuItem.itemDescription;
    cell.labelQuantity.text = [NSString stringWithFormat:@"Quantity: %@", menuItem.quantity.stringValue];
    cell.menuItem = menuItem;
    
    NSString *sides = @"";
    NSString *sideTitle = @"";
    
    if (menuItem.sides.count > 0) {
        for (NSString *side in menuItem.sides) {
            if (sides.length == 0) {
                sides = [NSString stringWithFormat:@"\t%@", side];
            } else {
                sides = [NSString stringWithFormat:@"\t%@\n\t%@", sides, side];
            }
        }
        sideTitle = @"Sides:";
    }
    cell.labelSideTitle.text = sideTitle;
    cell.labelSides.text = sides;
    cell.delegate = self.delegate;
    
    [cell update];
    
    return cell;
}
- (void)didUpdateToObject:(id)object {
    if ([object isKindOfClass:[IGListDiffableArray class]]) {
        IGListDiffableArray *diffableArray = (IGListDiffableArray *)object;
        self.menuItems = diffableArray.array;
    }
}

- (void)didSelectItemAtIndex:(NSInteger)index {
    
}


#pragma mark - Public API



#pragma mark - Delegate Methods



@end
