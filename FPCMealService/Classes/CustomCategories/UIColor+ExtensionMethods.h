//
//  UIColor+ExtensionMethods.h
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ExtensionMethods)

#pragma mark - Public API
#pragma mark Instance Methods
- (UIImage *)image;

#pragma mark Shared Methods
+ (UIColor *)colorWithHEX:(NSInteger)hex;
+ (UIColor *)colorWithHEX:(NSInteger)hex withAlpha:(CGFloat)alpha;

@end
