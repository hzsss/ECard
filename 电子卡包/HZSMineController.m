//
//  HZSMineController.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/17.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSMineController.h"
#import "HZSHeaderMineView.h"
@interface HZSMineController ()

@end

@implementation HZSMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = [HZSHeaderMineView headerMineView];
//    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
