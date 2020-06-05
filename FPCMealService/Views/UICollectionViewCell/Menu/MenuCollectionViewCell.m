//
//  MenuCollectionViewCell.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "MenuCollectionViewCell.h"

// Delegates

// Utilities
#import <Masonry/Masonry.h>

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions
#import "UIColor+ExtensionMethods.h"

// Definitions


@interface MenuCollectionViewCell ()

@property (strong, nonatomic) UILabel *labelName;
@property (strong, nonatomic) UILabel *labelPrice;
@property (strong, nonatomic) UILabel *labelSideTitle;
@property (strong, nonatomic) UILabel *labelSides;
@property (strong, nonatomic) UILabel *labelDescription;
@property (strong, nonatomic) UILabel *labelQuantity;
@property (strong, nonatomic) UIStepper *stepperItem;
@property (strong, nonatomic) NSNumber *oldValue;
@property (nonatomic) BOOL buttonToggled;

@end



@implementation MenuCollectionViewCell

#pragma mark - Static Variables
static UIImage *imageAdded;

#pragma mark - Initialization
- (void)customInitMenuCollectionViewCell {
    
    // Images
    if (!imageAdded) { imageAdded = [UIImage imageNamed:@"checkmark"]; }
    
    // Setup
    [self setupMenuCollectionViewCell];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self customInitMenuCollectionViewCell];
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self customInitMenuCollectionViewCell];
        
    }
    return self;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    
    self.labelName.text = @"";
    self.labelPrice.text = @"";
    self.labelDescription.text = @"";
    self.labelQuantity.text = @"";
    self.labelSides.text = @"";
}




#pragma mark - Properties
- (UILabel *)labelName {
    if (!_labelName) {
        _labelName = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelName.font = [UIFont fontWithName:@"Optima-BoldItalic" size:28.0];
    }
    return _labelName;
}
- (UILabel *)labelPrice {
    if (!_labelPrice) {
        _labelPrice = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelPrice.font = [UIFont fontWithName:@"Optima-Bold" size:18.0];
    }
    return _labelPrice;
}
- (UILabel *)labelSideTitle {
    if (!_labelSideTitle) {
        _labelSideTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelSideTitle.font = [UIFont fontWithName:@"Optima-Bold" size:16.0];
    }
    return _labelSideTitle;
}
- (UILabel *)labelSides {
    if (!_labelSides) {
        _labelSides = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelSides.font = [UIFont fontWithName:@"Optima-Regular" size:16.0];
    }
    return _labelSides;
}
- (UILabel *)labelDescription {
    if (!_labelDescription) {
        _labelDescription = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelDescription.font = [UIFont fontWithName:@"Optima-Italic" size:16.0];
    }
    return _labelDescription;
}
- (UILabel *)labelQuantity {
    if (!_labelQuantity) {
        _labelQuantity = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelQuantity.font = [UIFont fontWithName:@"Optima-Regular" size:16.0];
    }
    return _labelQuantity;
}
- (UIStepper *)stepperItem {
    if (!_stepperItem) {
        _stepperItem = [[UIStepper alloc] initWithFrame:CGRectZero];
        [_stepperItem addTarget:self action:@selector(stepperItem_ValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _stepperItem;
}


#pragma mark - Private API
- (void)setupMenuCollectionViewCell {
    
    [self.contentView addSubview:self.labelName];
    [self.labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(20);
    }];
    
    [self.contentView addSubview:self.labelPrice];
    [self.labelPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).inset(10);
        make.top.equalTo(self.contentView.mas_top).offset(20);
    }];
    
    [self.contentView addSubview:self.labelSideTitle];
    [self.labelSideTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.top.equalTo(self.labelName.mas_bottom).offset(20);
    }];
    
    [self.contentView addSubview:self.labelSides];
    [self.labelSides mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.top.equalTo(self.labelSideTitle.mas_bottom).offset(5);
    }];
    
    [self.contentView addSubview:self.labelDescription];
    [self.labelDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.top.equalTo(self.labelSides.mas_bottom).offset(20);
    }];
    
    /*
    [self.contentView addSubview:self.buttonAdd];
    [self.buttonAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).inset(10);
        make.top.equalTo(self.labelPrice.mas_bottom).offset(10);
        make.width.equalTo(@120);
        make.height.equalTo(@30);
    }];
     */
    
    [self.contentView addSubview:self.labelQuantity];
    [self.labelQuantity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).inset(10);
        make.top.equalTo(self.labelPrice.mas_bottom).offset(10);
    }];
    [self.contentView addSubview:self.stepperItem];
    [self.stepperItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).inset(10);
        make.top.equalTo(self.labelQuantity.mas_bottom).offset(10);
        //make.width.equalTo(@120);
        make.height.equalTo(@30);
    }];
}

- (void)stepperItem_ValueChanged:(UIStepper *)stepper {
    if (self.oldValue.doubleValue < stepper.value) {
        self.oldValue = [NSNumber numberWithInt:self.oldValue.intValue + 1];
        self.menuItem.quantity = [NSNumber numberWithInt:self.menuItem.quantity.intValue + 1];
        [self.delegate didAddOrder:self.menuItem];
        
    } else {
        self.oldValue = [NSNumber numberWithInt:self.oldValue.intValue - 1];
        self.menuItem.quantity = [NSNumber numberWithInt:self.menuItem.quantity.intValue - 1];
        [self.delegate didRemoveOrder:self.menuItem];
    }
    self.labelQuantity.text = [NSString stringWithFormat:@"Quantity: %@", self.menuItem.quantity.stringValue];
}


#pragma mark - Public API
- (void)update {
    self.stepperItem.value = self.menuItem.quantity.doubleValue;
    self.oldValue = self.menuItem.quantity;
    
    if (self.menuItem.showButton) {
        self.stepperItem.hidden = NO;
        self.labelQuantity.hidden = NO;
    } else {
        self.stepperItem.hidden = YES;
        self.labelQuantity.hidden = YES;
    }
}


#pragma mark - Delegate Methods


@end
