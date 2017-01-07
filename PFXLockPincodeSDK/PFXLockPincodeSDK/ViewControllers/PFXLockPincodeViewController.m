//
//  PFXLockPincodeViewController.m
//  PFXLockPincodeSDK
//
//  Created by PFXStudio on 2017. 1. 7..
//  Copyright © 2017년 PFXStudio. All rights reserved.
//

#import "PFXLockPincodeViewController.h"

@interface PFXLockPincodeViewController () <PFXLockPincodeViewDelegate>

@property (weak, nonatomic) IBOutlet PFXLockPincodeView *lockPincodeView;

@end

@implementation PFXLockPincodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button Actions

- (IBAction)touchedPincodeButton:(id)sender {
    NSInteger tag = [sender tag];
    [self.lockPincodeView appendingPincode:[@(tag) description]];
}

- (IBAction)touchedDeleteButton:(id)sender {
    [self.lockPincodeView removeLastPincode];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

- (void)lockScreenPincodeView:(PFXLockPincodeView *)lockScreenPincodeView didChangedPincode:(NSString *)pincode
{
    if ([self.pincode isEqualToString:pincode] == NO)
    {
        [lockScreenPincodeView initialize];
        [lockScreenPincodeView shake];
        
        return;
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
