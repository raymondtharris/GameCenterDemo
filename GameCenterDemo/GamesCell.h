//
//  GamesCell.h
//  GameCenterDemo
//
//  Created by Tim Harris on 12/18/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamesCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *gameIconImage;
@property (weak, nonatomic) IBOutlet UILabel *gameNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameDevLabel;
@property (weak, nonatomic) IBOutlet UIImageView *trophyImage;
@property (weak, nonatomic) IBOutlet UILabel *achievementsLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentPointsLabel;

@end
