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
#import <Masonry/Masonry.h>

// Globals

// Classes
#import "StripeAPI.h"

// Classes - Models
#import "MenuItem.h"

// Classes - Views
#import "PayNowTableViewCell.h"

// Classes - View Controllers

// Class Extensions
#import "UIColor+ExtensionMethods.h"

// Definitions


@interface PayNowViewController ()

@property (strong, nonatomic) NSArray *supportedPaymentNetworks;
@property (strong, nonatomic) NSString *merchantID;

@property (strong, nonatomic) PKPaymentRequest *request;

@property (strong, nonatomic) UIButton *buttonPayNow;
@property (strong, nonatomic) UIButton *buttonPayCash;

@property (strong, nonatomic) StripeAPI *stripeAPI;

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UIView *viewColumnHeader;
@property (strong, nonatomic) UILabel *labelColumnName;
@property (strong, nonatomic) UILabel *labelColumnPrice;
@property (strong, nonatomic) UILabel *labelColumnQuantity;

@property (strong, nonatomic) NSNumber *buttonWidth;

@property (strong, nonatomic) NSNumber *applePaymentDidSucceed;

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
    
    self.buttonPayNow.hidden = !PKPaymentAuthorizationViewController.canMakePayments;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
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
- (NSNumber *) buttonWidth {
    if (!_buttonWidth) {
        _buttonWidth = [NSNumber numberWithFloat:(self.view.frame.size.width / 2.0) - 10];
    }
    return _buttonWidth;
}

- (NSArray *)supportedPaymentNetworks {
    if (!_supportedPaymentNetworks) {
        _supportedPaymentNetworks = @[PKPaymentNetworkVisa, PKPaymentNetworkMasterCard, PKPaymentNetworkAmex];
    }
    return _supportedPaymentNetworks;
}
- (NSString *)merchantID {
    if (!_merchantID) {
        _merchantID = @"merchant.com.jay.rut.FPCMealService";
    }
    return _merchantID;
}

- (PKPaymentRequest *)request {
    if (!_request) {
        _request = [PKPaymentRequest new];
        _request.merchantIdentifier = self.merchantID;
        _request.supportedNetworks = self.supportedPaymentNetworks;
        _request.merchantCapabilities = PKMerchantCapability3DS;
        _request.countryCode = @"US";
        _request.currencyCode = @"USD";
        
        NSMutableArray *array = [NSMutableArray new];
        for (MenuItem *item in self.items) {
            if (item.quantity.intValue > 0) {
                NSNumber *total = [NSNumber numberWithDouble:item.priceValue.doubleValue * item.quantity.doubleValue];
                [array addObject:[PKPaymentSummaryItem summaryItemWithLabel:item.name amount:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f", total.doubleValue]]]];
            }
        }
        _request.paymentSummaryItems = array;
    }
    return _request;
}

- (UIButton *)buttonPayNow {
    if (!_buttonPayNow) {
        _buttonPayNow = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonPayNow setImage:[UIImage imageNamed:@"apple-pay-white"] forState:UIControlStateNormal];
        
        _buttonPayNow.backgroundColor = [UIColor colorWithHEX:0x006B2C];
        
        _buttonPayNow.layer.cornerRadius = 10; // this value vary as per your desire
        _buttonPayNow.clipsToBounds = YES;
        
        _buttonPayNow.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_buttonPayNow addTarget:self action:@selector(buttonPayNow_TouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonPayNow;
}

- (UIButton *)buttonPayCash {
    if (!_buttonPayCash) {
        _buttonPayCash = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buttonPayCash setTitle:@"Pay Cash" forState:UIControlStateNormal];
        [_buttonPayCash setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _buttonPayCash.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
        
        _buttonPayCash.backgroundColor = [UIColor colorWithHEX:0x006B2C];
        
        _buttonPayCash.layer.cornerRadius = 10; // this value vary as per your desire
        _buttonPayCash.clipsToBounds = YES;
        
        _buttonPayCash.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_buttonPayCash addTarget:self action:@selector(buttonPayCash_TouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonPayCash;
}

- (StripeAPI *)stripeAPI {
    if (!_stripeAPI) {
        _stripeAPI = [StripeAPI new];
    }
    return _stripeAPI;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _tableView;
}

- (UIView *)viewColumnHeader {
    if (!_viewColumnHeader) {
        _viewColumnHeader = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _viewColumnHeader;
}
- (UILabel *)labelColumnName {
    if (!_labelColumnName) {
        _labelColumnName = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelColumnName.text = @"Name";
        _labelColumnName.font = [UIFont fontWithName:@"Optima-BoldItalic" size:24.0];
    }
    return _labelColumnName;
}
- (UILabel *)labelColumnPrice {
    if (!_labelColumnPrice) {
        _labelColumnPrice = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelColumnPrice.text = @"Price";
        _labelColumnPrice.font = [UIFont fontWithName:@"Optima-BoldItalic" size:24.0];
    }
    return _labelColumnPrice;
}
- (UILabel *)labelColumnQuantity {
    if (!_labelColumnQuantity) {
        _labelColumnQuantity = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelColumnQuantity.text = @"Quantity";
        _labelColumnQuantity.font = [UIFont fontWithName:@"Optima-BoldItalic" size:24.0];
    }
    return _labelColumnQuantity;
}

#pragma mark - Private API
- (void)setupPayNowViewController {
    self.labelHeader.text = @"Pay Now";
    
    [self.scrollView addSubview:self.buttonPayNow];
    [self.buttonPayNow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.viewFooter.mas_top).offset(-5);
        make.left.equalTo(self.scrollView.mas_left).offset(5);
        make.right.equalTo(self.scrollView.mas_centerX).offset(-5);
        make.width.equalTo(self.buttonWidth);
        make.height.equalTo(@40);
    }];
    
    [self.scrollView addSubview:self.buttonPayCash];
    [self.buttonPayCash mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.viewFooter.mas_top).offset(-5);
        make.right.equalTo(self.scrollView.mas_right).inset(10);
        make.left.equalTo(self.scrollView.mas_centerX).offset(5);
        make.width.equalTo(self.buttonWidth);
        make.height.equalTo(@40);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.viewHeader.mas_bottom);
        make.left.equalTo(self.scrollView.mas_left);
        make.right.equalTo(self.scrollView.mas_right);
        make.bottom.equalTo(self.buttonPayNow.mas_top).offset(-5);
    }];
    
    [self.viewColumnHeader addSubview:self.labelColumnName];
    [self.labelColumnName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.viewColumnHeader.mas_left).offset(10);
        make.centerY.equalTo(self.viewColumnHeader.mas_centerY);
    }];
    
    [self.viewColumnHeader addSubview:self.labelColumnPrice];
    [self.labelColumnPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.viewColumnHeader.mas_top);
        make.centerY.equalTo(self.viewColumnHeader.mas_centerY);
        make.centerX.equalTo(self.viewColumnHeader.mas_centerX);
    }];
    
    [self.viewColumnHeader addSubview:self.labelColumnQuantity];
    [self.labelColumnQuantity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.viewColumnHeader.mas_right).offset(-10);
        make.centerY.equalTo(self.viewColumnHeader.mas_centerY);
    }];
    
}

- (void)buttonPayNow_TouchUpInside:(id)sender {
    if (self.items.count > 0) {
        PKPaymentAuthorizationViewController *applePayController = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:self.request];
        applePayController.delegate = self;
        [self presentViewController:applePayController animated:YES completion:nil];
    } else {
        [self placeOrderError];
    }
}

- (void)buttonPayCash_TouchUpInside:(id)sender {
    if (self.items.count > 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Confirmation" message:[NSString stringWithFormat:@"Confirm your order of $%.2f?", self.total.doubleValue] preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Create Order" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if([MFMailComposeViewController canSendMail]) {
                MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
                mailCont.mailComposeDelegate = self;
                
                [mailCont setSubject:@"Meal Service Order Request"];
                [mailCont setToRecipients:[NSArray arrayWithObject:@"jaymerut@gmail.com"]];
                NSString *message = nil;
                for (MenuItem *item in self.items) {
                    if (message.length == 0) {
                        message = [NSString stringWithFormat:@"%@ (%@)\n", item.name, item.quantity.stringValue];
                    } else {
                        message = [NSString stringWithFormat:@"%@%@ (%@)\n", message, item.name, item.quantity.stringValue];
                    }
                }
                message = [NSString stringWithFormat:@"%@Special Requests: ", message];
                [mailCont setMessageBody:message isHTML:NO];
                [self presentViewController:mailCont animated:YES completion:nil];
                [self resetItems];
            }
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    } else {
        [self placeOrderError];
    }
}

- (BOOL)validateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (void)placeOrderError {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Cannot Place Order" message:@"No Orders Added" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Public API



#pragma mark - Delegate Methods
- (void)paymentAuthorizationViewControllerWillAuthorizePayment:(PKPaymentAuthorizationViewController *)controller {
    
}
- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                       didAuthorizePayment:(PKPayment *)payment
                                   handler:(void (^)(PKPaymentAuthorizationResult *result))completion {
    [Stripe setDefaultPublishableKey:@"pk_test_LIosq6h4KbEG8DH5wXF2sM0j00AK5Scvpj"];
    PKPaymentAuthorizationResult *result = [PKPaymentAuthorizationResult new];
    
    
    NSLog(@"Email: %@", self.total.stringValue);
    NSNumber *amount = [NSNumber numberWithDouble:self.total.doubleValue * 100];
    [self.stripeAPI getPaymentIntent:[NSString stringWithFormat:@"%d", amount.intValue] success:^(StripePaymentIntent *paymentIntent) {
        
        [self.stripeAPI confirmPayment:paymentIntent.paymentID paymentMethod:@"pm_card_visa" success:^(StripePaymentIntent *paymentIntent) {
            NSLog(@"Success");
            result.status = PKPaymentAuthorizationStatusSuccess;
            self.applePaymentDidSucceed = @YES;
            completion(result);
        } failure:^(NSError *error) {
            NSLog(@"There was an error with Stripe.");
            result.status = PKPaymentAuthorizationStatusFailure;
            completion(result);
        }];
    } failure:^(NSError *error) {
        NSLog(@"There was an error with Stripe.");
        result.status = PKPaymentAuthorizationStatusFailure;
        completion(result);
    }];
    
}
- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller {
    if (self.applePaymentDidSucceed) {
        [self resetItems];
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PayNowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PayNowTableViewCell"];
    
    if (!cell) {
        cell = [[PayNowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PayNowTableViewCell"];
    }
    
    MenuItem *item = [self.items objectAtIndex:indexPath.row];
    if (item.quantity.intValue > 0) {
        [cell updateWithItem:item];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
  return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.viewColumnHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)resetItems {
    self.total = nil;
    self.menuItems = nil;
    self.items = nil;
    self.labelTotal.text = @"$0.00";
    [self.tableView reloadData];
}


@end
