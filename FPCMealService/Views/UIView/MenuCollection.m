//
//  MenuCollection.m
//  FPCMealService
//
//  Created by Jayme Rutkoski on 4/7/20.
//  Copyright © 2020 jrutkosk. All rights reserved.
//

#import "MenuCollection.h"

// Delegates

// Utilities
#import <IGListKit/IGListKit.h>
#import <Masonry/Masonry.h>

// Globals

// Classes

// Classes - Models
#import "IGListDiffableArray.h"

// Classes - Views

// Classes - View Controllers

// Classes - Controllers
#import "MenuSectionController.h"

// Class Extensions
#import "UIColor+ExtensionMethods.h"

// Definitions


@interface MenuCollection () <IGListAdapterDataSource>

@property (strong, nonatomic) IGListAdapter *adapter;
@property (strong, nonatomic) UICollectionView *collectionView;

@end



@implementation MenuCollection


#pragma mark - Initialization
- (void)customInitMenuCollection {
    
    // Setup
    [self setupMenuCollection];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self customInitMenuCollection];
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self customInitMenuCollection];
        
    }
    return self;
}



#pragma mark - Properties
- (IGListAdapter *)adapter {
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self workingRangeSize:0];
        _adapter.collectionView = self.collectionView;
        _adapter.dataSource = self;
    }
    return _adapter;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowlayout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:flowlayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

- (void)setMenuItems:(NSArray *)menuItems {
    _menuItems = menuItems;
    
    [self.adapter performUpdatesAnimated:YES completion:nil];
}


#pragma mark - Private API
- (void)setupMenuCollection {
    
    // Self
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    
    // CollectionView
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}



#pragma mark - Public API



#pragma mark - Delegate Methods
#pragma mark IGListAdapterDataSource Methods
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    NSMutableArray *menuItems = [NSMutableArray new];
    if (!!self.menuItems.count) {
        [menuItems addObjectsFromArray:self.menuItems];
    }
    if (!!menuItems.count) {
        return @[[[IGListDiffableArray alloc] initWithArray:menuItems]];
    }
    
    return @[];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    MenuSectionController *sectionController = [[MenuSectionController alloc] init];
    sectionController.delegate = self.viewController;
    return sectionController;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"No Menu Items Available"];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    return label;
}

@end
