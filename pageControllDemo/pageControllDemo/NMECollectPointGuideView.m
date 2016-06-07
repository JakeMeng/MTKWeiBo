//
//  NMECollectPointGuideView.m
//  pageControllDemo
//
//  Created by qfpayJakeMeng on 16/5/30.
//  Copyright © 2016年 mountainKing. All rights reserved.
//

#import "NMECollectPointGuideView.h"
#import "NMEPointIntroCollectionViewCell.h"
#import "NMEPageControl.h"

@interface NMECollectPointGuideView()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UIScrollViewDelegate
>
{
    __weak IBOutlet UICollectionView *_collectionView;
    
    
    __weak IBOutlet NMEPageControl *_pageControl;

    UICollectionViewFlowLayout *_layout;
    NSArray *arrImages;
}

@end

@implementation NMECollectPointGuideView

- (void)awakeFromNib {
    [self setupCollectionView];
    [self setupPageControl];
}

- (NSArray *)arrImages {
    NSArray *images = @[@"img_guide_1",@"img_guide_2",@"img_guide_3",@"img_guide_4",@"img_guide_5",@"img_guide_6"];
    return images;
}

- (void)setupCollectionView {
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"NMEPointIntroCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"NMEPointIntroCollectionViewCell"];
    _layout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView.collectionViewLayout = _layout;
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 38*2;
    CGFloat height = width * 343 / 300;
    _layout.itemSize = CGSizeMake(width, height);
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _layout.minimumInteritemSpacing = 0;
    _layout.minimumLineSpacing = 0;
    _collectionView.pagingEnabled = YES;
    [_collectionView reloadData];
}

- (void)setupPageControl {
    [_pageControl numberOfPages:6 pointSize:CGSizeMake(10, 10) borderColor:[UIColor whiteColor]];
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 38*2;
    CGFloat height = width * 343 / 300;
    _pageControl.center = CGPointMake(width/2, height - 5);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NMEPointIntroCollectionViewCell *cell = (NMEPointIntroCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"NMEPointIntroCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        [_collectionView registerNib:[UINib nibWithNibName:@"NMEPointIntroCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"NMEPointIntroCollectionViewCell"];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NMEPointIntroCollectionViewCell" forIndexPath:indexPath];
    }
    cell.inrtoImageView.image = [UIImage imageNamed:self.arrImages[indexPath.row]];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 38*2;
    NSInteger index = (int)(scrollView.contentOffset.x/width);
    [_pageControl setCurrentPage:index];
}

@end
