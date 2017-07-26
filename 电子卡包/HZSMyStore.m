//
//  HZSMyStore.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/17.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSMyStore.h"

@implementation HZSMyStore
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)myStoreWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
