//
//  ViewController.m
//  loadDemo
//
//  Created by Wei Wang on 12/13/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "ViewController.h"

@interface CustomLayer : CALayer

@property (nonatomic, assign)CGRect  ovalRect;
@property (nonatomic, assign)int lineWidth;
@property (nonatomic, strong) UIColor *colorLine;
@end

@implementation CustomLayer

- (void)drawInContext:(CGContextRef)theContext
{
    
    //// Oval 1 Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
    [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(self.ovalRect), CGRectGetMidY(self.ovalRect)) radius: CGRectGetWidth(self.ovalRect) / 2 startAngle: 195 * M_PI/180 endAngle: 255 * M_PI/180 clockwise: YES];
    
    CGContextAddPath(theContext, ovalPath.CGPath);
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPath];
    [oval2Path addArcWithCenter: CGPointMake(CGRectGetMidX(self.ovalRect), CGRectGetMidY(self.ovalRect)) radius: CGRectGetWidth(self.ovalRect) / 2 startAngle: 285 * M_PI/180 endAngle: 345 * M_PI/180 clockwise: YES];
    
    CGContextAddPath(theContext, oval2Path.CGPath);
//
    // Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPath];
    [oval3Path addArcWithCenter: CGPointMake(CGRectGetMidX(self.ovalRect), CGRectGetMidY(self.ovalRect)) radius: CGRectGetWidth(self.ovalRect) / 2 startAngle: 15 * M_PI/180 endAngle: 75 * M_PI/180 clockwise: YES];
//    
    CGContextAddPath(theContext, oval3Path.CGPath);
//    
//    //// Oval 4 Drawing
    UIBezierPath* oval4Path = [UIBezierPath bezierPath];
    [oval4Path addArcWithCenter: CGPointMake(CGRectGetMidX(self.ovalRect), CGRectGetMidY(self.ovalRect)) radius: CGRectGetWidth(self.ovalRect) / 2 startAngle: 105 * M_PI/180 endAngle: 165 * M_PI/180 clockwise: YES];

   CGContextAddPath(theContext, oval4Path.CGPath);
    
    CGContextSetLineWidth(theContext,self.lineWidth);
    CGContextSetStrokeColorWithColor(theContext, self.colorLine.CGColor);
    CGContextStrokePath(theContext);
    
}

@end


@interface ViewController ()
@property (nonatomic, strong) CustomLayer *customLayer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    view.backgroundColor = [UIColor redColor];
    self.customLayer = [[CustomLayer alloc] init];
    [view.layer addSublayer:self.customLayer];
    [self.view addSubview:view];
}
- (void)viewWillAppear:(BOOL)animated {

    self.customLayer.backgroundColor = [[UIColor clearColor] CGColor];
    self.customLayer.frame = CGRectInset(self.view.bounds, 0.0f, 0.0f);
    int scale = self.view.frame.size.width * 0.15;
    self.customLayer.ovalRect = CGRectMake(scale , scale, self.view.frame.size.width - 2*scale,  self.view.frame.size.height - 2*scale);
    self.customLayer.lineWidth = self.view.frame.size.width * 0.08;
    self.customLayer.colorLine = [UIColor greenColor];
    [self.customLayer setNeedsDisplay];
    
    // rotation,scale,translation.
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = [NSNumber numberWithInt:0];
    animation.toValue = [NSNumber  numberWithFloat:- MAXFLOAT];
    animation.duration = 0.4 * MAXFLOAT;
    animation.removedOnCompletion = YES;
    [self.customLayer addAnimation:animation forKey:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
