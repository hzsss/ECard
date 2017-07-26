//
//  HZSHeaderView.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/16.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSHeaderView.h"
#define ImageCount 5
@interface HZSHeaderView() <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSTimer *timer;

@end



@implementation HZSHeaderView

+ (instancetype)headerView {
    return [[[NSBundle mainBundle] loadNibNamed:@"HZSHeaderView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
//    [self.searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@"tabbarBkg"] forState:UIControlStateNormal];
    UIView *searchField = [[[self.searchBar.subviews firstObject] subviews] lastObject];
    searchField.layer.cornerRadius = 15;
    searchField.layer.masksToBounds = YES;
    
    self.scrollView.layer.cornerRadius = 10;
    self.scrollView.layer.masksToBounds = YES;
    
    CGFloat imageW = self.scrollView.frame.size.width;
    CGFloat imageH = self.scrollView.frame.size.height;
    CGFloat imageY = 0;
    
    for (int i=0; i<ImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        CGFloat imageX = i * imageW;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        
        NSString *name = [NSString stringWithFormat:@"ad_0%d", i];
        imageView.image = [UIImage imageNamed:name];
        
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.delegate = self;
    
    CGFloat contentW = ImageCount * imageW;
    self.scrollView.contentSize = CGSizeMake(contentW, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    
    self.pageControl.numberOfPages = ImageCount;
    self.pageControl.pageIndicatorTintColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:192/255.0 green:192/255.0 blue:192/255.0 alpha:1];
    
    [self addTimer];
    
}

- (void)addTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)nextImage {
    long int page = 0;
    if (self.pageControl.currentPage == ImageCount-1) {
        page = 0;
    } else {
        page = self.pageControl.currentPage + 1;
    }
    
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scrollW = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + scrollW * 0.5) / scrollW;
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];
}


@end
