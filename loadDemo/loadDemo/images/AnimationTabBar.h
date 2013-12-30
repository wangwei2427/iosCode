//
//  AnimationTabBar.h
//  loadDemo
//
//  Created by Wei Wang on 12/20/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tabBarDelegate <NSObject>

- (void)didSelectAtIndex:(NSInteger) index;

@end

@interface AnimationTabBar : UIView

@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) id<tabBarDelegate> delegate;

- (id)initWithFrame:(CGRect)frame imageArray:(NSArray *) imageArray;
@end
