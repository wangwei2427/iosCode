//
//  ViewController.m
//  loadDemo
//
//  Created by Wei Wang on 12/13/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "LoadViewController.h"

@interface CustomLayer : CALayer

@property (nonatomic, assign) CGRect  ovalRect;
@property (nonatomic, assign) int lineWidth;
@property (nonatomic, strong) UIColor *colorLine;
@property (nonatomic, strong) NSArray *angleArray;
@end

@implementation CustomLayer
- (id) initWithFrame:(CGRect)frame withAngleArray:(NSArray *)array
{
    if (self = [super init]) {
        
        self.angleArray = array;

    }
    return self;
}

- (void)drawInContext:(CGContextRef)theContext
{
    
    for (int i = 0; i < 4; i++) {
        
        CGFloat angle = [self.angleArray[i] floatValue];
        UIBezierPath* ovalPath = [UIBezierPath bezierPath];
        [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(self.ovalRect), CGRectGetMidY(self.ovalRect)) radius: CGRectGetWidth(self.ovalRect) / 2 startAngle: angle * M_PI/180 endAngle: (angle + 60) * M_PI/180 clockwise: YES];
        CGContextAddPath(theContext, ovalPath.CGPath);
    }
    
    CGContextSetLineWidth(theContext,self.lineWidth);
    CGContextSetStrokeColorWithColor(theContext, self.colorLine.CGColor);
    CGContextStrokePath(theContext);
    
}

@end


@interface LoadViewController ()
@property (nonatomic, strong) CustomLayer *customLayer;
@property (nonatomic, strong) CustomLayer *customLayer1;
@end

@implementation LoadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor redColor];
    NSArray *array = [NSArray arrayWithObjects:@"195",@"285",@"15",@"105", nil];
    self.customLayer = [[CustomLayer alloc] initWithFrame:self.view.bounds withAngleArray:array];
    NSArray *array1 = [NSArray arrayWithObjects:@"190",@"280",@"10",@"100", nil];
    self.customLayer1 = [[CustomLayer alloc] initWithFrame:self.view.bounds withAngleArray:array1];
    [self.view.layer addSublayer:self.customLayer];
    [self.view.layer addSublayer:self.customLayer1];
    
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    [button setTitle: @"按钮" forState: UIControlStateNormal];
    [button sizeToFit];
    self.navigationItem.titleView = button;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    self.customLayer.backgroundColor = [[UIColor clearColor] CGColor];
    self.customLayer.frame = CGRectInset(self.view.bounds, 0.0f, 0.0f);
    int scale = self.view.frame.size.width * 0.15;
    self.customLayer.ovalRect = CGRectMake(scale , scale, self.view.frame.size.width - 2*scale,  self.view.frame.size.height - 2*scale);
    self.customLayer.lineWidth = self.view.frame.size.width * 0.08;
    self.customLayer.colorLine = [UIColor greenColor];
    [self.customLayer setNeedsDisplay];
    
    self.customLayer1.backgroundColor = [[UIColor clearColor] CGColor];
    self.customLayer1.frame = CGRectInset(self.view.bounds, 0.0f, 0.0f);
    int scale1 = self.view.frame.size.width * 0.25;
    self.customLayer1.ovalRect = CGRectMake(scale1 , scale1, self.view.frame.size.width - 2*scale1,  self.view.frame.size.height - 2*scale1);
    self.customLayer1.lineWidth = self.view.frame.size.width * 0.08;
    self.customLayer1.colorLine = [UIColor orangeColor];
    [self.customLayer1 setNeedsDisplay];

    self.navigationController.navigationItem.title = @"123456";
}
- (void) viewDidAppear:(BOOL)animated {
   
    [super viewDidAppear:YES];
     
    [self.customLayer addAnimation:[self animation:-1] forKey:nil];
    
    [self.customLayer1 addAnimation:[self animation:1] forKey:nil];
    
    

}
- (CABasicAnimation *) animation:(int) index {
   
    //rotation,scale,translation.
    
    float angle = index > 0 ? MAXFLOAT : -MAXFLOAT;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = [NSNumber numberWithInt:0];
    animation.toValue = [NSNumber  numberWithFloat:angle];
    animation.duration = 0.4 * MAXFLOAT;
    animation.removedOnCompletion = YES;
    [self.customLayer addAnimation:animation forKey:nil];
    return animation;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
