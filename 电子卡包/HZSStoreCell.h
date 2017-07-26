//
//  HZSStoreCell.h
//  电子卡包
//
//  Created by 灿灿 on 17/7/16.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZSStore;
@interface HZSStoreCell : UITableViewCell
@property (nonatomic, strong) HZSStore *storeData;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
