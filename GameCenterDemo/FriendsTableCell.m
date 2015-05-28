//
//  FriendsTableCell.m
//  GameCenterDemo
//
//  Created by Tim Harris on 12/22/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "FriendsTableCell.h"

@implementation FriendsTableCell

NSString * const AddingFriendNotification = @"AddingFriendNotification";

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addFriend:(id)sender {
   // NSLog(@"%@", self);
    NSString *friendString = [NSString stringWithFormat:@"http://localhost:8000/user/friends/%@", self.idLabel.text];
    NSURL *friendAddURL = [NSURL URLWithString:friendString];
    NSURLRequest *friendReq = [NSURLRequest requestWithURL:friendAddURL];
    NSHTTPURLResponse *response = nil;
    //NSData *somedata =
    [NSURLConnection sendSynchronousRequest:friendReq returningResponse:&response error:nil];
    NSString *key = @"tableRowIndex";
    
    NSDictionary *tDict = [NSDictionary dictionaryWithObject:self forKey:key];
    [[NSNotificationCenter defaultCenter] postNotificationName:AddingFriendNotification object:self userInfo:tDict];
    //NSLog(@" %ld", (long)response.statusCode);
}

@end
