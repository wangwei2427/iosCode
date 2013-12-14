//
//  MyAlterView.m
//  loadDemo
//
//  Created by Wei Wang on 12/13/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "MyAlterView.h"

#define alterViewWidth 240
#define alterViewHeight 160

@interface MyAlterView()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) UIButton *cancelButton;

@end
@implementation MyAlterView

- (MyAlterView *) initWithTitle:(NSString *)title Content:(NSString *)content sureButton:(NSString *)sureButtonName cancelButton:(NSString *)cancelButtonName{
    if (self = [super init]) {
    self.backgroundColor = [UIColor orangeColor];
    
    self.frame = CGRectMake(0, -alterViewHeight, alterViewWidth, alterViewHeight);
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 220, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = title;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 220, 60)];
    contentLabel.numberOfLines = 3;
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    contentLabel.adjustsFontSizeToFitWidth = YES;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.text = content;
    [self addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
   [okButton setFrame:CGRectMake(30, 130, 180, 20)];
   okButton.tag = 1;
   okButton.backgroundColor = [UIColor greenColor];
   [okButton setBackgroundColor: [UIColor colorWithRed:87.0/255.0 green:135.0/255.0 blue:173.0/255.0 alpha:1]];
   [okButton setTitle:@"OK" forState:UIControlStateNormal];
   [okButton addTarget:self action:@selector(OkorCancel:) forControlEvents:UIControlEventTouchUpInside];
   [self addSubview:okButton];   
    if (cancelButtonName != nil) {
        [okButton setFrame:CGRectMake(30, 130, 80, 20)];
        
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelButton setFrame:CGRectMake(120, 130, 80, 20)];
        cancelButton.tag = 2;
        [cancelButton setBackgroundColor:[UIColor colorWithRed:227.0/255.0 green:100.0/255.0 blue:83.0/255.0 alpha:1]];
         [cancelButton addTarget:self action:@selector(OkorCancel:) forControlEvents:UIControlEventTouchUpInside];
        [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
        [self addSubview:cancelButton];
    }
        self.layer.cornerRadius = 4.0f;
        self.clipsToBounds = YES;
}
    
    return self;
}
- (void)OkorCancel:(UIButton *) sender {
    [self dismissAlterView];
}
- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
}
- (void)dismissAlterView {
  [self removeFromSuperview];
}

- (void)removeFromSuperview {
    
    UIWindow *shareWindow = [UIApplication sharedApplication].keyWindow;
    
   CGRect afterFrame = CGRectMake((CGRectGetWidth(shareWindow.bounds) - 240) * 0.5, CGRectGetHeight(shareWindow.bounds), 240,160);
    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame = afterFrame;
        self.transform = CGAffineTransformMakeRotation(-M_1_PI / 1.5);
    } completion:^(BOOL finished) {
        [super removeFromSuperview];
    }];
}
- (void) addSubview:(UIView *)view {
    UIWindow *shareWindow = [UIApplication sharedApplication].keyWindow;
    
    view.transform = CGAffineTransformMakeRotation(-M_1_PI / 2);
    CGRect afterFrame = CGRectMake((CGRectGetWidth(shareWindow.bounds) - 240) * 0.5, 100, 240,160);
    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame = afterFrame;
        view.transform = CGAffineTransformMakeRotation(0);
    } completion:^(BOOL finished) {
        [super addSubview:view];
    }];
}


@end
