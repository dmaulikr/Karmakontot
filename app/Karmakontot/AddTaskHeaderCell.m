//
//  AddTaskHeaderCell.m
//  Karmakontot
//
//  Created by Farshid Besharati on 2014-11-23.
//  Copyright (c) 2014 AllaUtomNiclas. All rights reserved.
//

#import "AddTaskHeaderCell.h"

@interface AddTaskHeaderCell()

@end

@implementation AddTaskHeaderCell

- (IBAction)editingDidEnd:(id)sender {
    UITextField *textField = (UITextField *)sender;
    
    if (self.headlineEditingDidEndBlock) {
        self.headlineEditingDidEndBlock(textField.text);
    }
    
}

@end
