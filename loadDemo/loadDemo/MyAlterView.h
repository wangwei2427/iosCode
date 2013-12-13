//
//  MyAlterView.h
//  loadDemo
//
//  Created by Wei Wang on 12/13/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MyAlterView : UIView
- (MyAlterView *)initWithTitle:(NSString *) title Content:(NSString *) content
                     sureButton:(NSString *) sureButtonName cancelButton:(NSString *) cancelButtonName ;

- (void)show;
@end
