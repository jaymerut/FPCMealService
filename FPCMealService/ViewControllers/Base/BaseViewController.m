//
//  BaseViewController.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/8/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "BaseViewController.h"

// Delegates

// Utilities
#import <Masonry/Masonry.h>

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers
#import "HomeViewController.h"
#import "ContactUsViewController.h"
#import "PayNowViewController.h"

// Class Extensions
#import "UIColor+ExtensionMethods.h"

// Definitions


@interface BaseViewController ()

@property (strong, nonatomic) UIView *containerViewMenuFooter;
@property (strong, nonatomic) UIView *containerViewContactUsFooter;
@property (strong, nonatomic) UIView *containerViewPayNowFooter;
@property (strong, nonatomic) UIView *viewSeparator;

@property (strong, nonatomic) UIImageView *imageViewMenuFooter;
@property (strong, nonatomic) UIImageView *imageViewContactUsFooter;
@property (strong, nonatomic) UIImageView *imageViewPayNowFooter;

@property (strong, nonatomic) UILabel *labelMenuFooter;
@property (strong, nonatomic) UILabel *labelContactUsFooter;
@property (strong, nonatomic) UILabel *labelPayNowFooter;

@property (strong, nonatomic) NSNumber *width;

@end



@implementation BaseViewController

#pragma mark - Static Variables
static UIImage *imageMenuFooter;
static UIImage *imageContactUsFooter;
static UIImage *imagePayNowFooter;

#pragma mark - Initialization
- (void)customInitBaseViewController {
    
    // Images
    if (!imageMenuFooter) { imageMenuFooter = [UIImage imageNamed:@"menu-icon"]; }
    if (!imageContactUsFooter) { imageContactUsFooter = [UIImage imageNamed:@"contact-us"]; }
    if (!imagePayNowFooter) { imagePayNowFooter = [UIImage imageNamed:@"apple-pay"]; }
}
- (instancetype)init {
    if (self = [super init]) {
        [self customInitBaseViewController];
        
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self customInitBaseViewController];
        
    }
    return self;
}



#pragma mark - UIViewController Lifecycle Methods
- (void)loadView {
    [super loadView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self setNeedsStatusBarAppearanceUpdate];
    
    UIApplication *app = [UIApplication sharedApplication];
    CGFloat statusBarHeight = app.statusBarFrame.size.height;

    UIView *statusBarView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, statusBarHeight)];
    statusBarView.backgroundColor  =  [UIColor colorWithHEX:0x006B2C];
    [self.view addSubview:statusBarView];
    
    // Setup
    [self setupBaseViewController];
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

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



#pragma mark - Properties
- (UILabel *)labelHeader {
    if (!_labelHeader) {
        _labelHeader = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelHeader.font = [UIFont fontWithName:@"HoeflerText-Italic" size:36.0];
        _labelHeader.textColor = [UIColor whiteColor];
    }
    return _labelHeader;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    }
    return _scrollView;
}

- (UIView *)viewHeader {
    if (!_viewHeader) {
        _viewHeader = [[UIView alloc] initWithFrame:CGRectZero];
        _viewHeader.backgroundColor = [UIColor colorWithHEX:0x006B2C];
    }
    return _viewHeader;
}

- (UIView *)viewFooter {
    if (!_viewFooter) {
        _viewFooter = [[UIView alloc] initWithFrame:CGRectZero];
        _viewFooter.backgroundColor = [UIColor colorWithHEX:0x61CE70];
    }
    return _viewFooter;
}

- (UIView *)containerViewMenuFooter {
    if (!_containerViewMenuFooter) {
        _containerViewMenuFooter = [[UIView alloc] initWithFrame:CGRectZero];
        _containerViewMenuFooter.backgroundColor = [UIColor clearColor];
    }
    return _containerViewMenuFooter;
}
- (UIView *)containerViewContactUsFooter {
    if (!_containerViewContactUsFooter) {
        _containerViewContactUsFooter = [[UIView alloc] initWithFrame:CGRectZero];
        _containerViewContactUsFooter.backgroundColor = [UIColor clearColor];
    }
    return _containerViewContactUsFooter;
}
- (UIView *)containerViewPayNowFooter {
    if (!_containerViewPayNowFooter) {
        _containerViewPayNowFooter = [[UIView alloc] initWithFrame:CGRectZero];
        _containerViewPayNowFooter.backgroundColor = [UIColor clearColor];
    }
    return _containerViewPayNowFooter;
}
- (UIView *)viewSeparator {
    if (!_viewSeparator) {
        _viewSeparator = [[UIView alloc] initWithFrame:CGRectZero];
        _viewSeparator.backgroundColor = [UIColor whiteColor];
    }
    return _viewSeparator;
}

- (UIImageView *)imageViewMenuFooter {
    if (!_imageViewMenuFooter) {
        _imageViewMenuFooter = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageViewMenuFooter.contentMode = UIViewContentModeScaleAspectFit;
        _imageViewMenuFooter.image = imageMenuFooter;
    }
    return _imageViewMenuFooter;
}
- (UIImageView *)imageViewContactUsFooter {
    if (!_imageViewContactUsFooter) {
        _imageViewContactUsFooter = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageViewContactUsFooter.contentMode = UIViewContentModeScaleAspectFit;
        _imageViewContactUsFooter.image = imageContactUsFooter;
    }
    return _imageViewContactUsFooter;
}
- (UIImageView *)imageViewPayNowFooter {
    if (!_imageViewPayNowFooter) {
        _imageViewPayNowFooter = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageViewPayNowFooter.contentMode = UIViewContentModeScaleAspectFit;
        _imageViewPayNowFooter.image = imagePayNowFooter;
    }
    return _imageViewPayNowFooter;
}

- (UILabel *)labelMenuFooter {
    if (!_labelMenuFooter) {
        _labelMenuFooter = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelMenuFooter.font = [UIFont fontWithName:@"HoeflerText-Regular" size:14.0];
        _labelMenuFooter.textColor = [UIColor blackColor];
        _labelMenuFooter.text = @"Menu";
    }
    return _labelMenuFooter;
}
- (UILabel *)labelContactUsFooter {
    if (!_labelContactUsFooter) {
        _labelContactUsFooter = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelContactUsFooter.font = [UIFont fontWithName:@"HoeflerText-Regular" size:14.0];
        _labelContactUsFooter.textColor = [UIColor blackColor];
        _labelContactUsFooter.text = @"Contact Us";
    }
    return _labelContactUsFooter;
}
- (UILabel *)labelPayNowFooter {
    if (!_labelPayNowFooter) {
        _labelPayNowFooter = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelPayNowFooter.font = [UIFont fontWithName:@"HoeflerText-Regular" size:14.0];
        _labelPayNowFooter.textColor = [UIColor blackColor];
        _labelPayNowFooter.text = @"Pay Now";
    }
    return _labelPayNowFooter;
}

- (NSNumber *)width {
    if (!_width) {
        _width = [NSNumber numberWithFloat:(self.view.frame.size.width / 3.0)];
    }
    return _width;
}


#pragma mark - Private API
- (void)setupBaseViewController {
    
    // Header
    [self.view addSubview:self.viewHeader];
    [self.viewHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            UIView *topLayoutGuide = (id)self.topLayoutGuide;
            make.top.equalTo(self.mas_topLayoutGuide);
        }
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@100);
    }];
    
    [self.viewHeader addSubview:self.labelHeader];
    [self.labelHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.viewHeader.mas_left).inset(20);
        make.centerY.equalTo(self.viewHeader.mas_centerY).offset(10);
    }];
    
    // Footer
    [self.view addSubview:self.viewFooter];
    [self.viewFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@100);
    }];
    
    // ScrollView
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.viewHeader.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.viewFooter.mas_top);
    }];
    
    // Menu (Footer)
    [self.viewFooter addSubview:self.containerViewMenuFooter];
    [self.containerViewMenuFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.viewFooter.mas_centerY).offset(-5);
        make.left.equalTo(self.viewFooter.mas_left);
        make.width.equalTo(self.width);
        make.height.equalTo(@50);
    }];
    [self.containerViewMenuFooter addSubview:self.imageViewMenuFooter];
    [self.imageViewMenuFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerViewMenuFooter.mas_top);
        make.centerX.equalTo(self.containerViewMenuFooter.mas_centerX);
        make.height.equalTo(@30);
    }];
    [self.containerViewMenuFooter addSubview:self.labelMenuFooter];
    [self.labelMenuFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageViewMenuFooter.mas_bottom).offset(5);
        make.centerX.equalTo(self.containerViewMenuFooter.mas_centerX);
    }];
    
    UITapGestureRecognizer *gestureTapMenu = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTap_Menu:)];
    [self.containerViewMenuFooter addGestureRecognizer:gestureTapMenu];
    
    // Contact Us (Footer)
    [self.viewFooter addSubview:self.containerViewContactUsFooter];
    [self.containerViewContactUsFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.viewFooter.mas_centerY).offset(-5);
        make.left.equalTo(self.containerViewMenuFooter.mas_right);
        make.width.equalTo(self.width);
        make.height.equalTo(@50);
    }];
    [self.containerViewContactUsFooter addSubview:self.imageViewContactUsFooter];
    [self.imageViewContactUsFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerViewContactUsFooter.mas_top);
        make.centerX.equalTo(self.containerViewContactUsFooter.mas_centerX);
        make.height.equalTo(@30);
    }];
    [self.containerViewContactUsFooter addSubview:self.labelContactUsFooter];
    [self.labelContactUsFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageViewContactUsFooter.mas_bottom).offset(5);
        make.centerX.equalTo(self.containerViewContactUsFooter.mas_centerX);
    }];
    
    UITapGestureRecognizer *gestureTapContactUs = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTap_ContactUs:)];
    [self.containerViewContactUsFooter addGestureRecognizer:gestureTapContactUs];
    
    // Find Us (Footer)
    [self.viewFooter addSubview:self.containerViewPayNowFooter];
    [self.containerViewPayNowFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.viewFooter.mas_centerY).offset(-5);
        make.left.equalTo(self.containerViewContactUsFooter.mas_right);
        make.width.equalTo(self.width);
        make.height.equalTo(@50);
    }];
    [self.containerViewPayNowFooter addSubview:self.imageViewPayNowFooter];
    [self.imageViewPayNowFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerViewPayNowFooter.mas_top);
        make.centerX.equalTo(self.containerViewPayNowFooter.mas_centerX);
        make.height.equalTo(@30);
    }];
    [self.containerViewPayNowFooter addSubview:self.labelPayNowFooter];
    [self.labelPayNowFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageViewPayNowFooter.mas_bottom).offset(5);
        make.centerX.equalTo(self.containerViewPayNowFooter.mas_centerX);
    }];
    
    if ([self class] == [HomeViewController class]) {
        [self.viewFooter addSubview:self.viewSeparator];
        [self.viewSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.containerViewMenuFooter.mas_bottom);
            make.centerX.equalTo(self.containerViewMenuFooter.mas_centerX);
            make.width.equalTo(self.labelMenuFooter.mas_width);
            make.height.equalTo(@2);
        }];
    }
    
    if ([self class] == [ContactUsViewController class]) {
        [self.viewFooter addSubview:self.viewSeparator];
        [self.viewSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.containerViewContactUsFooter.mas_bottom);
            make.centerX.equalTo(self.containerViewContactUsFooter.mas_centerX);
            make.width.equalTo(self.labelContactUsFooter.mas_width);
            make.height.equalTo(@2);
        }];
    }
    
    if ([self class] == [PayNowViewController class]) {
        [self.viewFooter addSubview:self.viewSeparator];
        [self.viewSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.containerViewPayNowFooter.mas_bottom);
            make.centerX.equalTo(self.containerViewPayNowFooter.mas_centerX);
            make.width.equalTo(self.labelPayNowFooter.mas_width);
            make.height.equalTo(@2);
        }];
    }
    
    UITapGestureRecognizer *gestureTapPayNow = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTap_PayNow:)];
    [self.containerViewPayNowFooter addGestureRecognizer:gestureTapPayNow];
}

#pragma mark UIResponders
- (void)gestureTap_Menu:(UITapGestureRecognizer *)gesture {
    UIViewController *destinationVC = [HomeViewController new];
    if ([self class] != [HomeViewController class]) {
        [self.navigationController pushViewController:destinationVC animated:NO];
    }
}
- (void)gestureTap_ContactUs:(UITapGestureRecognizer *)gesture {
    UIViewController *destinationVC = [ContactUsViewController new];
    if ([self class] != [ContactUsViewController class]) {
        [self.navigationController pushViewController:destinationVC animated:NO];
    }
}
- (void)gestureTap_PayNow:(UITapGestureRecognizer *)gesture {
    UIViewController *destinationVC = [PayNowViewController new];
    if ([self class] != [PayNowViewController class]) {
        [self.navigationController pushViewController:destinationVC animated:NO];
    }
}


#pragma mark - Public API



#pragma mark - Delegate Methods



@end
