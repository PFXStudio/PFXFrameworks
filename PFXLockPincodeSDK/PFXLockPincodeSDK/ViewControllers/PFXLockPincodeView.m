//
//  PFXLockPincodeView.m
//  PFXLockPincodeSDK
//
//  Created by PFXStudio on 2017. 1. 7..
//  Copyright © 2017년 PFXStudio. All rights reserved.
//

#import "PFXLockPincodeView.h"

static const NSUInteger kMaxPincodeLength = 4;

@interface PFXLockPincodeView()

@property NSUInteger pincodeIndex;
@property (nonatomic, strong) NSString *pincode;

@end

@implementation PFXLockPincodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self initialize];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self initialize];
    
    return self;
}

- (void)initialize {
    
    self.enabled = YES;
    self.pincode = @"";
}

- (void)setPincode:(NSString *)pincode {
    if ([_pincode isEqualToString:pincode] == YES)
        return;
    
    _pincode = pincode;
    
    [self setNeedsDisplay];
    
    BOOL length = ([pincode length] == kMaxPincodeLength);
    if (length == NO)
        return;

    [self.delegate lockScreenPincodeView:self didChangedPincode:pincode];
}

- (void)appendingPincode:(NSString *)pincode {

    if (self.enabled == NO)
        return;

    NSString * appended = [self.pincode stringByAppendingString:pincode];
    NSUInteger length = MIN([appended length], kMaxPincodeLength);
    self.pincode = [appended substringToIndex:length];
}

- (void)removeLastPincode {
    if (self.enabled == NO)
        return;
    
    NSUInteger index = ([self.pincode length] - 1);
    if ([self.pincode length] > index) {
        self.pincode = [self.pincode substringToIndex:index];
    }
}

- (void)wasCompleted {
    for (NSUInteger idx = 0; idx < kMaxPincodeLength; idx++) {
        dispatch_time_t delayInSeconds = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(idx * 0.01f * NSEC_PER_SEC));
        dispatch_after(delayInSeconds, dispatch_get_main_queue(), ^(void){
            
            self.pincodeIndex++;
            [self setNeedsDisplay];
        });
    }
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self.pincodeColor setFill];
    
    // 1 character box size
    CGSize boxSize  = CGSizeMake(CGRectGetWidth(rect) / kMaxPincodeLength, CGRectGetHeight(rect));
    CGSize charSize = CGSizeMake(13, 13);
    
    CGFloat y = rect.origin.y;
    
    NSUInteger completed = MAX([self.pincode length], self.pincodeIndex);
    
    // draw a circle : '.'
    NSInteger str = MIN(completed, kMaxPincodeLength);
    for (NSUInteger idx = 0; idx < str; idx++) {
        CGFloat x = boxSize.width * idx;
        CGRect rounded = CGRectMake(x + floorf((boxSize.width  - charSize.width) / 2),
                                    y + floorf((boxSize.height - charSize.width) / 2),
                                    charSize.width,
                                    charSize.height);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, self.pincodeColor.CGColor);
        CGContextSetLineWidth(context, 1.0);
        CGContextFillEllipseInRect(context, rounded);
        CGContextFillPath(context);
    }
    
    // draw a dash : '-'
    for (NSUInteger idx = str; idx < kMaxPincodeLength; idx++) {
        CGFloat x = boxSize.width * idx;
        CGRect rounded = CGRectMake(x + floorf((boxSize.width  - charSize.width)  / 2),
                                    y + floorf((boxSize.height - charSize.height) / 2),
                                    charSize.width,
                                    charSize.height);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, self.pincodeColor.CGColor);
        CGContextSetLineWidth(context, 1.0);
        CGContextAddEllipseInRect(context, rounded);
        CGContextStrokePath(context);
    }
}

@end
