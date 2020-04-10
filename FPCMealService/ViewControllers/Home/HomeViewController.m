//
//  HomeViewController.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "HomeViewController.h"

// Delegates

// Utilities
#import <Masonry/Masonry.h>
#import <SWRevealViewController/SWRevealViewController.h>

// Globals

// Classes

// Classes - Models
#import "MenuItem.h"

// Classes - Views
#import "MenuCollection.h"

// Classes - View Controllers

// Class Extensions
#import "UIColor+ExtensionMethods.h"

// Definitions


@interface HomeViewController ()

@property (strong, nonatomic) UISegmentedControl *segmentedControlHeader;

@property (strong, nonatomic) MenuCollection *menuCollection;

@property (strong, nonatomic) NSMutableArray *arrayMenuItems;

@end



@implementation HomeViewController


#pragma mark - Initialization
- (void)customInitHomeViewController {

}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitHomeViewController];
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self customInitHomeViewController];
        
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
    [self setupHomeViewController];
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

- (UISegmentedControl *)segmentedControlHeader {
    if (!_segmentedControlHeader) {
        NSArray *itemArray = [NSArray arrayWithObjects: @"Sunday", @"Monday", @"Wednesday", @"Friday", nil];
        _segmentedControlHeader = [[UISegmentedControl alloc] initWithItems:itemArray];
        _segmentedControlHeader.frame = CGRectZero;
        [_segmentedControlHeader addTarget:self action:@selector(segmentedControlHeader_ValueChanged:) forControlEvents: UIControlEventValueChanged];
    }
    return _segmentedControlHeader;
}

- (MenuCollection *)menuCollection {
    if (!_menuCollection) {
        _menuCollection = [MenuCollection new];
        _menuCollection.backgroundColor = [UIColor whiteColor];
    }
    return _menuCollection;
}

- (NSMutableArray *)arrayMenuItems {
    if (!_arrayMenuItems) {
        _arrayMenuItems = [NSMutableArray new];
        
        MenuItem *menuItemTest1 = [MenuItem new];
        menuItemTest1.name = @"Hamburger";
        menuItemTest1.price = @"$7.50";
        menuItemTest1.itemDescription = @"This is a hamburger.";
        menuItemTest1.sides = [NSArray arrayWithObject:@"Potatoes"];
        
        MenuItem *menuItemTest2 = [MenuItem new];
        menuItemTest2.name = @"Pizza";
        menuItemTest2.price = @"$9.50";
        menuItemTest2.itemDescription = @"This is a pizza";
        
        [_arrayMenuItems addObject:menuItemTest1];
        [_arrayMenuItems addObject:menuItemTest2];
    }
    return _arrayMenuItems;
}


#pragma mark - Private API
- (void)setupHomeViewController {
    
    self.labelHeader.text = @"Menu";
        
    // SegmentedControl
    [self.view addSubview:self.segmentedControlHeader];
    [self.segmentedControlHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.viewHeader.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@40);
    }];
    
    // Menu Collection
    [self.view addSubview:self.menuCollection];
    [self.menuCollection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentedControlHeader.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.viewFooter.mas_top);
    }];
    
    self.menuCollection.menuItems = self.arrayMenuItems;
}

- (void)segmentedControlHeader_ValueChanged:(UISegmentedControl *)segment {
    if (segment.selectedSegmentIndex == 0) {
        NSLog(@"Test Completed");
    } else if (segment.selectedSegmentIndex == 1) {
        
    } else if (segment.selectedSegmentIndex == 2) {
        
    } else if (segment.selectedSegmentIndex == 3) {
        
    }
}


#pragma mark - Public API



#pragma mark - Delegate Methods



@end
