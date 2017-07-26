//
//  HZSCollectionCell.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/21.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSCollectionCell.h"
#import "HZSCollection.h"

@interface HZSCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation HZSCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"collection";
    
    HZSCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor blueColor];
    return cell;
}

- (void)setCollectionData:(HZSCollection *)collectionData {
    _collectionData = collectionData;
    self.imageView.image = [UIImage imageNamed:collectionData.image];
    self.nameLabel.text = collectionData.name;
}
@end
