//
//  M80PresentViewController.m
//  iOSDemos
//
//  Created by amao on 1/5/15.
//  Copyright (c) 2015 amao. All rights reserved.
//

#import "M80PresentViewController.h"
#import "M80ShowViewController.h"


#pragma mark - Animator

@interface PresentAnimator : NSObject<UIViewControllerAnimatedTransitioning>
@end

@implementation PresentAnimator
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

@interface M80PresentViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic,strong)    PresentAnimator *presnetAnimator;
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
    _presnetAnimator = [PresentAnimator new];
}

- (void)onPressed:(id)sender
{
    M80ShowViewController *vc = [M80ShowViewController new];
    vc.transitioningDelegate = self;
    
    [self.navigationController presentViewController:vc
                                            animated:YES
                                          completion:nil];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;
{
    return _presnetAnimator;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return _presnetAnimator;
}
@end
