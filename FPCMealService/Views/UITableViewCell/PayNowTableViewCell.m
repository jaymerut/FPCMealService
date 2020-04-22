//
//  PayNowTableViewCell.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/20/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "PayNowTableViewCell.h"

// Delegates

// Utilities
#import <Masonry/Masonry.h>

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface PayNowTableViewCell ()

@property (strong, nonatomic) UILabel *labelName;
@property (strong, nonatomic) UILabel *labelQuantity;
@property (strong, nonatomic) UILabel *labelPrice;

@end



@implementation PayNowTableViewCell


#pragma mark - Initialization
- (void)customInitPayNowTableViewCell {
    
    // Setup
    [self setupPayNowTableViewCell];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self customInitPayNowTableViewCell];
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self customInitPayNowTableViewCell];
        
    }
    return self;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self customInitPayNowTableViewCell];
    }
    return self;
}



#pragma mark - Properties
- (UILabel *)labelName {
    if (!_labelName) {
        _labelName = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelName.font = [UIFont fontWithName:@"Optima-Bold" size:20.0];
    }
    return _labelName;
}
- (UILabel *)labelPrice {
    if (!_labelPrice) {
        _labelPrice = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelPrice.font = [UIFont fontWithName:@"Optima-Regular" size:20.0];
    }
    return _labelPrice;
}
- (UILabel *)labelQuantity {
    if (!_labelQuantity) {
        _labelQuantity = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelQuantity.font = [UIFont fontWithName:@"Optima-Regular" size:20.0];
    }
    return _labelQuantity;
}


#pragma mark - Private API
- (void)setupPayNowTableViewCell {
    
    // Self
    [self.contentView addSubview:self.labelName];
    [self.labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.equalTo(@30);
    }];
    
    [self.contentView addSubview:self.labelPrice];
    [self.labelPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.height.equalTo(@30);
    }];
    
    [self.contentView addSubview:self.labelQuantity];
    [self.labelQuantity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.equalTo(@30);
    }];
}

- (void)update {
    self.labelName.text = self.item.name;
    self.labelPrice.text = self.item.price;
    self.labelQuantity.text = [NSString stringWithFormat:@"( %@ )", self.item.quantity];
}



#pragma mark - Public API
- (void)updateWithItem:(MenuItem *)item {
    self.item = item;
    
    [self update];
}


#pragma mark - Delegate Methods



@end
