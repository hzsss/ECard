//
//  HZSStoreCell.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/16.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSStoreCell.h"
#import "HZSStore.h"
#import "TKAlertCenter.h"

@interface HZSStoreCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
- (IBAction)addStore;

@end

@implementation HZSStoreCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"store";
    
    HZSStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HZSStoreCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setStoreData:(HZSStore *)storeData {
    _storeData = storeData;
    
    self.iconView.image = [UIImage imageNamed:storeData.icon];
    self.nameLabel.text = storeData.name;
    self.introLabel.text = storeData.intro;
    self.distanceLabel.text = storeData.distance;
}
- (IBAction)addStore {
    [[TKAlertCenter defaultCenter] postAlertWithMessage:@"添加卡片成功"];
}
@end
