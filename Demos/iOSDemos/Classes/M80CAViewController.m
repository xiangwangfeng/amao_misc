//
//  M80CAViewController.m
//  iOSDemos
//
//  Created by amao on 15/1/5.
//  Copyright (c) 2015年 amao. All rights reserved.
//

#import "M80CAViewController.h"

@implementation M80CAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    layer.borderWidth = 2;
    layer.borderColor = [UIColor yellowColor].CGColor;
    layer.backgroundColor = [UIColor redColor].CGColor;
    [layer setFrame:CGRectMake(20, 100, 50, 50)];
    layer.shadowOpacity = 1;
    layer.shadowRadius = 10;
    CGSize size = layer.shadowOffset;
    layer.shadowOffset = CGSizeMake(-10, 10);
    
    [self.view.layer addSublayer:layer];
}
@end
