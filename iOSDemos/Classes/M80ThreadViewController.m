//
//  M80ThreadViewController.m
//  iOSDemos
//
//  Created by amao on 15/1/18.
//  Copyright (c) 2015年 amao. All rights reserved.
//

#import "M80ThreadViewController.h"

@implementation M80ThreadViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (NSInteger i = 0; i < 100; i++)
    {
        NSThread *thread = [[NSThread alloc] initWithTarget:self
                                                   selector:@selector(start:)
                                                     object:nil];
        [thread start];
    }
}

- (void)start:(id)object
{
    NSInteger i = 0;
    while (YES)
    {
        NSLog(@"%zd",i++);
    }
}
@end
