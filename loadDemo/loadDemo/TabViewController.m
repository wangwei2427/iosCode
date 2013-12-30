//
//  TabViewController.m
//  loadDemo
//
//  Created by Wei Wang on 12/22/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "TabViewController.h"
@interface TabViewController ()
@property (nonatomic, strong) NSArray *viewArray;
@property (nonatomic, assign) int selectedIndex;
@property (nonatomic, strong) AnimationTabBar *animationTabBar;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *transformView;
@end

@implementation TabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor greenColor];
    }
    return self;
}
- (id) initWithViewArray:(NSArray *) viewArray imageArray:(NSArray *)imageArray {
    self = [super init];
    if (self) {
        NSArray *viewsArray = [[NSArray alloc] initWithArray:viewArray];
        self.viewArray = viewsArray;
        
        UIView *containerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
        containerView.backgroundColor = [UIColor greenColor];
		self.containerView = containerView;
        
		UIView *transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, self.containerView.frame.size.height - 25)];
        transitionView.backgroundColor = [UIColor blackColor];
        self.transformView = transitionView;
        
        AnimationTabBar *tabBar = [[AnimationTabBar alloc] initWithFrame:CGRectMake(0, self.containerView.frame.size.height - 25, 320, 45) imageArray:imageArray];
        tabBar.delegate = self;
        self.animationTabBar = tabBar;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.containerView addSubview:self.transformView];
    [self.containerView addSubview:self.animationTabBar];
    self.view = self.containerView;
    [self didSelectAtIndex:0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectAtIndex:(NSInteger) index {
    NSLog(@"index = %d",index);
        UIViewController *vc = self.viewArray[index];
    for (UIView *view in self.transformView.subviews) {
        view.hidden = YES;
    }
    vc.view.hidden = NO;
    vc.view.frame = self.transformView.frame;
    if ([vc.view isDescendantOfView:self.transformView]) {
        [self.transformView bringSubviewToFront:vc.view];
    } else {
        [self.transformView addSubview:vc.view];
    }
}

@end
