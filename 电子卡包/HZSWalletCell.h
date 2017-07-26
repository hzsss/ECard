//
//  HZSWalletCell.h
//  电子卡包
//
//  Created by 灿灿 on 17/7/17.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZSMyStore;
@interface HZSWalletCell : UITableViewCell
@property (nonatomic, strong) HZSMyStore *myStoreData;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
