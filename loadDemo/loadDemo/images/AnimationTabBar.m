//
//  AnimationTabBar.m
//  loadDemo
//
//  Created by Wei Wang on 12/20/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "AnimationTabBar.h"

#define TABS_PER_ROW 4
#define MORE_BUTTON_INDEX 3
#define TAB_HEIGHT 50

@interface AnimationTabBar()
@property (nonatomic, strong) UIView *backgoundView;
@property (nonatomic, strong) UIView *downView;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, assign) CGRect downRect;
@end

@implementation AnimationTabBar

- (id)initWithFrame:(CGRect)frame imageArray:(NSArray *) imageArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.buttons = [NSMutableArray arrayWithCapacity:imageArray.count];
        self.backgroundColor = [UIColor clearColor];
        self.backgoundView = [[UIView alloc] initWithFrame:self.bounds];
        self.backgoundView.backgroundColor = [UIColor redColor];
        self.downRect = CGRectMake(self.frame.origin.x, self.frame.origin.y + TAB_HEIGHT, self.frame.size.width, TAB_HEIGHT);
        self.downView = [[UIView alloc] initWithFrame:self.downRect];
        self.downView.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.backgoundView];
        [self addSubview:self.downView];
        
        UIButton *tabButton;
		CGFloat width = 320.0f / TABS_PER_ROW;
		for (int i = 0; i < [imageArray count]; i++)
		{
            NSInteger index = i % TABS_PER_ROW;
            NSInteger page = i / TABS_PER_ROW;
            
			tabButton = [UIButton buttonWithType:UIButtonTypeCustom];
			tabButton.showsTouchWhenHighlighted = YES;
			tabButton.tag = i;
			tabButton.frame = CGRectMake(width * index , 0, width, 45);
			[tabButton setImage:[UIImage imageNamed:[imageArray objectAtIndex:i]] forState:UIControlStateNormal];
			[tabButton setImage:[UIImage imageNamed:[imageArray objectAtIndex:i]]forState:UIControlStateSelected];
            
			[tabButton setBackgroundImage:[UIImage imageNamed:@"tab_bar_selected"] forState:UIControlStateSelected];
            
            [tabButton setBackgroundImage:[UIImage imageNamed:@"tab_bar_selected"] forState:UIControlStateHighlighted];
			[tabButton addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
			[self.buttons addObject:tabButton];
            NSLog(@"page = %d",page);
            if (page == 0) {
                [self.backgoundView addSubview:tabButton];
            } else {
                NSLog(@"%@",NSStringFromCGRect(tabButton.frame));
                [self.downView addSubview:tabButton];
            }
		}
    }
    return self;
}
- (void)tabBarButtonClicked:(UIButton *) button {
    NSLog(@"%d have been click",button.tag);
    for (int i = 0; i < self.buttons.count; i++) {
         UIButton *tmpeButton = self.buttons[i];
        if (button.tag == tmpeButton.tag) {
            tmpeButton.selected = YES;
        } else {
            tmpeButton.selected = NO;
        }
        if (button.tag == 3) {
            [self downAnmation];
        } else if(button.tag == 7) {
            [self upAnimation];
        }
    }
    int index = button.tag;
    if (index !=3 && index != 7) {
        if (button.tag > 3) {
            index = button.tag - 1;
        }
        if ([self.delegate respondsToSelector:@selector(didSelectAtIndex:)]) {
            [self.delegate didSelectAtIndex:index];
        }
    }
}
- (void)downAnmation {
    [UIView animateWithDuration:0.3 animations:^{
        self.backgoundView.frame = self.downRect;
        self.downView.frame = self.bounds;
    }];
}
- (void) upAnimation {
   [UIView animateWithDuration:0.3 animations:^{
       self.backgoundView.frame = self.bounds;
       self.downView.frame = self.downRect;
   }];
}
@end
