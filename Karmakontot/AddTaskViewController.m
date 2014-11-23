//
//  AddTaskViewController.m
//  Karmakontot
//
//  Created by Farshid Besharati on 2014-11-23.
//  Copyright (c) 2014 AllaUtomNiclas. All rights reserved.
//

#import "AddTaskViewController.h"
#import "AddTaskHeaderCell.h"
#import "AddTaskContentCell.h"

@interface AddTaskViewController ()

@property (nonatomic, strong) AddTaskContentCell *contentCell;

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100.0f;
    }
    
    return 252.0f;
}

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        AddTaskHeaderCell *headlineCell = (AddTaskHeaderCell *)cell;
        
        [headlineCell setHeadlineEditingDidEndBlock:^(NSString *headerText) {
            NSLog(@"Hello");
        }];
    } else {
        AddTaskContentCell *contentCell = (AddTaskContentCell *)cell;
        self.contentCell = contentCell;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"HeadlineCell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ContentCell" forIndexPath:indexPath];
    }
    
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}

- (void)newTaskWithLocation:(CLLocationCoordinate2D)location {
    
}


#pragma mark - EXIT LULZ

- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)postAndReturn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        ;
    }];
}

@end
