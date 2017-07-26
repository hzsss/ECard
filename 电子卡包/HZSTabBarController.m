//
//  HZSTabBarController.m
//  电子卡包
//
//  Created by 灿灿 on 17/6/25.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSTabBarController.h"
#import "HZSTabBarButton.h"
#import "HZSTabBar.h"

@interface HZSTabBarController ()<HZSTabBarDelegate>

@end

@implementation HZSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar removeFromSuperview];
    
    // 1.创建自己的tabBar
    HZSTabBar *myTabBar = [[HZSTabBar alloc] init];
    myTabBar.frame = self.tabBar.frame;
    myTabBar.delegate = self;
    
    myTabBar.backgroundColor = [UIColor whiteColor];
    // 2.将tabBar添加到父类中
    [self.view addSubview:myTabBar];
    
    // 3.设置代理
    myTabBar.delegate = self;
    
    // 4.添加对应个数的按钮
    for (int i=0; i<self.viewControllers.count; i++) {
        NSString *name = [NSString stringWithFormat:@"tabbar%d", i+1];
        NSString *selName = [NSString stringWithFormat:@"tabbar%dHL", i+1];
        
        [myTabBar addTabBarButtonWithName:name selName:selName];
    }
    
}

- (void)tabBar:(HZSTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to{
    self.selectedIndex = to;
}
@end
