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
#import "MenuItemSideView.h"

// Classes - View Controllers

// Class Extensions
#import "UIColor+ExtensionMethods.h"

// Definitions


@interface MenuCollectionViewCell ()

@property (strong, nonatomic) UILabel *labelName;
@property (strong, nonatomic) UILabel *labelPrice;
@property (strong, nonatomic) UIStackView *stackViewSides;
@property (strong, nonatomic) UILabel *labelDescription;
@property (strong, nonatomic) UIButton *buttonAdd;
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



#pragma mark - Properties
- (UILabel *)labelName {
    if (!_labelName) {
        _labelName = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelName.font = [UIFont fontWithName:@"HoeflerText-BlackItalic" size:28.0];
    }
    return _labelName;
}
- (UILabel *)labelPrice {
    if (!_labelPrice) {
        _labelPrice = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelPrice.font = [UIFont fontWithName:@"HoeflerText-Black" size:18.0];
    }
    return _labelPrice;
}
- (UIStackView *)stackViewSides {
    if (!_stackViewSides) {
        _stackViewSides = [[UIStackView alloc] initWithFrame:CGRectZero];
        _stackViewSides.translatesAutoresizingMaskIntoConstraints = false;
        _stackViewSides.axis = UILayoutConstraintAxisVertical;
        _stackViewSides.distribution = UIStackViewDistributionEqualSpacing;
        _stackViewSides.alignment = UIStackViewAlignmentFill;
        _stackViewSides.spacing = 0;
    }
    return _stackViewSides;
}
- (UILabel *)labelDescription {
    if (!_labelDescription) {
        _labelDescription = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelDescription.font = [UIFont fontWithName:@"HoeflerText-Italic" size:16.0];
    }
    return _labelDescription;
}
- (UIButton *)buttonAdd {
    if (!_buttonAdd) {
        _buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonAdd setTitle:@"Add Order" forState:UIControlStateNormal];
        [_buttonAdd setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _buttonAdd.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        
        _buttonAdd.backgroundColor = [UIColor colorWithHEX:0x006B2C];
        
        _buttonAdd.layer.cornerRadius = 10; // this value vary as per your desire
        _buttonAdd.clipsToBounds = YES;
        
        _buttonAdd.contentEdgeInsets = UIEdgeInsetsMake(5, 20, 5, 20);
        
        _buttonAdd.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_buttonAdd addTarget:self action:@selector(buttonAdd_TouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonAdd;
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
    
    [self.contentView addSubview:self.stackViewSides];
    [self.stackViewSides mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.top.equalTo(self.labelName.mas_bottom).offset(20);
    }];
    
    [self.contentView addSubview:self.labelDescription];
    [self.labelDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(20);
        make.top.equalTo(self.stackViewSides.mas_bottom).offset(20);
    }];
    
    [self.contentView addSubview:self.buttonAdd];
    [self.buttonAdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).inset(10);
        make.top.equalTo(self.labelPrice.mas_bottom).offset(5);
        make.width.equalTo(@120);
        make.height.equalTo(@30);
    }];
}

- (void)buttonAdd_TouchUpInside:(id)sender {
    if (!self.buttonToggled) {
        [self.buttonAdd setImage:imageAdded forState:UIControlStateNormal];
        [self.buttonAdd setTitle:@"" forState:UIControlStateNormal];
        self.buttonToggled = YES;
    } else {
        [self.buttonAdd setImage:nil forState:UIControlStateNormal];
        [self.buttonAdd setTitle:@"Add Order" forState:UIControlStateNormal];
        self.buttonToggled = NO;
    }
}


#pragma mark - Public API
- (void)update {
    
    self.labelName.text = self.menuItem.name;
    self.labelPrice.text = self.menuItem.price;
    [self updateSides];
    self.labelDescription.text = self.menuItem.itemDescription;
}
- (void)updateWithMenuItem:(MenuItem *)menuItem {
    _menuItem = menuItem;
    
    [self update];
}
- (void)updateSides {
    if (self.menuItem.sides.count > 0) {
        MenuItemSideView *view = [[MenuItemSideView alloc] initWithTitle:@"Sides:"];
        view.labelTitle.font = [UIFont fontWithName:@"HoeflerText-Black" size:16.0];
        [self.stackViewSides addArrangedSubview:view];
    }
    for (NSString *side in self.menuItem.sides) {
        MenuItemSideView *view = [[MenuItemSideView alloc] initWithTitle:side];
        [view.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.mas_left).offset(30);
        }];
        [self.stackViewSides addArrangedSubview:view];
    }
}


#pragma mark - Delegate Methods



@end
