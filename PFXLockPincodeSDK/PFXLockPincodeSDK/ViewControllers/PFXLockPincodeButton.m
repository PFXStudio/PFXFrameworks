//
//  PFXLockPincodeButton.m
//  PFXLockPincodeSDK
//
//  Created by PFXStudio on 2017. 1. 7..
//  Copyright © 2017년 PFXStudio. All rights reserved.
//

#import "PFXLockPincodeButton.h"

static const CGFloat kLineWidth = 0.8f;

@implementation PFXLockPincodeButton

- (void)setHighlighted:(BOOL)highlighted {
    if (super.highlighted == highlighted)
        return;

    super.highlighted = highlighted;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGFloat height = CGRectGetHeight(rect);
    CGRect  inset  = CGRectInset(CGRectMake(0, 0, height, height), 1, 1);

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorRef colorRef  = [self tintColor].CGColor;
    UIControlState state = [self state];

    CGContextSetLineWidth(context, kLineWidth);
    if (state == UIControlStateHighlighted) {
        CGContextSetFillColorWithColor(context, colorRef);
        CGContextFillEllipseInRect (context, inset);
        CGContextFillPath(context);
    }
    else {
        CGContextSetStrokeColorWithColor(context, colorRef);
        CGContextAddEllipseInRect(context, inset);
        CGContextStrokePath(context);
    }
}

@end
