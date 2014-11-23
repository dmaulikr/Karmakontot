//
//  KarmaHeaderView.m
//  Karmakontot
//
//  Created by Farshid Besharati on 2014-11-23.
//  Copyright (c) 2014 AllaUtomNiclas. All rights reserved.
//

#import "KarmaHeaderView.h"
#import <FacebookSDK/FacebookSDK.h>

@interface KarmaHeaderView()

@property (nonatomic, strong) FBProfilePictureView *profileImageView;
@property (nonatomic, strong) UILabel *karmaCountLabel;

@end

@implementation KarmaHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self layout];
    }
    
    return self;
}

- (void)layout {
//    _profileImageView = [[FBProfilePictureView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.origin.x+33, self.frame.origin.y+33)];
    _profileImageView = [[FBProfilePictureView alloc] initWithFrame:CGRectMake(self.frame.size.width/2-16, self.frame.origin.y, 32, 32)];
    _profileImageView.layer.cornerRadius = _profileImageView.frame.size.width/2;
    _profileImageView.layer.borderColor = [UIColor grayColor].CGColor;
    _profileImageView.layer.borderWidth = 0.5;
    [self addSubview:_profileImageView];
    
//    _karmaCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(_profileImageView.frame.origin.x+36, self.frame.origin.y, self.frame.size.width-_profileImageView.frame.size.width, _profileImageView.frame.size.height)];
//    _karmaCountLabel.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:_karmaCountLabel];
}

- (void)setProfilePicture:(NSString *)profileId {
    [self.profileImageView setProfileID:profileId];
}

- (void)setKarmaCount:(NSString *)karma {
//    [self.karmaCountLabel setText:karma];
}

@end
