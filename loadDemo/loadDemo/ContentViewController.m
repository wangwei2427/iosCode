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
