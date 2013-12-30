//
//  TabViewController.h
//  loadDemo
//
//  Created by Wei Wang on 12/22/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationTabBar.h"
@interface TabViewController : UIViewController <tabBarDelegate>
- (id) initWithViewArray:(NSArray *) viewArray imageArray:(NSArray *)imageArray;
@end
