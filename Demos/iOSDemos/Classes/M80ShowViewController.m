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
@property (nonatomic,strong)    UIButton *actionButton;
@end

@implementation M80ShowViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar"]];
    [self.view addSubview:_imageView];
    self.view.backgroundColor = [UIColor redColor];
    
    _actionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_actionButton setTitle:@"Action" forState:UIControlStateNormal];
    [_actionButton setFrame:CGRectMake(0, 0, 200, 30)];
    [_actionButton addTarget:self
                      action:@selector(action:)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_actionButton];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    CGPoint center = CGPointMake(CGRectGetWidth(self.view.bounds) / 2, CGRectGetHeight(self.view.bounds) / 2);
    [_imageView setCenter:center];
    [_actionButton setCenter:CGPointMake(center.x, center.y + 200)];
}

- (void)action:(id)sender
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}
@end
