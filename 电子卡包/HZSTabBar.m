//
//  HZSTabBar.m
//  电子卡包
//
//  Created by 灿灿 on 17/6/25.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSTabBar.h"
#import "HZSTabBarButton.h"
@interface HZSTabBar()
@property (nonatomic, weak) HZSTabBarButton *selectedButton;

@end

@implementation HZSTabBar
- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName {
    // 添加新按钮
    HZSTabBarButton *button = [HZSTabBarButton buttonWithType:UIButtonTypeCustom];
    
    // 设置按钮图片
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    // 把按钮添加到tabBar
    [self addSubview:button];
    
    // 设置按钮点击事件
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
}
// 子控件的Frame在这里设置 控件frame发生变化时会调用。
- (void)layoutSubviews {
    [super layoutSubviews];
    unsigned long count = self.subviews.count;
    
    for (int i=0; i<count; i++) {
        // 取出对应的按钮
        HZSTabBarButton *button = self.subviews[i];
        button.tag = i;
        
        // 设置按钮尺寸
        CGFloat buttonY = 0;
        CGFloat buttonH = self.frame.size.height;
        CGFloat buttonW = self.frame.size.width / count;
        CGFloat buttonX = buttonW * i;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);

        // 默认选中第一个按钮
        if (i == 0) {
            [self buttonClick:button];
        }
    }
}

- (void)buttonClick:(HZSTabBarButton *)button {
    // 0.设置代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    // 1.让当前按钮取消选中
    self.selectedButton.selected = NO;
    
    // 2.让新点击的按钮选中
    button.selected = YES;
    
    // 3.让新点击的按钮成为"当前按钮"
    self.selectedButton = button;
}
@end
