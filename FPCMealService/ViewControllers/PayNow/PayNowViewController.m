//
//  PayNowViewController.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/8/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "PayNowViewController.h"

// Delegates

// Utilities

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface PayNowViewController ()



@end



@implementation PayNowViewController


#pragma mark - Initialization
- (void)customInitPayNowViewController {
    
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitPayNowViewController];
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self customInitPayNowViewController];
        
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
    [self setupPayNowViewController];
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



#pragma mark - Private API
- (void)setupPayNowViewController {
    self.labelHeader.text = @"Pay Now";
}



#pragma mark - Public API



#pragma mark - Delegate Methods



@end
