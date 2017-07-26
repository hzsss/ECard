//
//  HZSHomeController.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/16.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "HZSHomeController.h"
#import "HZSHeaderView.h"
#import "HZSStore.h"
#import "HZSStoreCell.h"
#import "HZSDetailController.h"

@interface HZSHomeController ()<CLLocationManagerDelegate>
@property (nonatomic, strong) NSArray *stores;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, copy) NSString *currentCity;
@property (nonatomic, weak) UIButton *rightBtn;
@end

@implementation HZSHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeLocationService];
    
    self.tableView.tableHeaderView = [HZSHeaderView headerView];
    
    self.tableView.rowHeight = 80;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 60, 25);
//    leftBtn.backgroundColor = [UIColor redColor];
    [leftBtn setImage:[UIImage imageNamed:@"pic"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"picH"] forState:UIControlStateHighlighted];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 60, 25);
    [rightBtn setImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"locationH"] forState:UIControlStateHighlighted];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    [rightBtn addTarget:self action:@selector(positions) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = rightBtn;
}

- (void)initializeLocationService {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = kCLHeadingFilterNone;
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (void)positions {
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        NSLog(@"requestAlwaysAuthorization");
        [self.locationManager requestAlwaysAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    NSLog(@"start GPS");
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"定位失败");
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"允许\"定位\"提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开定位设置
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//        [[UIApplication sharedApplication] openURL:settingsURL];
        [[UIApplication sharedApplication] openURL:settingsURL options:nil completionHandler:nil];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:ok];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    //当前所在城市的坐标值
    CLLocation *currLocation = [locations lastObject];
    
    NSLog(@"经度=%f 纬度=%f 高度=%f", currLocation.coordinate.latitude, currLocation.coordinate.longitude, currLocation.altitude);

    //根据经纬度反向地理编译出地址信息
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    
    [geoCoder reverseGeocodeLocation:currLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSLog(@"%@", placemark.name);
            
            NSString *city = placemark.locality;
            if (!city) {
                city = placemark.administrativeArea;
            }
            NSLog(@"city=%@", city);
            
            [self.rightBtn setTitle:city forState:UIControlStateNormal];
        } else if (error == nil && [placemarks count] == 0) {
            NSLog(@"No results were returned.");
        } else if (error != nil) {
            NSLog(@"An error occurred = %@", error);
        }
        
    }];
    [self.locationManager stopUpdatingLocation];
}

- (NSArray *)stores {
    if (_stores == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"stores.plist" ofType:nil]];
        
        NSMutableArray *storeArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            HZSStore *store = [HZSStore storeWithDict:dict];
            [storeArray addObject:store];
        }
        _stores = storeArray;
    }
    return _stores;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stores.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HZSStoreCell *cell = [HZSStoreCell cellWithTableView:tableView];
    
    cell.storeData = self.stores[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HZSDetailController *detailCv = [[HZSDetailController alloc] init];
    
    [self.navigationController pushViewController:detailCv animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
