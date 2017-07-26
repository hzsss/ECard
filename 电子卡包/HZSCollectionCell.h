//
//  HZSCollectionCell.h
//  电子卡包
//
//  Created by 灿灿 on 17/7/21.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HZSCollection;
@interface HZSCollectionCell : UICollectionViewCell
@property (nonatomic, strong) HZSCollection *collectionData;
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
