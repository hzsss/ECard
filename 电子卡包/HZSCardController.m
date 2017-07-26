//
//  HZSCardController.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/25.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSCardController.h"

@interface HZSCardController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HZSCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.imageView.bounds];
    self.imageView.layer.cornerRadius = 10.0;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.imageView.layer.shadowOffset = CGSizeMake(0, 0);
    self.imageView.layer.shadowOpacity = 0.5;
    self.imageView.layer.shadowRadius = 10.0;
    self.imageView.layer.shadowPath = shadowPath.CGPath;
}
@end
