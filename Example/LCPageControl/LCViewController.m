//
//  LCViewController.m
//  LCPageControl
//
//  Created by jgyhc on 06/08/2020.
//  Copyright (c) 2020 jgyhc. All rights reserved.
//

#import "LCViewController.h"
#import "LCPageControl.h"

@interface LCViewController ()<LCPageControlDelegate>
@property (weak, nonatomic) IBOutlet LCPageControl *pageControl;
@property (weak, nonatomic) IBOutlet LCPageControl *customPageControl;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger customCurrentPage;
@end

@implementation LCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _customPageControl.delegate = self;
    _pageControl.numberOfPages = 10;
    _customPageControl.numberOfPages = 10;

    _pageControl.currentPage = _currentPage;
    _customPageControl.currentPage = _customCurrentPage;
}

- (IBAction)previousPageEvent:(id)sender {
    if (_currentPage > 0) {
        _currentPage --;
        _customCurrentPage --;
        _pageControl.currentPage = _currentPage;
        _customPageControl.currentPage = _customCurrentPage;
    }

}

- (IBAction)nextPageEvent:(id)sender {
    if (_currentPage < 10) {
        _currentPage ++;
        _customCurrentPage ++;
        _pageControl.currentPage = _currentPage;
        _customPageControl.currentPage = _customCurrentPage;
    }
}


- (UIControl *)customPageItemWithPageControl:(LCPageControl *)pageControl index:(NSInteger)index {
    return ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"0" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        button;
    });
}

- (CGSize)customPageItemSizeWithPageControl:(LCPageControl *)pageControl index:(NSInteger)index {
    return CGSizeZero;
}

- (CGFloat)customPageItemSpaceingWithPageControl:(LCPageControl *)pageControl {
    return 3;
}

@end
