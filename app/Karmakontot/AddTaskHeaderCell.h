//
//  AddTaskHeaderCell.h
//  Karmakontot
//
//  Created by Farshid Besharati on 2014-11-23.
//  Copyright (c) 2014 AllaUtomNiclas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTaskHeaderCell : UITableViewCell

@property (nonatomic, copy) void (^headlineEditingDidEndBlock)(NSString *headerText);

- (void)setHeadlineEditingDidEndBlock:(void (^)(NSString *headerText))headlineEditingDidEndBlock;

@end
