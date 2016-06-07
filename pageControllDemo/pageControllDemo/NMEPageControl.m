//
//  NMEPageControl.m
//  pageControllDemo
//
//  Created by qfpayJakeMeng on 16/5/30.
//  Copyright © 2016年 mountainKing. All rights reserved.
//

#import "NMEPageControl.h"

@interface NMEPageControl(){
    UIView *_selectedView;
    UIView *_emptyView;
    CGSize _pointSize;
    UIColor *_borderColor;
}

@end

@implementation NMEPageControl

- (void)numberOfPages:(NSInteger)numberOfPages pointSize:(CGSize)size borderColor:(UIColor *)color {
    self.backgroundColor = [UIColor clearColor];
    _numberOfPages = numberOfPages;
    _borderColor = color;
    _pointSize = size;
    [self setupPointViews:size];
}

//- (void)setNumberOfPages:(NSInteger)numberOfPages {
//    
//}

- (void)setupPointViews:(CGSize)size {
    [self updateFrames];
    [self addPointViews];
}

- (void)updateFrames {
    CGRect newFrame = self.frame;
    newFrame.size.width = 10 * _numberOfPages + 8 * (_numberOfPages - 1);
    newFrame.size.height = _pointSize.height;
    self.frame = newFrame;
}

- (void)addPointViews {
    for (int index = 0; index < _numberOfPages; index ++) {
        UIView *view = [[UIView alloc] init];
        view.frame =  CGRectMake((_pointSize.width + 8)*index, 0, _pointSize.width, _pointSize.height);
        view.backgroundColor = [UIColor clearColor];
        view.layer.borderWidth = 1.0;
        view.layer.borderColor = _borderColor.CGColor;
        view.layer.cornerRadius = 5.0;
        view.layer.masksToBounds = YES;
        [self addSubview:view];
    }
    [self setCurrentPage:0];
}

- (void)setCurrentPage:(NSInteger)currentPage {
    if (!_selectedView) {
        _selectedView = [[UIView alloc] init];
        _selectedView.frame = CGRectMake(1 + (_pointSize.width + 8)*currentPage , 1 , 8, 8);
        _selectedView.backgroundColor = _borderColor;
        _selectedView.layer.cornerRadius = 4.0;
        _selectedView.layer.masksToBounds = YES;
        [self addSubview:_selectedView];
    }
    _selectedView.frame = CGRectMake(1 + (_pointSize.width + 8)*currentPage , 1 , 8, 8);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
