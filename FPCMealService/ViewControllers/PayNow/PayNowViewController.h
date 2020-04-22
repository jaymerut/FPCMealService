//
//  PayNowViewController.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/8/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "BaseViewController.h"

// Delegates

// Utilities
#import <Stripe/Stripe.h>
#import <MessageUI/MessageUI.h>

// Globals

// Classes

// Classes - Models

// Classes - Views

// Classes - View Controllers

// Class Extensions

// Definitions


@interface PayNowViewController : BaseViewController <PKPaymentAuthorizationViewControllerDelegate, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate>


#pragma mark - Custom Delegates


#pragma mark - Initialization


#pragma mark - Properties
@property (strong, nonatomic) NSMutableArray *items;


#pragma mark - Public API



@end
