//
//  AligmentLabel.h
//  loadDemo
//
//  Created by Wei Wang on 12/14/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  enum textAligment {
    textAligmentTop,
    textAligmentCent,
    textAligmentBottom
}VerticalAlignment;

@interface AligmentLabel : UILabel
{
@private
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic) VerticalAlignment verticalAlignment;
@end
