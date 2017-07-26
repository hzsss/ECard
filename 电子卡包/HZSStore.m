//
//  HZSStore.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/16.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSStore.h"

@implementation HZSStore
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)storeWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
