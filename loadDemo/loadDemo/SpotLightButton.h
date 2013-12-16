//
//  SpotLightButton.h
//  loadDemo
//
//  Created by Wei Wang on 12/16/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpotLightButton : UIControl
@property (nonatomic, assign) BOOL isActive;
@property (nonatomic, assign) CGGradientRef spotlightGradientRef;
@property (nonatomic, assign) CGFloat spotlightStartRadius;
@property (nonatomic, assign) float spotlightEndRadius;
@property (nonatomic, assign) CGPoint spotlightCenter;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIImageView *arrow;
@end
