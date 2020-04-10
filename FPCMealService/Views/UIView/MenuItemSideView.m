//
//  MenuItemSideView.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "MenuItemSideView.h"

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


@interface MenuItemSideView ()

@property (strong, nonatomic) UIView *separator;
@property (strong, nonatomic) UIFont *font;

@end



@implementation MenuItemSideView


#pragma mark - Initialization
- (void)customInitMenuItemSideView {
    
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self customInitMenuItemSideView];
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self customInitMenuItemSideView];
        
    }
    return self;
}
- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        [self customInitMenuItemSideView];
        
        self.title = title;
        [self setup];
    }
    return self;
}



#pragma mark - Properties
- (UILabel *)labelTitle {
    if (!_labelTitle) {
        _labelTitle = [UILabel new];
        _labelTitle.font = self.font;
    }
    return _labelTitle;
}
- (UIView *)separator {
    if (!_separator) {
        _separator = [UIView new];
        _separator.backgroundColor = [UIColor colorWithRed:(200/255.0) green:(199/255.0) blue:(204/255.0) alpha:0.5];
    }
    return _separator;
}

- (UIFont *)font {
    if (!_font) {
        _font = [UIFont fontWithName:@"HoeflerText-Regular" size:16];
    }
    return _font;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    self.labelTitle.text = title;
}

#pragma mark - Private API
- (void)setup {
    
    // Title
    [self addSubview:self.labelTitle];
    [self.labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(5);
        //make.left.equalTo(self.mas_left);
    }];

    // Separator
    [self addSubview:self.separator];
    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelTitle.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@1);
    }];
    
}



#pragma mark - Public API



#pragma mark - Delegate Methods



@end
