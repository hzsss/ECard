//
//  HZSWalletController.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/17.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSWalletController.h"
#import "HZSMyStore.h"
#import "HZSWalletCell.h"
#import "HZSCardController.h"
@interface HZSWalletController ()
@property (nonatomic, strong) NSArray *myStores;

@end

@implementation HZSWalletController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 60;
    
//    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];

}

- (NSArray *)myStores {
    if (_myStores == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"myStores.plist" ofType:nil]];
        
        NSMutableArray *myStoresArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            HZSMyStore *myStore = [HZSMyStore myStoreWithDict:dict];
            [myStoresArray addObject:myStore];
        }
        _myStores = myStoresArray;
    }
    return _myStores;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.myStores.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HZSWalletCell *cell = [HZSWalletCell cellWithTableView:tableView];
    
    HZSMyStore *myStore = self.myStores[indexPath.row];
    
    cell.myStoreData = myStore;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HZSCardController *cardCv = [[HZSCardController alloc] init];
    [self.navigationController pushViewController:cardCv animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}
@end
