//
//  SpotLightButton.m
//  loadDemo
//
//  Created by Wei Wang on 12/16/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "SpotLightButton.h"

@implementation SpotLightButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.spotlightCenter = CGPointMake(frame.size.width / 2, frame.size.height *(-1) + 10);
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSpotlightStartRadius:0];
        [self setSpotlightEndRadius:frame.size.width / 2];
    }
    frame.origin.y -= 2.0;
    self.title = [[UILabel alloc] initWithFrame:frame];
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.backgroundColor = [UIColor clearColor];
    self.title.textColor = [UIColor whiteColor];
    self.title.font = [UIFont boldSystemFontOfSize:20.0];
    self.title.shadowColor = [UIColor darkGrayColor];
    self.title.shadowOffset = CGSizeMake(0, -1);
    self.title.text = @"Menu";
    [self addSubview:self.title];
    
    self.arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_down"]];
    [self addSubview:self.arrow];
    return self;
}
- (void)layoutSubviews
{
    [self.title sizeToFit];
    self.title.center = CGPointMake(self.frame.size.width/2, (self.frame.size.height-2.0)/2);
    self.arrow.center = CGPointMake(CGRectGetMaxX(self.title.frame) + 13, self.frame.size.height / 2);
}
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    self.isActive = !self.isActive;
    CGGradientRef ref = [[self class] newGradientRef];
    [self setSpotlightGradientRef:ref];
    CGGradientRelease(ref);
    return YES;
}
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}
- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.spotlightGradientRef = nil;
}
- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    self.spotlightGradientRef = nil;
}
- (void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGGradientRef gradient = self.spotlightGradientRef;
    float radius = self.spotlightEndRadius;
    float startRadius = self.spotlightStartRadius;
    CGContextDrawRadialGradient (context, gradient, self.spotlightCenter, startRadius, self.spotlightCenter, radius, kCGGradientDrawsAfterEndLocation);

}
+ (CGGradientRef)newGradientRef {
    size_t location = 2;
    float locations [2] = {1.0,0.0};
    float compemts[12] = {0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.55};
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef newRef = CGGradientCreateWithColorComponents(space, compemts, locations, location);
    CGColorSpaceRelease(space);
    return newRef;
}
- (void) setSpotlightGradientRef:(CGGradientRef)spotlightGradientRef {
    CGGradientRelease(_spotlightGradientRef);
    _spotlightGradientRef = nil;
    
    _spotlightGradientRef = spotlightGradientRef;
    CGGradientRetain(_spotlightGradientRef);
    [self setNeedsDisplay];
}
@end
