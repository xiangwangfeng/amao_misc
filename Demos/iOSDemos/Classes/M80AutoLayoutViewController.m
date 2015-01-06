//
//  AutoLayoutViewController.m
//  iOSDemos
//
//  Created by amao on 14/12/2.
//  Copyright (c) 2014年 amao. All rights reserved.
//

#import "M80AutoLayoutViewController.h"



//手写Layout..不使用用VFL...
@implementation M80AutoLayoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //边边角角停靠
    NSArray *texts              = @[@"left-top",@"right-top",@"left-bottom",@"right-bottom"];
    NSArray *hAttributes        = @[@(NSLayoutAttributeLeft),@(NSLayoutAttributeRight),@(NSLayoutAttributeLeft),@(NSLayoutAttributeRight)];
    NSArray *hOffsets           = @[@(25),@(-25),@(25),@(-25)];
    NSArray *vAttributes        = @[@(NSLayoutAttributeTop),@(NSLayoutAttributeTop),@(NSLayoutAttributeBottom),@(NSLayoutAttributeBottom)];
    NSArray *vOffsets           = @[@(100),@(100),@(-100),@(-100)];
    
    
    NSArray *bkColors           = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor orangeColor]];
    
    for (NSUInteger i = 0; i < [texts count]; i++)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 23)];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.text = [texts objectAtIndex:i];
        label.backgroundColor = [bkColors objectAtIndex:i];
        [self.view addSubview:label];
        NSLayoutConstraint *h = [NSLayoutConstraint constraintWithItem:label
                                                             attribute:[[hAttributes objectAtIndex:i] integerValue]
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:[[hAttributes objectAtIndex:i] integerValue]
                                                            multiplier:1
                                                              constant:[[hOffsets objectAtIndex:i] integerValue]];
        
        NSLayoutConstraint *v = [NSLayoutConstraint constraintWithItem:label
                                                             attribute:[[vAttributes objectAtIndex:i] integerValue]
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:[[vAttributes objectAtIndex:i] integerValue]
                                                            multiplier:1
                                                              constant:[[vOffsets objectAtIndex:i] integerValue]];
        
        [self.view addConstraint:h];
        [self.view addConstraint:v];
    
    }
    
    //中间 大小成比例
    {
        UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
        centerView.translatesAutoresizingMaskIntoConstraints = NO;
        centerView.backgroundColor = [UIColor purpleColor];
        [self.view addSubview:centerView];
        
        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:centerView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.5
                                                                  constant:-100];
        
        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:centerView
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1
                                                                   constant:150];
        
        
        NSLayoutConstraint *h = [NSLayoutConstraint constraintWithItem:centerView
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeCenterX
                                                            multiplier:1
                                                              constant:0];
        
        NSLayoutConstraint *v =  [NSLayoutConstraint constraintWithItem:centerView
                                                              attribute:NSLayoutAttributeCenterY
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeCenterY
                                                             multiplier:1
                                                               constant:0];
        
        [self.view addConstraint:h];
        [self.view addConstraint:v];
        [self.view addConstraint:width];
        [self.view addConstraint:height];
    }
    
    {
        UIView *leftView = nil;
        for (NSInteger i = 0 ; i < 3; i++)
        {
            UIView *thirdSizeView = [[UIView alloc] init];
            thirdSizeView.translatesAutoresizingMaskIntoConstraints = NO;
            thirdSizeView.backgroundColor = [UIColor yellowColor];
            [self.view addSubview:thirdSizeView];
            
            NSLayoutConstraint *w = [NSLayoutConstraint constraintWithItem:thirdSizeView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1.0/3
                                                                  constant:-13.3333];
            
            NSLayoutConstraint *h = [NSLayoutConstraint constraintWithItem:thirdSizeView
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1.0/6
                                                                  constant:-10];
            
            NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:thirdSizeView
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1
                                                                    constant:200];
            
            if (leftView)
            {
                NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:thirdSizeView
                                                                        attribute:NSLayoutAttributeLeft
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:leftView
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1
                                                                         constant:10];
                [self.view addConstraint:left];
            }
            else
            {
                NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:thirdSizeView
                                                                        attribute:NSLayoutAttributeLeft
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeLeft
                                                                       multiplier:1
                                                                         constant:10];
                [self.view addConstraint:left];
            }
            
            
            [self.view addConstraint:top];
            [self.view addConstraint:w];
            [self.view addConstraint:h];
            
            leftView = thirdSizeView;
        }

        
        
    }
}


@end
