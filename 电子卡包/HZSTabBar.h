//
//  HZSTabBar.h
//  电子卡包
//
//  Created by 灿灿 on 17/6/25.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZSTabBar;
@protocol HZSTabBarDelegate <NSObject>
@optional
- (void)tabBar:(HZSTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to;

@end
@interface HZSTabBar : UIView
@property (nonatomic, weak) id<HZSTabBarDelegate> delegate;
- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName;

@end
