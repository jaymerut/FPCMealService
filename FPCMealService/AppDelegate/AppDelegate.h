//
//  AppDelegate.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/6/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "SideMenuViewController.h"
#import "SWRevealViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SWRevealViewController *viewController;
@property (strong, nonatomic) HomeViewController *frontViewController;
@property (strong, nonatomic) SideMenuViewController *rearViewController;

@end

