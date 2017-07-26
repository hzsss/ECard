//
//  HZSStore.h
//  电子卡包
//
//  Created by 灿灿 on 17/7/16.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSStore : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *distance;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)storeWithDict:(NSDictionary *)dict;
@end
