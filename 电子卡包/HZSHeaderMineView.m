//
//  HZSHeaderMineView.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/17.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSHeaderMineView.h"

@interface HZSHeaderMineView()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation HZSHeaderMineView

+ (instancetype)headerMineView {
    return [[[NSBundle mainBundle] loadNibNamed:@"HZSHeaderMineView" owner:nil options:nil] lastObject];
}
@end
