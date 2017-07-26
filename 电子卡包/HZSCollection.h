//
//  HZSCollection.h
//  电子卡包
//
//  Created by 灿灿 on 17/7/21.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZSCollection : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)collectionWithDict:(NSDictionary *)dict;
@end
