//
//  NMEPageControl.h
//  pageControllDemo
//
//  Created by qfpayJakeMeng on 16/5/30.
//  Copyright © 2016年 mountainKing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMEPageControl : UIView

@property (nonatomic,assign) NSInteger numberOfPages;
@property (nonatomic,assign) NSInteger currentPage;

- (void)numberOfPages:(NSInteger)numberOfPages pointSize:(CGSize)size borderColor:(UIColor *)color;

@end
