//
//  DetailViewController.h
//  PFXSample
//
//  Created by PFXStudio on 2017. 1. 7..
//  Copyright © 2017년 PFXStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFXSample+CoreDataModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Event *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

