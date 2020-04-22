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

@property (strong, nonatomic) NSNumber *weekDay;

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
        NSArray *itemArray = [NSArray arrayWithObjects: @"Sun", @"Mon", @"Tues", @"Wed", @"Thurs", @"Fri", @"Sat", nil];
        _segmentedControlHeader = [[UISegmentedControl alloc] initWithItems:itemArray];
        _segmentedControlHeader.frame = CGRectZero;
        [_segmentedControlHeader addTarget:self action:@selector(segmentedControlHeader_ValueChanged:) forControlEvents: UIControlEventValueChanged];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:[NSDate date]];
        int weekday = [comps weekday];
        self.weekDay = [NSNumber numberWithInt:weekday - 1];
        _segmentedControlHeader.selectedSegmentIndex = self.weekDay.intValue;
        self.arrayMenuItems = [self populateMenuArrayFromDay:self.weekDay];
        [self setCurrentDayForMenuItems];
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
    
    [self update];
}

- (void)update {
    self.menuCollection.viewController = self;
    self.menuCollection.menuItems = self.arrayMenuItems;
}

- (void)segmentedControlHeader_ValueChanged:(UISegmentedControl *)segment {
    
    self.arrayMenuItems = [self populateMenuArrayFromDay:[NSNumber numberWithInteger:segment.selectedSegmentIndex]];
    if (segment.selectedSegmentIndex == self.weekDay.intValue) {
        [self setCurrentDayForMenuItems];
    } else {
        [self undoCurrentDayForMenuItems];
    }
    [self update];
}

- (void)setCurrentDayForMenuItems {
    for (MenuItem *item in self.arrayMenuItems) {
        item.showButton = YES;
    }
}
- (void)undoCurrentDayForMenuItems {
    for (MenuItem *item in self.arrayMenuItems) {
        item.showButton = NO;
    }
}

- (NSMutableArray *)populateMenuArrayFromDay:(NSNumber *)day {
    NSMutableArray *result = [NSMutableArray new];
    MenuItem *menuItemTest1 = [MenuItem new];
    MenuItem *menuItemTest2 = [MenuItem new];
    MenuItem *menuItemTest3 = [MenuItem new];
    
    if (self.weekDay.intValue == day.intValue && self.menuItems != nil) {
        result = [NSMutableArray arrayWithArray:self.menuItems];
    } else if (day.intValue == 0) {
        menuItemTest1.name = @"Sandwich";
        menuItemTest1.price = @"$7.50";
        menuItemTest1.priceValue = [NSNumber numberWithDouble:7.50];
        menuItemTest1.itemDescription = @"This is a sandwich.";
        menuItemTest1.quantity = @0;
        
        menuItemTest2.name = @"Pasta";
        menuItemTest2.price = @"$5.50";
        menuItemTest2.priceValue = [NSNumber numberWithDouble:5.50];
        menuItemTest2.itemDescription = @"This is a pasta.";
        menuItemTest2.quantity = @0;
        
        result = [NSMutableArray arrayWithArray:@[menuItemTest1, menuItemTest2]];
    } else if (day.intValue == 1) {
        menuItemTest1.name = @"Tester";
        menuItemTest1.price = @"$10.50";
        menuItemTest1.priceValue = [NSNumber numberWithDouble:10.50];
        menuItemTest1.itemDescription = @"This is a test.";
        menuItemTest1.quantity = @0;
        
        result = [NSMutableArray arrayWithArray:@[menuItemTest1]];
    } else if (day.intValue == 2) {
        menuItemTest1.name = @"Yogurt";
        menuItemTest1.price = @"$1.50";
        menuItemTest1.priceValue = [NSNumber numberWithDouble:1.50];
        menuItemTest1.itemDescription = @"This is a yogurt.";
        menuItemTest1.quantity = @0;
        
        menuItemTest2.name = @"Meatballs";
        menuItemTest2.price = @"$5.50";
        menuItemTest2.priceValue = [NSNumber numberWithDouble:5.50];
        menuItemTest2.itemDescription = @"This is meatballs.";
        menuItemTest2.sides = [NSArray arrayWithObject:@"Sauce"];
        menuItemTest2.quantity = @0;
        
        menuItemTest3.name = @"Fish";
        menuItemTest3.price = @"$2.50";
        menuItemTest3.priceValue = [NSNumber numberWithDouble:2.50];
        menuItemTest3.itemDescription = @"This is a fish.";
        menuItemTest3.quantity = @0;
        
        result = [NSMutableArray arrayWithArray:@[menuItemTest1, menuItemTest2, menuItemTest3]];
    } else if (day.intValue == 3) {
        menuItemTest1.name = @"Balls";
        menuItemTest1.price = @"$1.50";
        menuItemTest1.priceValue = [NSNumber numberWithDouble:1.50];
        menuItemTest1.itemDescription = @"This is a ball.";
        menuItemTest1.quantity = @0;
        
        result = [NSMutableArray arrayWithArray:@[menuItemTest1]];
    } else if (day.intValue == 4) {
        menuItemTest1.name = @"Yogurt";
        menuItemTest1.price = @"$1.50";
        menuItemTest1.priceValue = [NSNumber numberWithDouble:1.50];
        menuItemTest1.itemDescription = @"This is a yogurt.";
        menuItemTest1.quantity = @0;
        
        menuItemTest2.name = @"Meatballs";
        menuItemTest2.price = @"$5.50";
        menuItemTest2.priceValue = [NSNumber numberWithDouble:5.50];
        menuItemTest2.itemDescription = @"This is meatballs.";
        menuItemTest2.quantity = @0;
        
        menuItemTest3.name = @"Fish";
        menuItemTest3.price = @"$2.50";
        menuItemTest3.priceValue = [NSNumber numberWithDouble:2.50];
        menuItemTest3.itemDescription = @"This is a fish.";
        menuItemTest3.sides = [NSArray arrayWithObject:@"Sauce"];
        menuItemTest3.quantity = @0;
        
        result = [NSMutableArray arrayWithArray:@[menuItemTest1, menuItemTest2, menuItemTest3]];
    } else if (day.intValue == 5) {
        menuItemTest1.name = @"Hamburger";
        menuItemTest1.price = @"$7.50";
        menuItemTest1.priceValue = [NSNumber numberWithDouble:7.50];
        menuItemTest1.itemDescription = @"This is a hamburger.";
        menuItemTest1.sides = [NSArray arrayWithObject:@"Potatoes"];
        menuItemTest1.quantity = @0;

        menuItemTest2.name = @"Pizza";
        menuItemTest2.price = @"$9.50";
        menuItemTest2.priceValue = [NSNumber numberWithDouble:9.50];
        menuItemTest2.itemDescription = @"This is a pizza";
        menuItemTest2.quantity = @0;
        
        result = [NSMutableArray arrayWithArray:@[menuItemTest1, menuItemTest2]];
    } else if (day.intValue == 6) {
        
        result = [NSMutableArray arrayWithArray:@[]];
    }
    return result;
}


#pragma mark - Public API



#pragma mark - Delegate Methods
- (void)didAddOrder:(MenuItem *)item {
    self.total = [NSNumber numberWithDouble:self.total.doubleValue + item.priceValue.doubleValue];
    self.labelTotal.text = [NSString stringWithFormat:@"$%.2f", self.total.doubleValue];
    for (MenuItem *menuItem in self.arrayMenuItems) {
        if (menuItem.name == item.name) {
            menuItem.quantity = item.quantity;
        }
    }
    self.menuItems = self.arrayMenuItems;
}
- (void)didRemoveOrder:(MenuItem *)item {
    self.total = [NSNumber numberWithDouble:self.total.doubleValue - item.priceValue.doubleValue];
    self.labelTotal.text = [NSString stringWithFormat:@"$%.2f", self.total.doubleValue];
    for (MenuItem *menuItem in self.arrayMenuItems) {
        if (menuItem.name == item.name) {
            menuItem.quantity = item.quantity;
        }
    }
    self.menuItems = self.arrayMenuItems;
}


@end

