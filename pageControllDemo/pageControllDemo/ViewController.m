//
//  ViewController.m
//  pageControllDemo
//
//  Created by qfpayJakeMeng on 16/5/30.
//  Copyright © 2016年 mountainKing. All rights reserved.
//

#import "ViewController.h"
#import "NMECollectPointGuideView.h"

@interface ViewController () {
    NMECollectPointGuideView *_guideView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _guideView = (NMECollectPointGuideView *)[[[NSBundle mainBundle] loadNibNamed:@"NMECollectPointGuideView" owner:self options:NULL] firstObject];
    _guideView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:_guideView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
