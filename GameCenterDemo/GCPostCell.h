//
//  GCPostCell.h
//  GameCenterDemo
//
//  Created by Tim Harris on 12/9/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCPostCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userPointsCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatarImage;
@property (weak, nonatomic) IBOutlet UILabel *postMessageLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gameIconImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
