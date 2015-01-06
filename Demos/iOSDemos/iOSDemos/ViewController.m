//
//  ViewController.m
//  iOSDemos
//
//  Created by amao on 14/12/2.
//  Copyright (c) 2014年 amao. All rights reserved.
//

#import "ViewController.h"


@interface DemoItem : NSObject
@property (nonatomic,strong)    NSString *title;
@property (nonatomic,strong)    NSString *vcName;
@end

@implementation DemoItem
+ (instancetype)item:(NSString *)title
                name:(NSString *)vcName
{
    DemoItem *item = [[DemoItem alloc] init];
    item.title = title;
    item.vcName= vcName;
    return item;
}
@end

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)    NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Demos";
    
    _dataSource = @[[DemoItem item:@"Manual AutoLayout"
                              name:@"M80AutoLayoutViewController"],
                    [DemoItem item:@"Custom Present ViewController in iOS8"
                              name:@"M80PresentViewController"]];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [self.navigationController.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoItem *item = [_dataSource objectAtIndex:[indexPath row]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = item.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoItem *item = [_dataSource objectAtIndex:[indexPath row]];
    NSString *vcName = item.vcName;
    id vc = [[NSClassFromString(vcName) alloc] init];
    if ([vc isKindOfClass:[UIViewController class]])
    {
        [self.navigationController pushViewController:(UIViewController *)vc
                                             animated:YES];
    }

}


@end
