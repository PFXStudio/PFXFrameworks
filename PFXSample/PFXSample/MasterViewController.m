//
//  MasterViewController.m
//  PFXSample
//
//  Created by PFXStudio on 2017. 1. 7..
//  Copyright © 2017년 PFXStudio. All rights reserved.
//

#import "MasterViewController.h"

#define kLockPincode @"LockPincode"

@interface MasterViewController ()

@property (strong, nonatomic) NSMutableArray *menus;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.menus = [NSMutableArray arrayWithObjects:kLockPincode, nil];
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.menus count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSString *text = [self.menus objectAtIndex:indexPath.row];
    [cell.textLabel setText:text];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [self.menus objectAtIndex:indexPath.row];
    if ([text isEqualToString:kLockPincode] == YES)
    {
        PFXLockPincodePlugin *lockPincodePlugin = [PFXLockPincodePlugin new];
        [lockPincodePlugin executeWithInfo:nil completion:^(NSDictionary *resultDict) {
            
        } failure:^(NSError *error) {
            
        }];
        
        return;
    }
}


@end
