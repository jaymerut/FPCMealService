//
//  ContactUsViewController.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/8/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "ContactUsViewController.h"

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


@interface ContactUsViewController ()

@property (strong, nonatomic) UIView *containerView;

@property (strong, nonatomic) UILabel *labelAddress;
@property (strong, nonatomic) UILabel *labelEmail;
@property (strong, nonatomic) UILabel *labelPhone;

@property (strong, nonatomic) UILabel *labelAddressText;
@property (strong, nonatomic) UILabel *labelEmailText;
@property (strong, nonatomic) UILabel *labelPhoneText;

@end



@implementation ContactUsViewController


#pragma mark - Initialization
- (void)customInitContactUsViewController {
    
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitContactUsViewController];
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self customInitContactUsViewController];
        
    }
    return self;
}



#pragma mark - UIViewController Lifecycle Methods
- (void)loadView {
    [super loadView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup
    [self setupContactUsViewController];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)dealloc {
    
}
- (void)didReceiveMemoryWarning {
    // SET ALL STRONG POINTERS TO NIL
    
    
    [super didReceiveMemoryWarning];
}



#pragma mark - Properties
- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _containerView;
}

- (UILabel *)labelAddress {
    if (!_labelAddress) {
        _labelAddress = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelAddress.font = [UIFont fontWithName:@"HoeflerText-Black" size:28.0];
        _labelAddress.text = @"Camp Address";
    }
    return _labelAddress;
}
- (UILabel *)labelEmail {
    if (!_labelEmail) {
        _labelEmail = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelEmail.font = [UIFont fontWithName:@"HoeflerText-Black" size:28.0];
        _labelEmail.text = @"Email";
    }
    return _labelEmail;
}
- (UILabel *)labelPhone {
    if (!_labelPhone) {
        _labelPhone = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelPhone.font = [UIFont fontWithName:@"HoeflerText-Black" size:28.0];
        _labelPhone.text = @"Phone Number";
    }
    return _labelPhone;
}
- (UILabel *)labelAddressText {
    if (!_labelAddressText) {
        _labelAddressText = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelAddressText.font = [UIFont fontWithName:@"HoeflerText-Regular" size:18.0];
        _labelAddressText.text = @"933 East Friendly Pines Road\nPrescott, AZ\n86303-8202";
        _labelAddressText.numberOfLines = 0;
    }
    return _labelAddressText;
}
- (UILabel *)labelEmailText {
    if (!_labelEmailText) {
        _labelEmailText = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelEmailText.font = [UIFont fontWithName:@"HoeflerText-Regular" size:18.0];
        _labelEmailText.text = @"info@friendlypines.com";
        _labelEmailText.numberOfLines = 0;
    }
    return _labelEmailText;
}
- (UILabel *)labelPhoneText {
    if (!_labelPhoneText) {
        _labelPhoneText = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelPhoneText.font = [UIFont fontWithName:@"HoeflerText-Regular" size:18.0];
        _labelPhoneText.text = @"(928) 445-2128";
        _labelPhoneText.numberOfLines = 0;
    }
    return _labelPhoneText;
}


#pragma mark - Private API
- (void)setupContactUsViewController {
    self.labelHeader.text = @"Contact Us";

    [self.scrollView addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.viewHeader.mas_bottom);
        make.left.equalTo(self.scrollView.mas_left);
        make.right.equalTo(self.scrollView.mas_right);
        make.bottom.equalTo(@0);
        make.width.equalTo(self.scrollView.mas_width);
    }];
    
    [self.containerView addSubview:self.labelAddress];
    [self.labelAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView.mas_top).offset(20);
        make.left.equalTo(self.containerView.mas_left).offset(20);
        make.width.equalTo(self.containerView.mas_width);
    }];
    [self.containerView addSubview:self.labelAddressText];
    [self.labelAddressText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelAddress.mas_bottom).offset(10);
        make.left.equalTo(self.containerView.mas_left).offset(20);
        make.right.equalTo(self.containerView.mas_right);
        make.width.equalTo(self.containerView.mas_width);
    }];
    
    [self.containerView addSubview:self.labelEmail];
    [self.labelEmail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelAddressText.mas_bottom).offset(40);
        make.left.equalTo(self.containerView.mas_left).offset(20);
        make.width.equalTo(self.containerView.mas_width);
    }];
    [self.containerView addSubview:self.labelEmailText];
    [self.labelEmailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelEmail.mas_bottom).offset(10);
        make.left.equalTo(self.containerView.mas_left).offset(20);
        make.right.equalTo(self.containerView.mas_right);
        make.width.equalTo(self.containerView.mas_width);
    }];
    
    [self.containerView addSubview:self.labelPhone];
    [self.labelPhone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelEmailText.mas_bottom).offset(40);
        make.left.equalTo(self.containerView.mas_left).offset(20);
        make.width.equalTo(self.containerView.mas_width);
    }];
    [self.containerView addSubview:self.labelPhoneText];
    [self.labelPhoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelPhone.mas_bottom).offset(10);
        make.left.equalTo(self.containerView.mas_left).offset(20);
        make.right.equalTo(self.containerView.mas_right);
        make.width.equalTo(self.containerView.mas_width);
    }];
    
}



#pragma mark - Public API



#pragma mark - Delegate Methods



@end
