//
//  HZSCollection.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/21.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSCollection.h"

@implementation HZSCollection
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)collectionWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
