//
//  MyGCGame.m
//  GameCenterDemo
//
//  Created by Tim Harris on 12/19/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "MyGCGame.h"

@implementation MyGCGame
@synthesize dev=_dev, currPoints=_currPoints, maxPoints=_maxPoints, currAchievments=_currAchievments, maxAchievments=_maxAchievments, gameDate = _gameDate;

-(void)setDev:(NSString *)aDev{
    _dev=aDev;
}
-(NSString *)dev{
    return _dev;
}
-(void)setCurrPoints:(NSNumber *)theCurrPoints{
    _currPoints = theCurrPoints;
}
-(NSNumber *)currPoints{
    return _currPoints;
}
-(void)setMaxPoints:(NSNumber *)theMaxPoints{
    _maxPoints = theMaxPoints;
}
-(NSNumber *)maxPoints{
    return _maxPoints;
}
-(void)setCurrAchievments:(NSNumber *)theCurrAchievments{
    _currAchievments =theCurrAchievments;
}
-(NSNumber *)currAchievments{
    return _currAchievments;
}
-(void)setMaxAchievments:(NSNumber *)theMaxAchievments{
    _maxAchievments = theMaxAchievments;
}
-(NSNumber *)maxAchievments{
    return _maxAchievments;
}

-(void)setGameDate:(NSDate *)aGameDate{
    _gameDate = aGameDate;
}
-(NSDate *)gameDate{
    return _gameDate;
}

@end
