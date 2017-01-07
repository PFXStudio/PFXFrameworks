//
//  PFXLockPincodeView.h
//  PFXLockPincodeSDK
//
//  Created by PFXStudio on 2017. 1. 7..
//  Copyright © 2017년 PFXStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PFXLockPincodeViewDelegate;

IB_DESIGNABLE
@interface PFXLockPincodeView : UIView

@property (nonatomic, weak) IBOutlet id<PFXLockPincodeViewDelegate> delegate;
@property (nonatomic, strong) IBInspectable UIColor * pincodeColor;
@property (nonatomic, unsafe_unretained) IBInspectable BOOL enabled;

- (void)initialize;
- (void)appendingPincode:(NSString *)pincode;
- (void)removeLastPincode;
- (void)wasCompleted;

@end

@protocol PFXLockPincodeViewDelegate<NSObject>
@required

- (void)lockScreenPincodeView:(PFXLockPincodeView *)lockScreenPincodeView didChangedPincode:(NSString *)pincode;

@end
