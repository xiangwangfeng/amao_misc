//
//  M80ShowViewController.m
//  iOSDemos
//
//  Created by amao on 1/6/15.
//  Copyright (c) 2015 amao. All rights reserved.
//

#import "M80ShowViewController.h"

@interface M80ShowViewController ()
@property (nonatomic,strong)    UIImageView *imageView;
@end

@implementation M80ShowViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar"]];
    [self.view addSubview:_imageView];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [_imageView setCenter:CGPointMake(CGRectGetWidth(self.view.bounds) / 2, CGRectGetHeight(self.view.bounds) / 2)];
}
@end
