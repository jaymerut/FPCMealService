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
#import "MockableAPI.h"

// Classes - Models
#import "MenuItem.h"
#import "MockableDayMenu.h"

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

@property (strong, nonatomic) MockableAPI *mockableAPI;

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
        if (self.menuItems == nil) {
            __weak typeof(self) wself = self;
            [self.mockableAPI getMenuItems:^(MockableMenuModel *menuModel) {
                __strong typeof(wself) sself = wself;
                sself.menuItems = menuModel.menuItemList;
                sself.arrayMenuItems = [self populateMenuArrayFromDay:self.weekDay];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [sself setCurrentDayForMenuItems];
                });
            } failure:^(NSError *error) {
                NSLog(@"Failed");
            }];
        } else {
            self.arrayMenuItems = [self populateMenuArrayFromDay:self.weekDay];
            [self setCurrentDayForMenuItems];
        }

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

- (MockableAPI *)mockableAPI {
    if (!_mockableAPI) {
        _mockableAPI = [MockableAPI new];
    }
    return _mockableAPI;
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
}

- (void)setCurrentDayForMenuItems {
    for (MenuItem *item in self.arrayMenuItems) {
        item.showButton = YES;
    }
    [self update];
}
- (void)undoCurrentDayForMenuItems {
    for (MenuItem *item in self.arrayMenuItems) {
        item.showButton = NO;
    }
    [self update];
}

- (NSMutableArray *)populateMenuArrayFromDay:(NSNumber *)day {
    NSMutableArray *result = [NSMutableArray new];
    
    /*
     if (self.weekDay.intValue == day.intValue && self.menuItems != nil) {
         result = [NSMutableArray arrayWithArray:self.menuItems];
     } else i
     */
    if (day.intValue == 0) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Sunday"]) {
                result = item.menuItems;
                if (self.weekDay.intValue == day.intValue) { item.isCurrentDay = @YES; }
            }
        }
    } else if (day.intValue == 1) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Monday"]) {
                result = item.menuItems;
                if (self.weekDay.intValue == day.intValue) { item.isCurrentDay = @YES; }
            }
        }
    } else if (day.intValue == 2) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Tuesday"]) {
                result = item.menuItems;
                if (self.weekDay.intValue == day.intValue) { item.isCurrentDay = @YES; }
            }
        }
    } else if (day.intValue == 3) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Wednesday"]) {
                result = item.menuItems;
                if (self.weekDay.intValue == day.intValue) { item.isCurrentDay = @YES; }
            }
        }
    } else if (day.intValue == 4) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Thursday"]) {
                result = item.menuItems;
                if (self.weekDay.intValue == day.intValue) { item.isCurrentDay = @YES; }
            }
        }
    } else if (day.intValue == 5) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Friday"]) {
                result = item.menuItems;
                if (self.weekDay.intValue == day.intValue) { item.isCurrentDay = @YES; }
            }
        }
    } else if (day.intValue == 6) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Saturday"]) {
                result = item.menuItems;
                if (self.weekDay.intValue == day.intValue) { item.isCurrentDay = @YES; }
            }
        }
    }
    return result;
}

- (void)updateMenuItems:(NSMutableArray *)arrayMenuItems {
    if (self.weekDay.intValue == 0) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Sunday"]) {
                item.menuItems = arrayMenuItems;
            }
        }
    } else if (self.weekDay.intValue == 1) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Monday"]) {
                item.menuItems = arrayMenuItems;
            }
        }
    } else if (self.weekDay.intValue == 2) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Tuesday"]) {
                item.menuItems = arrayMenuItems;
            }
        }
    } else if (self.weekDay.intValue == 3) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Wednesday"]) {
                item.menuItems = arrayMenuItems;
            }
        }
    } else if (self.weekDay.intValue == 4) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Thursday"]) {
                item.menuItems = arrayMenuItems;
            }
        }
    } else if (self.weekDay.intValue == 5) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Friday"]) {
                item.menuItems = arrayMenuItems;
            }
        }
    } else if (self.weekDay.intValue == 6) {
        for (MockableDayMenu *item in self.menuItems) {
            if ([item.day isEqualToString:@"Saturday"]) {
                item.menuItems = arrayMenuItems;
            }
        }
    }
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
    [self updateMenuItems:self.arrayMenuItems];
}
- (void)didRemoveOrder:(MenuItem *)item {
    self.total = [NSNumber numberWithDouble:self.total.doubleValue - item.priceValue.doubleValue];
    self.labelTotal.text = [NSString stringWithFormat:@"$%.2f", self.total.doubleValue];
    for (MenuItem *menuItem in self.arrayMenuItems) {
        if (menuItem.name == item.name) {
            menuItem.quantity = item.quantity;
        }
    }
    [self updateMenuItems:self.arrayMenuItems];
}


@end

