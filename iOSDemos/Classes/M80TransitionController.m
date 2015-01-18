//
//  M80TransitionController.m
//  iOSDemos
//
//  Created by amao on 1/6/15.
//  Copyright (c) 2015 amao. All rights reserved.
//

#import "M80TransitionController.h"
#import "M80ShowViewController.h"


#pragma mark - Animator

@interface PushAnimator : NSObject<UIViewControllerAnimatedTransitioning>
@end

@implementation PushAnimator
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    toViewController.view.transform =  CGAffineTransformMakeScale(0.1, 0.1);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toViewController.view.alpha = 1;
        toViewController.view.transform =  CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

@end

@interface M80TransitionController ()<UINavigationControllerDelegate>
@property (nonatomic,strong)    PushAnimator *pushAnimator;
@end

@implementation M80TransitionController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 200, 300, 30)];
    [button addTarget:self
               action:@selector(onPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.navigationController.delegate = self;
    _pushAnimator = [PushAnimator new];
}

- (void)onPressed:(id)sender
{
    M80ShowViewController *vc = [M80ShowViewController new];
    [self.navigationController pushViewController:vc
                                         animated:YES];
}

- (void)dealloc
{
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush &&
        [toVC isKindOfClass:[M80ShowViewController class]])
    {
        return _pushAnimator;
    }
    return nil;
}
@end
