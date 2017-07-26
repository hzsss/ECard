//
//  HZSMyStore.h
//  电子卡包
//
//  Created by 灿灿 on 17/7/17.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSMyStore : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *background;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)myStoreWithDict:(NSDictionary *)dict;
@end
