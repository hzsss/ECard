//
//  HZSWalletCell.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/17.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSWalletCell.h"
#import "HZSMyStore.h"

@interface HZSWalletCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *background;

@end

@implementation HZSWalletCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"myStore";
    
    HZSWalletCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HZSWalletCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setMyStoreData:(HZSMyStore *)myStoreData {
    _myStoreData = myStoreData;
    
    self.icon.image = [UIImage imageNamed:myStoreData.icon];
    self.name.text = myStoreData.name;
    self.background.image = [UIImage imageNamed:myStoreData.background];
}
@end
