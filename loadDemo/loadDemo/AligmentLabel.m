//
//  AligmentLabel.m
//  loadDemo
//
//  Created by Wei Wang on 12/14/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "AligmentLabel.h"

@implementation AligmentLabel
@synthesize verticalAlignment = verticalAlignment_;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.verticalAlignment = textAligmentCent;
    }
    return self;
}
- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    verticalAlignment_ = verticalAlignment;
    [self setNeedsDisplay];
}
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
   
    CGRect textFrame = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    
    switch (self.verticalAlignment) {
        case textAligmentTop:
            textFrame.origin.y = bounds.origin.y;
            break;
        case textAligmentCent:
            textFrame.origin.y = bounds.origin.y + bounds.size.height / 2;
            break;
        case textAligmentBottom:
            textFrame.origin.y = bounds.origin.y + bounds.size.height;
            break;
        default:
            break;
    }
    return textFrame;
}
- (void)drawTextInRect:(CGRect)rect
{
    CGRect acutalRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:acutalRect];
}

@end
