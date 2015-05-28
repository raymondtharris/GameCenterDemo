//
//  FriendsTableCell.h
//  GameCenterDemo
//
//  Created by Tim Harris on 12/22/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString * const AddingFriendNotification;

@interface FriendsTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *friendNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *friendAvatarImage;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)addFriend:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *indexRowLabel;

@end
