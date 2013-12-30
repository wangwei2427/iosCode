//
//  ContentViewController.m
//  loadDemo
//
//  Created by Wei Wang on 12/14/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "ContentViewController.h"
#import "LoadViewController.h"
#import "MenuViewController.h"
#import "TabViewController.h"
#import "CoreDataViewController.h"

@interface ContentViewController ()
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *dataArray;
@end

@implementation ContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
    self.dataArray = [[NSArray alloc] initWithContentsOfFile:path];
    
   // UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    self.navigationController.navigationItem.title=@"titile";
    
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.dataArray.count;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPat{
   static NSString *cellName = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    NSString *str = self.dataArray[indexPat.row];
    cell.textLabel.text = str;
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            LoadViewController *load = [[LoadViewController alloc] init];
            [self.navigationController pushViewController:load animated:YES];
        }
            break;
        case 1: {
            MenuViewController *menu = [[MenuViewController alloc] init];
            [self.navigationController pushViewController:menu animated:YES];
        }
            break;
        case 2: {
            
            NSArray *imageArray = [NSArray arrayWithObjects:@"tab_bar_2",@"tab_bar_1",@"tab_bar_3",@"tab_bar_4",@"tab_bar_5",@"tab_bar_6",@"tab_bar_7",@"tab_bar_4", nil];
            
            NSMutableArray *vcArray = [[NSMutableArray alloc] initWithCapacity:0];
            for (int i = 0; i < 6; i++) {
                UIViewController *vc = [[UIViewController alloc] init];
                vc.view.backgroundColor = [UIColor yellowColor];
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
                label.text = [NSString stringWithFormat:@"%d",i];
                label.font = [UIFont systemFontOfSize:30];
                [vc.view addSubview:label];
                [vcArray addObject:vc];
            }
            TabViewController *tabbar = [[TabViewController alloc] initWithViewArray:vcArray imageArray:imageArray];
            [self.navigationController pushViewController:tabbar animated:YES];
            break;
        }
        case 3: {
            CoreDataViewController *coreDataViewController = [[CoreDataViewController alloc] initWithNibName:@"CoreDataViewController" bundle:nil];
            [self.navigationController pushViewController:coreDataViewController animated:YES];
        
        }
        default:
            break;
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
