//
//  ViewController.m
//  ScrollerViewPaging
//
//  Created by Mac on 17/5/18.
//  Copyright © 2017年 dpx. All rights reserved.
//
#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *pageScrollerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.pageScrollerView];
    [self loadingImageView];
}
- (UIScrollView *)pageScrollerView {
    if (!_pageScrollerView) {
        _pageScrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(40, (KHeight - 110) / 2, KWidth - 80, 110)];
        _pageScrollerView.clipsToBounds = NO;
        _pageScrollerView.pagingEnabled = YES;
        _pageScrollerView.showsHorizontalScrollIndicator = NO;
    }
    return _pageScrollerView;
}
- (void)loadingImageView {

    CGFloat width = _pageScrollerView.frame.size.width;
    CGFloat height = _pageScrollerView.frame.size.height;

    for (int idx = 0; idx < 3; idx++) {
        CGFloat x = idx * width;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, width, height)];
        imageView.frame = CGRectInset(imageView.frame, 3.5, 0);
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd.jpg", idx + 1]];
        [_pageScrollerView addSubview:imageView];
    }
    _pageScrollerView.contentSize = CGSizeMake(width * 3, height);
    _pageScrollerView.contentInset = UIEdgeInsetsMake(_pageScrollerView.contentInset.top, -30, _pageScrollerView.contentInset.bottom, -30);
}
@end
