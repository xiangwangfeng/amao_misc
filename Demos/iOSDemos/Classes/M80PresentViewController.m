//
//  M80PresentViewController.m
//  iOSDemos
//
//  Created by amao on 1/5/15.
//  Copyright (c) 2015 amao. All rights reserved.
//

#import "M80PresentViewController.h"


@interface M80ViewControllerTransitioningDelegate : NSObject<UIViewControllerTransitioningDelegate>

@end

@implementation M80ViewControllerTransitioningDelegate

@end

@interface M80CustomPresentationController : UIPresentationController

@end

@implementation M80CustomPresentationController

@end

@implementation M80PresentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Custom Presentation" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 200, 300, 30)];
    [button addTarget:self
               action:@selector(onPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)onPressed:(id)sender
{
    
}
@end
