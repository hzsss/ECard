//
//  HZSDetailController.m
//  电子卡包
//
//  Created by 灿灿 on 17/7/19.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "HZSDetailController.h"
#import "HZSCollectionCell.h"
#import "HZSCollection.h"

@interface HZSDetailController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIImageView *cardView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *collections;

@end

@implementation HZSDetailController
- (NSArray *)collections {
    if (_collections == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"collections.plist" ofType:nil]];
        NSMutableArray *collectionArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            HZSCollection *collection = [HZSCollection collectionWithDict:dict];
            [collectionArray addObject:collection];
        }
        _collections = collectionArray;
    }
    return _collections;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"嘻嘻";
    
    self.cardView.layer.cornerRadius = 15;
    self.cardView.layer.masksToBounds = YES;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(15, 20, 15, 20);
    layout.itemSize = CGSizeMake(177,100);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 300, 414, 426) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    UINib *cellNib = [UINib nibWithNibName:@"HZSCollectionCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"collection"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.collections.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HZSCollectionCell *cell = [HZSCollectionCell cellWithCollectionView:collectionView cellForItemAtIndexPath:indexPath];
    cell.collectionData = self.collections[indexPath.row];
    
    return cell;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
