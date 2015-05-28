//
//  MyGCGame.h
//  GameCenterDemo
//
//  Created by Tim Harris on 12/19/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "GCGame.h"

@interface MyGCGame : GCGame{
    NSString *dev;
    NSNumber *currPoints, *maxPoints, *currAchievments, *maxAchievments;
    NSDate *gameDate;
}
@property NSString *dev;
@property NSNumber *currPoints, *maxPoints, *currAchievments, *maxAchievments;
@property NSDate *gameDate;

-(void)setDev:(NSString *)aDev;
-(NSString *)dev;
-(void)setCurrPoints:(NSNumber *)theCurrPoints;
-(NSNumber *)currPoints;
-(void)setMaxPoints:(NSNumber *)theMaxPoints;
-(NSNumber *)maxPoints;
-(void)setCurrAchievments:(NSNumber *)theCurrAchievments;
-(NSNumber *)currAchievments;
-(void)setMaxAchievments:(NSNumber *)theMaxAchievments;
-(NSNumber *)maxAchievments;
-(void)setGameDate:(NSDate *)aGameDate;
-(NSDate *)gameDate;
@end
