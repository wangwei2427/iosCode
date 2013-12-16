//
//  MenuViewController.m
//  loadDemo
//
//  Created by Wei Wang on 12/13/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "MenuViewController.h"
#import "MyAlterView.h"
#import "AligmentLabel.h"
#import "SpotLightButton.h"
@interface MenuViewController ()

@end

@implementation MenuViewController
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
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(30, 50, 100, 50);
    button1.tag = 1;
    [button1 setTitle:@"one button" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(showAlterView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(150, 50, 100, 50);
    button2.tag = 2;
    [button2 setTitle:@"two button" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(showAlterView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    
    AligmentLabel *label = [[AligmentLabel alloc] initWithFrame:CGRectMake(30, 100, 260, 100)];
    //label.backgroundColor = [UIColor clearColor];
    label.backgroundColor = [UIColor orangeColor];
    label.verticalAlignment = textAligmentTop;
    label.numberOfLines = 10;
    label.text = @"This is a aligment label!";
    [self.view addSubview:label];
    self.num = 2;
    
    SpotLightButton *spot = [[SpotLightButton alloc] initWithFrame:CGRectMake(30, 300, 200, 50)];
    self.navigationItem.titleView = spot;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:nil];
    self.navigationItem.rightBarButtonItem = right;
}
- (void)showAlterView:(UIButton *) sender {
    NSString *str = nil;
    if (sender.tag == 2) str = @"Cancel";
    MyAlterView *alter = [[MyAlterView alloc] initWithTitle:@"My alterView" Content:@"It is my own custom alterview" sureButton:@"OK" cancelButton:str];
    [alter show];
}

- (void) viewDidAppear:(BOOL)animated {
 
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
