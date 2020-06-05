//
//  SideMenuViewController.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "SideMenuViewController.h"

// Delegates

// Utilities
#import "SWRevealViewController.h"
#import <SafariServices/SafariServices.h>
#import <Masonry/Masonry.h>

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers
#import "HomeViewController.h"

// Class Extensions

// Definitions


@interface SideMenuViewController ()

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UILabel *menuTitle;

@end



@implementation SideMenuViewController


#pragma mark - Initialization
- (void)customInitSideMenuViewController {
    
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitSideMenuViewController];
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self customInitSideMenuViewController];
        
    }
    return self;
}



#pragma mark - UIViewController Lifecycle Methods
- (void)loadView {
    [super loadView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = self.menuTitle;
    self.view.backgroundColor = UIColor.whiteColor;
    
    // Setup
    [self setupSideMenuViewController];
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
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero];
        view.delegate = self;
        view.dataSource = self;
        view.tableFooterView = nil;
        _tableView = view;
    }
    return _tableView;
}

- (UILabel *)menuTitle {
    if (!_menuTitle) {
        _menuTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
        
        _menuTitle.font = [UIFont boldSystemFontOfSize:24.0];
        _menuTitle.textAlignment = NSTextAlignmentLeft;
        _menuTitle.text = @"Menu";
    }
    return _menuTitle;
}


#pragma mark - Private API
- (void)setupSideMenuViewController {
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark Navigation
- (void)navigateToSafariWebView:(NSString *)url {
    SFSafariViewController *destinationVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:url]];
    destinationVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    
    //destinationVC.preferredBarTintColor = AppBundle.current.colors.navigationBarBarTintColor;
    //destinationVC.preferredControlTintColor = AppBundle.current.colors.navigationBarTintColor;
    
    [self presentViewController:destinationVC animated:YES completion:nil];
}


#pragma mark - Public API



#pragma mark - Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSInteger row = indexPath.row;

    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    NSString *text = nil;
    if (row == 0) {
        text = @"Home";
    }

    cell.textLabel.text = NSLocalizedString( text,nil );
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Grab a handle to the reveal controller, as if you'd do with a navigtion controller via self.navigationController.
    SWRevealViewController *revealController = self.revealViewController;
    
    // selecting row
    NSInteger row = indexPath.row;
    
    // if we are trying to push the same row or perform an operation that does not imply frontViewController replacement
    // we'll just set position and return
    UIViewController *newFrontController = nil;
    
    if (row == 0) {
        newFrontController = [[HomeViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:newFrontController];
        [revealController pushFrontViewController:navigationController animated:YES];
        [revealController setFrontViewPosition:FrontViewPositionLeft animated:YES];
        return;
    }
}

@end
